<%@page import="org.dogwood.database.Database"%>
<%
    String email = request.getParameter("Email");
    if (email.equals((String) session.getAttribute("loggedIn"))) {
        new Database().rate(email, request.getParameter("MovieId"), request.getParameter("Rating"));
    }
    response.sendRedirect("index.jsp");
%>