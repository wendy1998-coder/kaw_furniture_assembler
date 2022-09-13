package nl.gaia.controllers;

import nl.gaia.dao.ConnectionManager;
import nl.gaia.dao.DatabaseException;
import nl.gaia.pojo.Furniture_piece;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

public class CatalogController extends AbstractController {

    public CatalogController(HttpServletRequest request, HttpServletResponse response) {
        super(request, response);
    }

    public void getFilteredPieces(String slot, String name, String set) throws DatabaseException {
        ConnectionManager cm = ConnectionManager.defaultManager();
        List<Furniture_piece> filtered = new ArrayList<>();
        HashMap<Integer, Furniture_piece> allPieces = null;
        try {
            int[] filteredIds = cm.getFilteredPieces(slot, name, set);
            allPieces = cm.getAllPieces();
            for (int id: filteredIds) {
                if (allPieces.containsKey(id)) {
                    filtered.add(allPieces.get(id));
                }
            }
            request.setAttribute("pieces", filtered);
        } catch (Exception e) {
            if (allPieces != null) {
                request.setAttribute("pieces", Arrays.stream(allPieces.values()
                        .toArray(new Furniture_piece[]{})).collect(Collectors.toList())
                );
                throw new DatabaseException("GetFilteredPieces: " + e.getMessage() + " showing unfiltered", e);
            }

        }
    }

    public HttpServletRequest getRequest() {
        return request;
    }

    public HttpServletResponse getResponse() {
        return response;
    }
}
