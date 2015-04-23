<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
	<%@include file="navbar.jsp"%>
        <div class="container-fluid">
            <div class="jumbotron">
                <h1>Upcoming Movies</h1>
                <div id="movies">
                    <c:forEach var="movie" items="${sessionScope.UpcomingMovies}">
                        <div class="movie-card">
                            <a href="GetMovieById?Id=<c:out value='${movie.id}'/>"><img src="<c:out value='${movie.image}'/>"></a>
                            <p><a href="GetMovieById?Id=<c:out value='${movie.id}'/>"><c:out value="${movie.title}"/></a></p>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
	<%@include file="material.jsp"%>
    </body>
</html>