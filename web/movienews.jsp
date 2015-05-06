<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container-fluid" horizontal center>
            <div class="main">
                <h1>Movie News</h1>
                <div id="news" vertical layout wrap center>
                    <c:forEach var="newsArticle" items="${sessionScope.MovieNews}">
                        <div class="jumbotron movie-detail-container" layout horizontal center>
                            <div style="margin-right: 18px;">
                                <img src="<c:out value='${newsArticle.image}'/>" style="height: 96px; width: 96px; border-radius: 50%;">
                            </div>
                            <div>
                                <h3>
                                    <a href="<c:out value='${newsArticle.link}'/>">
                                        <c:out value="${newsArticle.title}"/>
                                    </a>
                                </h3>
                                <p><h4><c:out value="${newsArticle.description}"/></h4></p>
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