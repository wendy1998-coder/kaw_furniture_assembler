package nl.gaia.dao;

import javax.naming.Context;
import javax.naming.InitialContext;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static nl.gaia.dao.DatabaseConnectable.cleanUp;

public interface SqlManager {

    /**
     * Create database connection.
     * @return an SQL Connection object with the specified database
     * @throws DatabaseException, when connection cannot be made.
     */
    default Connection getConnection() throws Exception {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Context env = (Context) new InitialContext().lookup("java:comp/env");
            return DriverManager.getConnection(env.lookup("database-url").toString(),
                    env.lookup("database-user").toString(),
                    env.lookup("database-password").toString());
        } catch (SQLException e) {
            throw new DatabaseException("GetConnection - SQLException: " + e.getMessage());
        } catch (Exception e) {
            throw new Exception("ConnectionManager - GetConnection: " + e.getMessage());
        }
    }

    /**
     * Prepare all the statements with their query and parameters.
     * @param sql the query
     * @param parameters the parameters for the query, can be null
     * @return the prepared statement
     * @throws DatabaseException if something goes wrong
     */
    default PreparedStatement prepareStatement(String sql, HashMap<Integer, List<String>> parameters) throws Exception {
        PreparedStatement stmt = null;
        try {
            Connection conn = ConnectionManager.defaultManager().getConnection();
            // prepare statement
            stmt = conn.prepareStatement(sql);
            if (parameters != null) {
                // insert parameters with set... to prevent sql injection from happening
                for (Map.Entry<Integer, List<String>> parameter: parameters.entrySet()) {
                    List<String> values = parameter.getValue();
                    switch (values.get(1)) {
                        case "string":
                            stmt.setString(parameter.getKey(), values.get(0));
                            break;
                        case "int":
                            stmt.setInt(parameter.getKey(), Integer.parseInt(values.get(0)));
                            break;
                        case "double":
                            stmt.setDouble(parameter.getKey(), Double.parseDouble(values.get(0)));
                            break;
                        case "date":
                            stmt.setDate(
                                    parameter.getKey(),
                                    Date.valueOf(
                                            convertDateToMysqlDate(values.get(0))
                                    )
                            );
                            break;
                    }
                }
            }

            return stmt;
        } catch (SQLException e) {
            cleanUp(stmt, null, true);
            throw new DatabaseException("ConnectionManager: prepareStatement - SQLException: " + e.getMessage());
        }
    }

    /**
     * Used to execute update statements
     * @param sql the query
     * @param parameters the parameters for the query, can be null
     * @throws DatabaseException if something goes wrong
     */
    default void executeUpdate(String sql, HashMap<Integer, List<String>> parameters) throws Exception {
        PreparedStatement stmt = null;
        try {
            stmt = prepareStatement(sql, parameters);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new DatabaseException("ConnectionManager: executeUpdate - SQLException: " + e.getMessage());
        } finally {
            cleanUp(stmt, null, true);
        }
    }

    /**
     * Used to execute query statements
     * @param sql the query
     * @param parameters the parameters for the query, can be null
     * @return a hashmap with the column name as key and a list with two things in it as values:
     *                                    first index is the java class of the values in that column,
     *                                    second index is a list with the values as objects
     * @throws DatabaseException if something goes wrong
     */
    default HashMap<String, List<String>> executeQuery(String sql, HashMap<Integer, List<String>> parameters) throws Exception {
        ResultSet rs = null;
        PreparedStatement stmt = null;
        try {
            stmt = prepareStatement(sql, parameters);
            rs = stmt.executeQuery();
            return turnResultsetIntoHashmap(rs, stmt);
        } catch (SQLException e) {
            throw new DatabaseException("ConnectionManager: executeQuery - SQLException: " + e.getMessage());
        } finally {
            if (rs == null) {
                cleanUp(stmt, null, true);
            }
        }
    }

    default HashMap<String, List<String>> turnResultsetIntoHashmap(ResultSet rs, PreparedStatement stmt) throws DatabaseException {
        try {
            ResultSetMetaData metaData = rs.getMetaData();
            // set up the hashmap
            HashMap<String, List<String>> out = new HashMap<>();

            for (int i = 1; i <= metaData.getColumnCount(); i++) {
                String columnName = metaData.getColumnName(i);
                out.put(columnName, new ArrayList<>());
            }

            while(rs.next()) {
                for (String columnName: out.keySet()) {
                    out.get(columnName).add(rs.getString(columnName));
                }
            }
            return out;
        } catch (SQLException e) {
            throw new DatabaseException("ConnectionManager: turnResultsetIntoHashmap - SQLException: " + e.getMessage());
        } finally {
            cleanUp(stmt, rs, true);
        }
    }

    /**
     * Because the dates go down one day when prepared into a statement???, a day has te be added before that
     * @param date the date to convert in string format yyyy-mm-dd
     * @return date string ready for statement prep
     */
    default String convertDateToMysqlDate(String date) {
        String[] splt = date.split("-");
        // turn dateString into local date and use plusDay one to add a single day
        LocalDate localDate = LocalDate.of(
                Integer.parseInt(splt[0]),
                Integer.parseInt(splt[1]),
                Integer.parseInt(splt[2]))
                .plusDays(1);
        return localDate.toString();
    }
}
