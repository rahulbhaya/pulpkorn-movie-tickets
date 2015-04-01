<%
    String movieId = (String) request.getParameter("MovieId");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/jquery-1.11.2.min.js"></script>
        <script src="js/dogwood.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <script>
            movieInfo("<%=movieId %>", function(data) {
                $(document.body).append("<img src='" + data.posters.profile + "'>");
                $(document.body).append("<h1>" + data.title + "</h1>");
                $(document.body).append("<h2>Release Date: " + data.release_dates.theater + "</h2>");
                $(document.body).append("<h3>Runtime: " + data.runtime + " minutes</h3>");
                $(document.body).append("<h4>MPAA Rating: " + data.mpaa_rating + "</h4>");
                $(document.body).append("<h5>Genres: " + data.genres.join(", ") + "</h5>");
                $(document.body).append("<h6>Synopsis: " + data.synopsis + "</h6>");
            });
        </script>
    </body>
</html>