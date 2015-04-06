<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.dogwood.Dogwood"%>
<%
    JSONArray.writeJSONString(Dogwood.getTheaters(request.getParameter("Near")), out);
%>