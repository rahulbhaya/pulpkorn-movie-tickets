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
                            <img src="" style="display:none;">
                            <div class="movie-card-outer">
                                <div class="movie-card-inner" style="padding:20px;line-height: 3.5rem;">
                                    <div class="h2"><c:out value="${theater.name}"/></div>
                                    <div>
                                        <address><c:out value="${theater.address}"/></address>
                                        <ul class="list-group">
                                            <c:forEach var="showtimes" items="${theater.showtimes}">
                                                <li class="list-group-item"><c:out value="${showtimes.name}"/> 
                                                    <c:forEach var="time" items="${showtimes.times}">
                                                        <c:set var="movieObj" value="${showtimes.movie}"/>
                                                        <c:choose>
                                                            <c:when test="${movieObj != null}">
                                                                <a href="StartPurchase?MovieId=<c:out value='${movieObj.id}'/>">
                                                                    <c:out value="${time}"/>
                                                                </a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:out value="${time}"/>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp"%>
        <%@include file="material.jsp"%>
    </body>
</html>