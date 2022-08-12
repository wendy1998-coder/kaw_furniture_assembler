package nl.gaia.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Class for cleaning up database connections
 */
public class DatabaseConnectable {

	/**
     * Releases the necessary resources after the database was accessed.
     * Needs to be called in the "finally" clause after each DB call
     * @param stmt The prepared statement used
     *             (Can be null, be probably not)
     * @param rs   The result set returned by the database.
     *             (Can be null)
	 * @param closeConn whether to close the database connection with which the other arguments were made
     */
    public static void cleanUp(PreparedStatement stmt, ResultSet rs, boolean closeConn) throws DatabaseException {
        // close what needs to be closed
        if (rs != null) {
            try {
            	if (!rs.isClosed()) {
            		rs.close();
            	}
            } catch (SQLException e) {
            	throw new DatabaseException("CleanUp - SQLException: " + e.getMessage());
            }
        }
        
        if (stmt != null) {
        	try {
    			Connection conn = stmt.getConnection();
    			if (!stmt.isClosed()) {
    				stmt.close();
    			}
    			if(!conn.isClosed() && closeConn) {
    				conn.close();
    			}
    		} catch (SQLException e) {
    			throw new DatabaseException("CleanUp - SQLException: " + e.getMessage());
    		}
        }
    }
}
