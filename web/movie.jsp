<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container-fluid movie-detail-container" horizontal center>
            <div class="jumbotron">
                <div id="movie" horizontal center layout>
                    <c:set var="movie" value="${sessionScope.MovieById}"/>
                    <div class="movie-detail-card">
                        <h1><c:out value="${movie.title}"/></h1>
                        <img src="<c:out value='${movie.image}'/>">
                    </div>
                    <div>
                        <h2>Release Date: <c:out value="${movie.releaseDate}"/></h2>
                        <h3>MPAA Rating: <c:out value="${movie.mpaaRating}"/></h3>
                        <h4>Synopsis:</h4>
                        <h5><c:out value="${movie.synopsis}"/></h5>
                    </div>
                </div>
                <div class="row">
                    <h3>Comments</h3>
                    <div class="media">
                        <img class="media-object pull-left" src="https://github.com/identicons/placeholder.png" width="64" height="64">
                        <div class="media-body">
                            <h3 class="media-heading">Username on Date</h3>
                            <p>Comment text goes here.</p>
                        </div>
                    </div>
                    <div class="media">
                        <img class="media-object pull-left" src="https://github.com/identicons/placeholder.png" width="64" height="64">
                        <div class="media-body">
                            <h3 class="media-heading">Username on Date</h3>
                            <p>Comment text goes here.</p>
                        </div>
                    </div>
                    <form role="form">
                        <div class="form-group">
                            <label for="comment">Comment:</label>
                            <textarea class="form-control" name="comment" rows="5"></textarea>
                        </div>
                        <button class="btn btn-danger btn-fab btn-raised mdi-action-done login-submit-btn" type="submit"></button>
                    </form>
                </div>        
            </div>
        </div>                        
        <%@include file="footer.jsp"%>
        <%@include file="material.jsp"%>
    </body>
</html>