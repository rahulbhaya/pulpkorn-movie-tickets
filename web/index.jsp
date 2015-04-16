<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <div class="container-fluid">
            <%@include file="navbar.jsp"%>
            <div class="jumbotron">
                <h1>NOW PLAYING</h1>
                <div id="movies"></div>
            </div>
        </div>
        <script>
            //Retrieve in theaters movies as a JSON using the Rotten Tomatoes API and append the results to a container div.
            inTheatersMovies(function(data) {
                var container = $("#movies");
                var movies = data.movies;
                for (var i in movies) {
                    var movie = movies[i];
                    var movieCard = $("<div>").addClass("movie-card");
                    var movieImg = $("<img>").attr("src", movie.posters.original);
                    var movieLink = $("<a>").attr("href", "movie.jsp?MovieId=" + movie.id);
                    movieCard.append(movieLink.clone().append(movieImg)).append($("<p>").append(movieLink.text(movie.title)));
                    container.append(movieCard);
                }
            });
        </script>
    </body>
</html>