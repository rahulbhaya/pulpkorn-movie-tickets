package org.dogwood.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.dogwood.Database;

@WebServlet(name = "GetAccountInfo", urlPatterns = {"/GetAccountInfo"})
public class GetAccountInfo extends HttpServlet {

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
        List<String> creditCardList = new ArrayList<String>() {
        };
        for (String ccNumber : Database.getInstance().getCardNumberByName((String) request.getSession().getAttribute("LogIn"))) {
            String ccType = "";
            String lastFour = ccNumber.substring(ccNumber.length() - 4);
            char typeDigit = ccNumber.charAt(0);
            switch (typeDigit) {
                case '3':
                    ccType = "AMEX";
                    break;
                case '4':
                    ccType = "VISA";
                    break;
                case '5':
                    ccType = "MasterCard";
                    break;
                case '6':
                    ccType = "Discover";
                    break;
            }
            String ccString = ccType + " xx-" + lastFour;
            creditCardList.add(ccString);
        }
        request.getSession().setAttribute("CreditCards", creditCardList);
        request.getSession().setAttribute("fullCards", Database.getInstance().getCardNumberByName((String) request.getSession().getAttribute("LogIn")));
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
