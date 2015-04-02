<%@page import="org.dogwood.Database"%>
<%
    String email = request.getParameter("Email");
    if (session.getAttribute("loggedIn") == null && new Database().login(email, request.getParameter("Password"))) {
        session.setAttribute("loggedIn", email);
    }
    else {
        session.setAttribute("loggedInFail", true);
    }
    response.sendRedirect("index.jsp");
%>