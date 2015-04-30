/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.dogwood.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "PurchaseLogin", urlPatterns = {"/PurchaseLogin"})
public class PurchaseLogin extends HttpServlet {

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
        RequestDispatcher dispatcher = request.getRequestDispatcher("payment.jsp");
        if (session.getAttribute("LogIn") != null) {
            dispatcher.forward(request, response);
        }
        String name = request.getParameter("Name");
        Database.Login login = Database.getInstance().logIn(name, request.getParameter("Password"));        
        if (login == Database.Login.CORRRECT_NORMAL) {
            session.setAttribute("LogIn", name);
            List<String> creditCardList = new ArrayList<String>() {
            };
            for (String ccNumber : Database.getInstance().getCardNumberByName(name)) {
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
            dispatcher.forward(request, response);
        }
        else if (login == Database.Login.CORRECT_ADMIN) {
            session.setAttribute("LogIn", name);
            session.setAttribute("IsAdmin", true);
            List<String> creditCardList = new ArrayList<String>() {
            };
            for (String ccNumber : Database.getInstance().getCardNumberByName(name)) {
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
            dispatcher.forward(request, response);
        }
        else {
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
            request.getRequestDispatcher("purchaseLogin.jsp").forward(request, response);
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
