<%@page import="java.util.List"%>
<%@page import="org.dogwood.Database"%>
<%@page import="org.dogwood.Movie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
		<%@include file="navbar.jsp"%>
        <div class="container-fluid">
            <div class="jumbotron">
                <h1>Now Playing</h1>
                <div id="movies"></div>
                <%
                    Database db = new Database();
                    List<Movie> movies = db.getInTheatersMovies();
                    for (Movie movie : movies) {
                        String id = movie.id;
                        String title = movie.title;
                        String image = movie.image;
                %>
                <div class="movie-card">
                    <a href="movie.jsp?Id=<%=id%>"><img src="<%=image%>"></a>
                    <p><a href="movie.jsp?Id=<%=id%>"><%=title%></a></p>
                </div>
                <%
                    }
                    db.close();
                %>
            </div>
        </div>
		<%@include file="material.jsp"%>
    </body>
</html>