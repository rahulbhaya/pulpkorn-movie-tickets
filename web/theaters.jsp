<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container-fluid">
            <div class="main">
                <h1>Theaters Near <c:out value="${param.Near}"/></h1>
                <div id="theaters" vertical layout wrap center>
                    <c:forEach var="theater" items="${sessionScope.TheatersNear}">
                        <div class="card-header theater-card" layout horizontal center>
                            <img src="">
                            <div class="movie-card-inner">
                                <div class="h2"><c:out value="${theater.name}"/></div>
                                <div><address><c:out value="${theater.address}"/></address>
                                    <ul class="list-group">
                                        <c:forEach var="movie" items="${theater.movies}">
                                            <li class="list-group-item"><c:out value="${movie.name}"/> 
                                                <c:forEach var="time" items="${movie.times}">
                                                    <c:out value="${time}"/> 
                                                </c:forEach>
                                            </li>
                                        </c:forEach>
                                    </ul></div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <%@include file="material.jsp"%>
    </body>
</html>