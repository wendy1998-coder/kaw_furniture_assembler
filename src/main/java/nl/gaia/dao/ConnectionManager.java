package nl.gaia.dao;

import nl.gaia.pojo.Furniture_piece;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import static nl.gaia.pojo.Furniture_piece.*;

public class ConnectionManager implements SqlManager {
    private static ConnectionManager singletonInstance = null;
    private static String viewSql = null;
    private static LocalDate lastCached = null;
    private static HashMap<Integer, Furniture_piece> cachedPieces = new HashMap<>();

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
    public HashMap<Integer, Furniture_piece> getPieces() throws Exception {
        String sql = getViewSql();
        LocalDate now = LocalDate.now();
        LocalDate yesterday = now.minusDays(1);
        if (cachedPieces == null || lastCached == null
                || lastCached.isBefore(yesterday) || lastCached.isEqual(yesterday)) {
            HashMap<String, List<String>> result = executeQuery(sql, null);
            cachedPieces = convertSqlResultToPieces(result);
            lastCached = now;
        }
        return cachedPieces;
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
