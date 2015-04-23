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
                        <div class="card-header" style="display: block;position: relative;padding: 10px;max-width: 300px;font-weight: 300;" layout horizontal center>
                            <img src="<c:out value='${movie.image}'/>" style="width:100%;">
                            <div style="background-color:white;padding-bottom: 10px;box-shadow: 3px 3px 3px #d3d1d1;">
                                <div class="h2" style="max-width: 300px;margin-left: auto;margin-right: auto;padding-left: 10px;margin-top:0px;padding-right: 10px;font-weight: 300;"><a href="GetMovieById?Id=<c:out value='${movie.id}'/>"><c:out value="${movie.title}"/></a></div>
                                <p style="max-width: 300px;margin-left: auto;margin-right: auto;line-height: 1.6;padding-left: 10px;  padding-right: 10px;">Description</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
	<%@include file="material.jsp"%>
    </body>
</html>