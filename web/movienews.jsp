<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container-fluid">
            <div class="main">
                <h1>Movie News</h1>
                <div id="movienews" vertical layout wrap center>
                    <c:forEach var="newsArticle" items="${sessionScope.MovieNews}">
                        <div class="movie-detail-container" layout horizontal center>
                            <div class="movie-detail-card">
                                <img src="<c:out value='${newsArticle.image}'/>">
                            </div>
                            <div>
                                <h3>
                                    <a href="<c:out value='${newsArticle.link}'/>">
                                        <c:out value="${newsArticle.title}"/>
                                    </a>
                                </h3>
                                <p><c:out value="${newsArticle.description}"/></p>
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