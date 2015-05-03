package org.dogwood.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.dogwood.Database;
import org.dogwood.beans.Movie;

@WebServlet(name = "StartPurchase", urlPatterns = {"/StartPurchase"})
public class StartPurchase extends HttpServlet {

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
        List<String> creditCardList = new ArrayList<String>() {
        };
        List<String> creditCardListFull = Database.getInstance().getCardNumberByName((String) request.getSession().getAttribute("LogIn"));
        String id = (String) request.getParameter("MovieId");
        Movie movie = Database.getInstance().getMovieById(id);
        String theater = (String) request.getParameter("Theater");
        session.setAttribute("Theater", theater);
        session.setAttribute("MovieTitle", movie.getTitle());
        String time = (String) request.getParameter("MovieTime");
        session.setAttribute("MovieTime", time);
        for (String ccNumber : creditCardListFull) {
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
        String[] adultPrices = {"8.50", "8.75", "9.00", "9.25", "9.50", "9.75", "10.00"};
        String[] childSeniorPrices = {"5.50", "5.75", "6.00", "6.25", "6.50", "6.75", "7.00"};
        int price = (int) (Math.random() * adultPrices.length);
        session.setAttribute("AdultPrice", adultPrices[price]);
        session.setAttribute("ChildSeniorPrice", childSeniorPrices[price]);
        session.setAttribute("CreditCards", creditCardList);
        session.setAttribute("CreditCardsFull", creditCardListFull);
        request.getRequestDispatcher("purchase.jsp").forward(request, response);
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
