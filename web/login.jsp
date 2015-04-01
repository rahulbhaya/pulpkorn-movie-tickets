<%@page import="org.dogwood.database.Database"%>
<%
    String email = request.getParameter("Email");
    String password = request.getParameter("Password");
    Database db = new Database();
    if (db.login(email, password)) {
        session.setAttribute("loggedIn", email);
    }
    else {
        session.setAttribute("loggedInFail", true);
    }
    response.sendRedirect("index.jsp");
%>