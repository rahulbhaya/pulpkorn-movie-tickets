package org.dogwood.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.dogwood.Database;

@WebServlet(name = "AddEditMovie", urlPatterns = {"/AddEditMovie"})
public class AddEditMovie extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String movieId = request.getParameter("MovieId");
        String title = request.getParameter("Title");
        String releaseDate = request.getParameter("ReleaseDate");
        String mpaaRating = request.getParameter("MPAARating");
        String synopsis = request.getParameter("Synopsis");
        if (session.getAttribute("IsAdmin") != null && movieId != null) {
            if (Database.getInstance().getMovieById(movieId) == null) {
                if (Database.getInstance().addMovie(movieId, title, releaseDate, mpaaRating, synopsis)) {
                    session.setAttribute("AddEditMovieSuccess", "Successfully added movie.");
                }
                else {
                    session.setAttribute("AddEditMovieFail", "Failed to add movie.");
                }
            }
            else {
                if (Database.getInstance().editMovie(movieId, title, releaseDate, mpaaRating, synopsis)) {
                    session.setAttribute("AddEditMovieSuccess", "Successfully edited movie.");
                }
                else {
                    session.setAttribute("AddEditMovieFail", "Failed to edit movie.");
                }
            }
            request.getRequestDispatcher("admin.jsp").forward(request, response);
        }
        else {
            request.getRequestDispatcher("GetInTheatersMovies").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
