package org.dogwood.servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.dogwood.Database;
import org.dogwood.Dogwood;
import org.dogwood.beans.CastMember;

@WebServlet(name = "GetMovieById", urlPatterns = {"/GetMovieById"})
public class GetMovieById extends HttpServlet {

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
        if (movieId == null) {
            request.getRequestDispatcher("GetInTheatersMovies").forward(request, response);
        }
        session.setAttribute("MovieById", Database.getInstance().getMovieById(movieId));
        List<CastMember> cast = Database.getInstance().getCast(movieId);
        if (cast == null || cast.isEmpty()) {
            cast = Dogwood.getCast(movieId);
        }
        String trailer = Database.getInstance().getTrailerUrl(movieId);
        if (trailer == null || trailer.equals("")) {
            trailer = Dogwood.getTrailer(movieId);
        }
        session.setAttribute("Cast", cast);
        session.setAttribute("Trailer", trailer);
        session.setAttribute("Comments", Database.getInstance().getComments(movieId));
        request.getRequestDispatcher("movie.jsp").forward(request, response);
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
