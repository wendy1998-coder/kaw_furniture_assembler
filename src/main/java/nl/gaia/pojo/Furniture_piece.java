package nl.gaia.pojo;


import java.util.HashMap;
import java.util.List;


public class Furniture_piece {
    public static final HashMap<String, String> fieldNameSqlNameMapping = new HashMap<>(6);
    static {
        fieldNameSqlNameMapping.put("id", "id");
        fieldNameSqlNameMapping.put("name", "name");
        fieldNameSqlNameMapping.put("slot", "slot");
        fieldNameSqlNameMapping.put("set", "furniture_set");
        fieldNameSqlNameMapping.put("driveId", "google_drive_id");
    }
    Integer id;
    String name;
    String driveId;
    String slot;
    String set;

    public Furniture_piece(Integer id, String name, String driveId, String slot, String set) {
        this.id = id;
        this.name = name;
        this.driveId = driveId;
        this.slot = slot;
        this.set = set;
    }

    public static HashMap<Integer, Furniture_piece> convertSqlResultToPieces(HashMap<String, List<String>> result) {
        HashMap<Integer, Furniture_piece> out = new HashMap<>();
        for (int i = 0; i < result.get(fieldNameSqlNameMapping.get("id")).size(); i++) {
            Integer id = Integer.parseInt(result.get(fieldNameSqlNameMapping.get("id")).get(i));
            String name = result.get(fieldNameSqlNameMapping.get("name")).get(i);
            String driveId = result.get(fieldNameSqlNameMapping.get("driveId")).get(i);
            String slot = result.get(fieldNameSqlNameMapping.get("slot")).get(i);
            String set = result.get(fieldNameSqlNameMapping.get("set")).get(i);
            out.put(id, new Furniture_piece(id, name, driveId, slot, set));
        }

        return out;
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

    public String getAssemblerUrl() {
        if (driveId != null) {
            return String.format("https://drive.google.com/uc?export=view&id=%s", driveId);
        }
        return null;
    }

    public String getCatalogUrl() {
        // TODO: find ideal proportions
        return getCatalogUrl(200, 190);
    }

    public String getCatalogUrl(int width, int height) {
        if (driveId != null) {
            return String.format("https://drive.google.com/uc?export=view&id=%s-w%s-h%s-p-k-nu-iv1", driveId, width, height);
        }
        return null;
    }

}
