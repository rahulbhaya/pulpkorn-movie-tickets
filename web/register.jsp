<%@page import="org.dogwood.database.Database"%>
<%
    String email = request.getParameter("Email");
    if (session.getAttribute("loggedIn") != null && new Database().register(email, request.getParameter("Password"), "NORMAL")) {
        session.setAttribute("loggedIn", email);
    }
    else {
        session.setAttribute("registerFail", true);
    }
    response.sendRedirect("index.jsp");
%>