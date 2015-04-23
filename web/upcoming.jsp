<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container-fluid">
            <div class="main">
                <h1>Upcoming Movies</h1>
                <div id="movies" horizontal layout wrap center-justified>
                    <c:forEach var="movie" items="${sessionScope.UpcomingMovies}">
                        <div class="card-header movie-card" layout horizontal center>
                            <img src="<c:out value='${movie.image}'/>">
                            <div class="movie-card-inner">
                                <div class="h2"><a href="GetMovieById?Id=<c:out value='${movie.id}'/>"><c:out value="${movie.title}"/></a></div>
                                <p>Description</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <%@include file="material.jsp"%>
    </body>
</html>