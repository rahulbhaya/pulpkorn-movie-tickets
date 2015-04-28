<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
                    <c:forEach var="comment" items="${sessionScope.Comments}">
                        <c:set var="name" value="${comment.userName}"/>
                        <div class="media">
                            <img class="media-object pull-left" src="https://github.com/identicons/<c:out value='${fn:substring(name, 0, fn:indexOf(name, "@"))}'/>.png" width="64" height="64">
                            <div class="media-body">
                                <h3 class="media-heading"><c:out value="${name}"/> on <c:out value="${comment.dateCommented}"/></h3>
                                <p><c:out value="${comment.message}"/></p>
                            </div>
                        </div>
                    </c:forEach>
                    <c:if test="${sessionScope.LogIn != null}">
                        <form action="Comment" method="POST" role="form">
                            <div class="form-group">
                                <input name="MovieId" type="hidden" value="<c:out value='${param.MovieId}'/>">
                                <label for="Message">Comment:</label>
                                <textarea class="form-control" maxlength="140" name="Message" rows="5"></textarea>
                            </div>
                            <button class="btn btn-danger btn-fab btn-raised mdi-action-done login-submit-btn" type="submit"></button>
                        </form> 
                    </c:if>
                </div>        
            </div>
        </div>                        
        <%@include file="footer.jsp"%>
        <%@include file="material.jsp"%>
    </body>
</html>