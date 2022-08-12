package nl.gaia.dao;

public class ConnectionManager implements SqlManager {
    private static ConnectionManager singletonInstance = null;

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

    public static void main(String[] args) {
        try {
            ConnectionManager.defaultManager().getConnection();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
