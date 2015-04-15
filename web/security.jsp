<%
    if (session.getAttribute("loggedIn") != null) {
        response.sendRedirect("index.jsp");
    }
%>