<%@page import="org.dogwood.Movie"%>
<%@page import="org.dogwood.Database"%>
<%
    Database db = new Database();
    Movie movie = db.getMovieById(request.getParameter("Id"));
    db.close();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <div class="container-fluid">
            <%@include file="navbar.jsp"%>
            <div class="jumbotron">
                <div id="movie">
                    <h1><%=movie.title%></h1>
                    <img src="<%=movie.image%>">
                    <h2>Release Date: <%=movie.releaseDate%></h2>
                    <h3>MPAA Rating: <%=movie.mpaaRating%></h3>
                    <h4>Synopsis:</h4>
                    <h5><%=movie.synopsis%></h5>
                </div>
            </div>
        </div>

    </body>
</html>