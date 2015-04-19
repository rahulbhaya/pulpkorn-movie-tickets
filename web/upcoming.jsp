<%@page import="java.util.List"%>
<%@page import="org.dogwood.Database"%>
<%@page import="org.dogwood.Movie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <div class="container-fluid">
            <%@include file="navbar.jsp"%>
            <div class="jumbotron">
                <h1>UPCOMING MOVIES</h1>
                <div id="movies"></div>
                <%
                    Database db = new Database();
                    List<Movie> movies = db.getUpcomingMovies();
                    for (Movie movie : movies) {
                        String id = movie.id;
                        String title = movie.title;
                        String image = movie.image;
                %>
                <div class="movie-card">
                    <a href="movie.jsp?MovieId=<%=id%>"><img src="<%=image%>"></a>
                    <p><a href="movie.jsp?MovieId=<%=id%>"><%=title%></a></p>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>