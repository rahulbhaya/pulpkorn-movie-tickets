<%@page import="org.dogwood.Dogwood"%>
<%
    Dogwood.getMovieInfo(request.getParameter("MovieId")).writeJSONString(out);
%>