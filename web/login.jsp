<%@page import="org.dogwood.database.Database"%>
<%
    String username = request.getParameter("Username");
    String password = request.getParameter("Password");
    Database db = new Database();
    if (db.login(username, password)) {
        session.setAttribute("loggedIn", username);
    }
    else {
        session.setAttribute("loggedInFail", true);
    }
    response.sendRedirect("index.jsp");
%>