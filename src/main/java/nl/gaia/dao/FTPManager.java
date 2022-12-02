package nl.gaia.dao;


import org.apache.commons.net.ftp.FTPClient;

import java.io.InputStream;
import java.util.Properties;

public class FTPManager {
    private static FTPManager singletonInstance = null;

    /**
     * Private constructor so only singletonInstance can be used.
     */
    private FTPManager() {}

    /**
     * Make sure only one instance of this class exists in this program.
     * @return The single instance of this class
     */
    public static FTPManager defaultManager() {
        if (singletonInstance == null) {
            singletonInstance = new FTPManager();
        }
        return singletonInstance;
    }

    public FTPClient getClient() throws Exception {
        InputStream propertiesStream = null;
        FTPClient client = new FTPClient();
        try {
            Properties properties = new Properties();
            propertiesStream = getClass().getClassLoader().getResourceAsStream("ftp.properties");
            if (propertiesStream != null) {
                properties.load(propertiesStream);
            }

            client.connect(properties.getProperty("host"), Integer.parseInt(properties.getProperty("port")));
            if (!client.login(properties.getProperty("username"), properties.getProperty("password"))) {
                client.disconnect();
                return null;
            }

            client.enterLocalPassiveMode();
        } catch (Exception e) {
            throw new Exception("FTPManager - getClient: " + e.getMessage());
        } finally {
            if (propertiesStream != null) {
                propertiesStream.close();
            }
        }

        return client;
    }

}
