<%
    String movieId = request.getParameter("MovieId");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Project Pulpkorn</title>
        <script src="js/jquery-1.11.2.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/dogwood.js"></script>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="navbar.jsp"%>
            <div class="jumbotron">
                <div id="movie"></div>
            </div>
        </div>
        <script>
            //Retrieve in theaters movies as a JSON using the Rotten Tomatoes API and append the results to a container div.
            movieInfo(<%=movieId%>, function(movie) {
                var container = $("#movie");
                container.append($("<h1>").text(movie.title));
                container.append($("<img>").attr("src", movie.posters.original));
                container.append($("<h2>").text("Release Date: " + movie.release_dates.theater));
                container.append($("<h3>").text("MPAA Rating: " + movie.mpaa_rating));
                container.append($("<h4>").text("Synopsis: " + movie.synopsis));
            });
        </script>
    </body>
</html>