<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<%@include file="header.jsp"%>
    <body>
        <script>
                var movieId = <%=request.getParameter("MovieId")%>;
                var xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function () {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        var jsonResponse = JSON.parse(xhr.response);
                        var studio = jsonResponse.studio;
                        var alternate_ids = jsonResponse.alternate_ids;
                        var year = jsonResponse.year;
                        var posters = jsonResponse.posters;
                        var runtime = jsonResponse.runtime;
                        var abridged_directors = jsonResponse.abridged_directors;
                        var synopsis = jsonResponse.synopsis;
                        var title = jsonResponse.title;
                        var critics_consensus = jsonResponse.critics_consensus;
                        var abridged_cast = jsonResponse.abridged_cast;
                        var genres = jsonResponse.genres;
                        var ratings = jsonResponse.ratings;
                        var release_dates = jsonResponse.release_dates;
                        var links = jsonResponse.links;
                        var id = jsonResponse.id;
                        var mpaa_rating = jsonResponse.mpaa_rating;
                        
                        document.getElementById("Movie_Info").innerHTML=studio+'<br/>'+alternate_ids+'<br/>'
                            +year+'<br/>'+posters+'<br/>'+runtime+'<br/>'+abridged_directors+'<br/>'
                            +synopsis+'<br/>'+title+'<br/>'+critics_consensus+'<br/>'+abridged_cast+'<br/>'
                            +genres+'<br/>'+ratings+'<br/>'+release_dates+'<br/>'+links+'<br/>'+id+'<br/>'
                            +mpaa_rating+'<br/>';
                    }
                };
                xhr.open('GET', 'movie.jsp?MovieId='+movieId, true);
                xhr.send();
        </script>
        <div id="Movie_Info"></div>
		<%@include file="material.jsp"%>
    </body>
</html>
