<%@page import="org.dogwood.database.Database"%>
<%
    session.invalidate();
    response.sendRedirect("index.jsp");
%>