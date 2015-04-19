<%@page import="org.dogwood.Showtime"%>
<%@page import="java.util.List"%>
<%@page import="org.dogwood.Dogwood"%>
<%@page import="org.dogwood.MovieTheater"%>
<%
    String near = request.getParameter("Near");
    List<MovieTheater> theaters = Dogwood.getTheaters(near);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
	<%@include file="navbar.jsp"%>
        <div class="container-fluid">
            <div class="jumbotron">
                <h1>THEATERS NEAR <%=near%></h1>
                <div id="theaters">
                    <%
                        for (MovieTheater theater : theaters) {
                    %>
                    <div class="row">
                        <h2><%=theater.name%></h2>
                        <address><%=theater.address%></address>
                        <ul class="list-group">
                            <%
                                for (Showtime movie : theater.movies) {
                            %>
                            <li class="list-group-item"><%=movie.name%> <%=movie.timesToString()%></li>
                            <%
                                }
                            %>
                        </ul>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
	<%@include file="material.jsp"%>
    </body>
</html>