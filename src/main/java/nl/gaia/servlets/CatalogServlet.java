package nl.gaia.servlets;

import nl.gaia.controllers.CatalogController;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CatalogServlet", urlPatterns = "/catalog")
public class CatalogServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher view = request.getRequestDispatcher("catalog.jsp");
        view.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher view = request.getRequestDispatcher("catalog.jsp");
        CatalogController catalogController = new CatalogController(request, response);
        try {
            catalogController.getFilteredPieces(null, null, null);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Something went wrong: " + e.getMessage());
        }

        request = catalogController.getRequest();
        response = catalogController.getResponse();
        view.forward(request, response);
    }
}
