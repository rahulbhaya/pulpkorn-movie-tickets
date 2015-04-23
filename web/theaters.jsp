<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
	<%@include file="navbar.jsp"%>
        <div class="container-fluid">
            <div class="jumbotron">
                <h1>THEATERS NEAR <c:out value="${requestScope.Near}"/></h1>
                <div id="theaters">
                    <c:forEach var="theater" items="${sessionScope.TheatersNear}">
                        <div class="row">
                            <h2><c:out value="${theater.name}"/></h2>
                            <address><c:out value="${theater.address}"/></address>
                            <ul class="list-group">
                                <c:forEach var="movie" items="${theater.movies}">
                                    <li class="list-group-item"><c:out value="${movie.name}"/> 
                                        <c:forEach var="time" items="${movie.times}">
                                            <c:out value="${time}"/> 
                                        </c:forEach>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
	<%@include file="material.jsp"%>
    </body>
</html>