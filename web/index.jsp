<%@page import="java.util.List"%>
<%@page import="org.dogwood.Database"%>
<%@page import="org.dogwood.Movie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Database db = new Database();
    List<Movie> movies = db.getInTheatersMovies();
    db.close();
%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
	<%@include file="navbar.jsp"%>
        <div class="container-fluid">
            <div class="jumbotron">
                <h1>Now Playing</h1>
                <div id="movies">
                    <%
                        for (Movie movie : movies) {
                    %>
                    <div class="movie-card">
                        <a href="movie.jsp?Id=<%=movie.id%>"><img src="<%=movie.image%>"></a>
                        <p><a href="movie.jsp?Id=<%=movie.id%>"><%=movie.title%></a></p>
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