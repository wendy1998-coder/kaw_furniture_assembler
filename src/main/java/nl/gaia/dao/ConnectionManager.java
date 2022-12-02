package nl.gaia.dao;

import com.beust.jcommander.Strings;
import nl.gaia.pojo.FurniturePiece;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import static nl.gaia.pojo.FurniturePiece.convertSqlResultToPieces;
import static nl.gaia.pojo.FurniturePiece.fieldNameSqlNameMapping;

public class ConnectionManager implements SqlManager {
    private static ConnectionManager singletonInstance = null;
    private String viewSql = null;
    private LocalDate lastCached = null;
    private HashMap<Integer, FurniturePiece> cachedPieces = new HashMap<>();

    /**
     * Private constructor so only singletonInstance can be used.
     */
    private ConnectionManager() {};

    /**
     * Make sure only one instance of this class exists in this program.
     * @return The single instance of this class
     */
    public static ConnectionManager defaultManager() {
        if (singletonInstance == null) {
            singletonInstance = new ConnectionManager();
        }
        return singletonInstance;
    }


    /**
     * Returns all cached furniture pieces, if cache is a day or more old, refresh it first
     * @return the cached pieces
     * @throws Exception if something goes wrong.
     */
    public HashMap<Integer, FurniturePiece> getAllPieces() throws Exception {
        LocalDate now = LocalDate.now();
        LocalDate yesterday = now.minusDays(1);
        if (cachedPieces == null || lastCached == null
                || lastCached.isBefore(yesterday) || lastCached.isEqual(yesterday)) {
            String sql = getViewSql();
            HashMap<String, List<String>> result = executeQuery(sql, null);
            cachedPieces = convertSqlResultToPieces(result);
            lastCached = now;
        }
        return cachedPieces;
    }

    public int[] getFilteredPieces(String slot, String name, String set) throws Exception {
        StringBuilder sql = new StringBuilder("SELECT id FROM Furniture_piece");
        HashMap<Integer, List<String>> parameters = new HashMap<>();
        if (!Strings.isStringEmpty(slot) ||
                !Strings.isStringEmpty(name) ||
                !Strings.isStringEmpty(set)) {
            sql.append(" WHERE");
            boolean first = true;
            if (!Strings.isStringEmpty(slot)) {
                sql.append(" ? = ").append(fieldNameSqlNameMapping.get("slot"));
                first = false;
                ArrayList<String> argument = new ArrayList<>();
                argument.add(slot);
                argument.add("string");
                parameters.put(1, argument);
            }

            if (!Strings.isStringEmpty(name)) {
                if (!first) {
                    sql.append(" and");
                }

                sql.append(" STRCMP(?,").append(fieldNameSqlNameMapping.get("name")).append(")=0");
                ArrayList<String> argument = new ArrayList<>();
                argument.add(name);
                argument.add("string");
                parameters.put(parameters.size() + 1, argument);
                first = false;
            }
            if (!Strings.isStringEmpty(set)) {
                if (!first) {
                    sql.append(" and");
                }
                sql.append(" ");
                sql.append(fieldNameSqlNameMapping.get("set"));
                sql.append(" in (SELECT id FROM Furniture_set WHERE ? = name)");

                ArrayList<String> argument = new ArrayList<>();
                argument.add(set);
                argument.add("string");
                parameters.put(parameters.size() + 1, argument);
            }
        }

        sql.append(";");

        HashMap<String, List<String>> rs = executeQuery(sql.toString(), parameters);
        return rs.get("id").stream().mapToInt(Integer::valueOf).toArray();
    }

    private String getViewSql() throws IOException {
        if (viewSql == null) {
            try (InputStream sqlStream = getClass().getClassLoader().getResourceAsStream("view.sql")) {
                if (sqlStream != null) {
                    viewSql = new BufferedReader(
                            new InputStreamReader(sqlStream, StandardCharsets.UTF_8)
                    ).lines().collect(Collectors.joining("\n"));
                }
            }
        }
        return viewSql;
    }
}
