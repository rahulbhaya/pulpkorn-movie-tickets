<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container-fluid">
            <div class="main">
                <c:set var="purchaseSuccess" value="${sessionScope.PurchaseSuccess}"/>
                <c:if test="${purchaseSuccess != null}">
                    <p class="alert-dismissable alert-success"><c:out value="${purchaseSuccess}"/></p>
                </c:if>
                <c:remove var="PurchaseSuccess" scope="session"/>
                <h1>Now Playing</h1>
                <div id="movies" horizontal layout wrap center-justified>
                    <c:forEach var="movie" items="${sessionScope.InTheatersMovies}">
                        <div class="card-header movie-card" layout horizontal center>
                            <div class="movie-card-outer">
                                <a href="GetMovieById?MovieId=<c:out value='${movie.id}'/>">
                                    <img src="<c:out value='${movie.image}'/>">
                                </a>
                                <div class="movie-card-inner">
                                    <div class="h2"><a href="GetMovieById?MovieId=<c:out value='${movie.id}'/>"><c:out value="${movie.title}"/></a></div>
                                    <p>
                                        Release Date: <c:out value="${movie.releaseDate}"/>
                                        <br/>
                                        MPAA Rating: <c:out value="${movie.mpaaRating}"/>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <%@include file="ad.jsp"%>
        <%@include file="footer.jsp"%>
        <%@include file="material.jsp"%>
    </body>
</html>