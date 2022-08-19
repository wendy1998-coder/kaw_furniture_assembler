package nl.gaia.pojo;


import java.util.HashMap;
import java.util.List;


public class Furniture_piece {
    private static final HashMap<String, String> fieldNameSqlNameMapping = new HashMap<>(6);
    static {
        fieldNameSqlNameMapping.put("id", "id");
        fieldNameSqlNameMapping.put("name", "name");
        fieldNameSqlNameMapping.put("hasImage", "has_image");
        fieldNameSqlNameMapping.put("slot", "slot");
        fieldNameSqlNameMapping.put("set", "furniture_set");
        fieldNameSqlNameMapping.put("imagePath", "image_path");
    }
    Integer id;
    String name;
    Boolean hasImage;
    String slot;
    String set;
    String imagePath;

    public Furniture_piece(Integer id, String name, Boolean hasImage, String slot, String set, String imagePath) {
        this.id = id;
        this.name = name;
        this.hasImage = hasImage;
        this.slot = slot;
        this.set = set;
        this.imagePath = imagePath;
    }

    public static HashMap<Integer, Furniture_piece> convertSqlResultToPieces(HashMap<String, List<String>> result) {
        HashMap<Integer, Furniture_piece> out = new HashMap<>();
        for (int i = 0; i < result.get("id").size(); i++) {
            Integer id = Integer.parseInt(result.get(fieldNameSqlNameMapping.get("id")).get(i));
            String name = result.get(fieldNameSqlNameMapping.get("name")).get(i);
            Boolean hasImage = Integer.parseInt(result.get(fieldNameSqlNameMapping.get("hasImage")).get(i)) == 1;
            String slot = result.get(fieldNameSqlNameMapping.get("slot")).get(i);
            String set = result.get(fieldNameSqlNameMapping.get("set")).get(i);
            String imagePath = result.get(fieldNameSqlNameMapping.get("imagePath")).get(i);
            out.put(id, new Furniture_piece(id, name, hasImage, slot, set, imagePath));
        }

        return out;
    }

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Boolean getHasImage() {
        return hasImage;
    }

    public String getSlot() {
        return slot;
    }

    public String getSet() {
        return set;
    }

    public String getImagePath() {
        return imagePath;
    }

}
