<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.dogwood.GoogleMoviesScraper"%>
<%
    JSONObject json = new JSONObject();
    json.put("theaters", GoogleMoviesScraper.getTheaters(request.getParameter("Near")));
    json.writeJSONString(out);
%>