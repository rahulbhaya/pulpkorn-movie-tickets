<%@page import="org.dogwood.database.Database"%>
<%
    String email = request.getParameter("Email");
    String password = request.getParameter("Password");
    Database db = new Database();
    if (db.register(email, password, "NORMAL")) {
        session.setAttribute("loggedIn", email);
    }
    else {
        session.setAttribute("registerFail", true);
    }
    response.sendRedirect("index.jsp");
%>