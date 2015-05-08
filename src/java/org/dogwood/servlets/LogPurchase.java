/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.dogwood.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.dogwood.Database;

/**
 *
 * @author C15607
 */
@WebServlet(name = "LogPurchase", urlPatterns = {"/LogPurchase"})
public class LogPurchase extends HttpServlet {

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
        String choice = (String) request.getParameter("creditcards");
        System.out.println(choice);
        if (choice!=null) {
            List<String> cards = (List<String>) request.getSession().getAttribute("CreditCardsFull");
            String card = "";
            for (int i = 0; i < cards.size(); i++) {
                card = cards.get(i);
                if (card.substring(card.length() - 4).equals(choice.substring(choice.length() - 4))) {
                    break;
                }
            }
            Boolean success;
            if(request.getSession().getAttribute("giftcard")!=null){
                success = Database.getInstance().saveGiftPrePurchase(card, (String)request.getSession().getAttribute("LogIn"), Integer.parseInt((String)request.getSession().getAttribute("cardamount")), Integer.parseInt((String)request.getSession().getAttribute("numcard")));
                request.getSession().removeAttribute("giftcard");
            }
            else{
                success = Database.getInstance().savePrePurchase(card, (String) request.getSession().getAttribute("LogIn"), (String) request.getSession().getAttribute("MovieTitle"), (String) request.getSession().getAttribute("Theater"), (String) request.getSession().getAttribute("MovieTime"), Integer.parseInt((String) request.getSession().getAttribute("adults")), Integer.parseInt((String) request.getSession().getAttribute("seniors")), Integer.parseInt((String) request.getSession().getAttribute("children")));
            }
            if (success) {
                request.getRequestDispatcher("GetInTheatersMovies").forward(request, response);
            } else {
                request.getRequestDispatcher("payment.jsp").forward(request, response);
            }
        } else {
            String name = (String) request.getSession().getAttribute("LogIn");
            if (name == null) {
                name = "Guest";
            }
            Boolean success;
            if(request.getSession().getAttribute("giftcard")!=null){
                success = Database.getInstance().saveGiftPurchase(name, request.getParameter("billingaddress"), request.getParameter("cardnumber"), request.getParameter("secure"), request.getParameter("namecard"), request.getParameter("expdate-yy"), request.getParameter("expdate-mm"), (String)request.getSession().getAttribute("guestEmail"), Integer.parseInt((String)request.getSession().getAttribute("cardamount")), Integer.parseInt((String)request.getSession().getAttribute("numcard")));
                request.getSession().removeAttribute("giftcard");
            }else{
                success = Database.getInstance().saveRegularPurchase(name, (String) request.getSession().getAttribute("MovieTitle"), (String) request.getSession().getAttribute("Theater"), (String) request.getSession().getAttribute("MovieTime"), Integer.parseInt((String) request.getSession().getAttribute("adults")), Integer.parseInt((String) request.getSession().getAttribute("seniors")), Integer.parseInt((String) request.getSession().getAttribute("children")), request.getParameter("billingaddress"), request.getParameter("cardnumber"), request.getParameter("secure"), request.getParameter("namecard"), request.getParameter("expdate-mm"), request.getParameter("expdate-yy"), (String)request.getSession().getAttribute("guestEmail"));
            }
            if (success) {
                request.getRequestDispatcher("GetInTheatersMovies").forward(request, response);
            } else {
                request.getRequestDispatcher("payment.jsp").forward(request, response);
            }
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
