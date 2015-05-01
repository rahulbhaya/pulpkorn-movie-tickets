package org.dogwood.servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.dogwood.Database;
import org.dogwood.Database.Login;

@WebServlet(name = "LogIn", urlPatterns = {"/LogIn"})
public class LogIn extends HttpServlet {

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
        RequestDispatcher dispatcher = request.getRequestDispatcher("GetInTheatersMovies");
        if (session.getAttribute("LogIn") != null) {
            dispatcher.forward(request, response);
        }
        String name = request.getParameter("Name");
        Login login = Database.getInstance().logIn(name, request.getParameter("Password"));
        if (login == Login.CORRRECT_NORMAL) {
            session.setAttribute("LogIn", name);
            dispatcher.forward(request, response);
        } else if (login == Login.CORRECT_ADMIN) {
            session.setAttribute("LogIn", name);
            session.setAttribute("IsAdmin", true);
            dispatcher.forward(request, response);
        } else {
            switch (login) {
                case INCORRECT_USERNAME:
                    session.setAttribute("LogInFail", "Incorrect username.");
                    break;
                case INCORRECT_PASSWORD:
                    session.setAttribute("LogInFail", "Incorrect password.");
                    break;
                default:
                    session.setAttribute("LogInFail", "Something went wrong.");
            }
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
