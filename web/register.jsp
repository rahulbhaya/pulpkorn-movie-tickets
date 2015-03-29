<%@page import="org.dogwood.database.Database"%>
<%
    String username = request.getParameter("Username");
    String password = request.getParameter("Password");
    String email = request.getParameter("Email");
    String address = request.getParameter("Address");
    Database db = new Database();
    if (db.register(username, password, email, address, "NORMAL")) {
        session.setAttribute("loggedIn", username);
    }
    else {
        session.setAttribute("registerFail", true);
    }
    response.sendRedirect("index.jsp");
%>