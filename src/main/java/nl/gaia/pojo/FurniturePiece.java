package nl.gaia.pojo;


import nl.gaia.dao.DatabaseException;
import nl.gaia.dao.FTPManager;
import org.apache.commons.io.output.ByteArrayOutputStream;
import org.apache.commons.net.ftp.FTPClient;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class FurniturePiece {
    public static final Map<String, String> fieldNameSqlNameMapping = new HashMap<>(6);
    static {
        fieldNameSqlNameMapping.put("id", "id");
        fieldNameSqlNameMapping.put("name", "name");
        fieldNameSqlNameMapping.put("slot", "slot");
        fieldNameSqlNameMapping.put("set", "furniture_set");
    }
    Integer id;
    String name;
    String slot;
    String set;
    String imagePath;

    byte[] imageCatalog;
    byte[] imageAssembler;

    public FurniturePiece(Integer id, String name, String slot, String set, String imagePath) throws IOException, DatabaseException {
        this.id = id;
        this.name = name;
        this.slot = slot;
        this.set = set;
        this.imagePath = imagePath;
        setImages();
    }

    public static HashMap<Integer, FurniturePiece> convertSqlResultToPieces(HashMap<String, List<String>> result) throws IOException, DatabaseException {
        HashMap<Integer, FurniturePiece> out = new HashMap<>();
        for (int i = 0; i < result.get(fieldNameSqlNameMapping.get("id")).size(); i++) {
            Integer id = Integer.parseInt(result.get(fieldNameSqlNameMapping.get("id")).get(i));
            String name = result.get(fieldNameSqlNameMapping.get("name")).get(i);
            String slot = result.get(fieldNameSqlNameMapping.get("slot")).get(i);
            String set = result.get(fieldNameSqlNameMapping.get("set")).get(i);
            out.put(id, new FurniturePiece(id, name, slot, set, "bla"));
        }

        return out;
    }

    private void setImages() throws IOException, DatabaseException {
        FTPClient client = null;
        try {
            FTPManager ftpManager = FTPManager.defaultManager();
            client = ftpManager.getClient();

            try(ByteArrayOutputStream outputStream = new ByteArrayOutputStream()) {
                client.retrieveFile("/htdocs/images/Backgrounds/aurafrost_palace_throneroom.png", outputStream);
                this.imageAssembler = outputStream.toByteArray();
                // TODO: do something with _thumbnail in filepath
                this.imageCatalog = outputStream.toByteArray();
            }
        } catch (Exception e) {
            throw new DatabaseException("Couldn't set images. ", e);
        } finally {
            if(client != null && client.isConnected()) {
                client.logout();
                client.disconnect();
            }
        }
    }

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getSlot() {
        return slot;
    }

    public String getSet() {
        return set;
    }

}
