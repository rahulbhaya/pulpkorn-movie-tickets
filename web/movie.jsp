<%@page import="org.dogwood.RottenTomatoes"%>
<%
    out.println(RottenTomatoes.getMovieInfo((String) request.getParameter("MovieId")));
%>