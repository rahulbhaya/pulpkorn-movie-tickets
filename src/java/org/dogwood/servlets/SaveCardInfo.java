package org.dogwood.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.dogwood.Database;

/**
 *
 * @author Brian
 */
@WebServlet(name = "SaveCardInfo", urlPatterns = {"/SaveCardInfo"})
public class SaveCardInfo extends HttpServlet {

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
        Database db = Database.getInstance();
        HttpSession session = request.getSession();
        String name = (String) session.getAttribute("LogIn");
        Boolean success = db.saveCardInfo(request.getParameter("billingaddress"), request.getParameter("cardnumber"), request.getParameter("secure"), request.getParameter("namecard"), name, request.getParameter("expdate-yy"), request.getParameter("expdate-mm"), request.getParameter("cityname"), request.getParameter("state"), request.getParameter("zipcode"), request.getParameter("phonenumber"));
        if (success) {
            session.setAttribute("SaveCardSuccess", "Card Information Successfully Saved.");
        } else {
            session.setAttribute("SaveCardFailure", "Error:Card Information Not Saved.");
        }
        request.getRequestDispatcher("account.jsp").forward(request, response);
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
