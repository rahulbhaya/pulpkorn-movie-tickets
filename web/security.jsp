<%
    if (session.getAttribute("LoggedIn") != null) {
        response.sendRedirect("index.jsp");
    }
%>