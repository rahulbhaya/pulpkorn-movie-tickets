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
                        <!--This script should be places anywhere on a page you want to see rating box-->
<div style="width:100%;height:430px;">
<script type="text/javascript">
var r_obj = {
"Company": { "CompanyId": 5196 },
"RatingboxId": 13074,
"ProductCode": encodeURIComponent(window.location.href),
"SearchText": "",
"SortExpression": "",
"PageIndex": 1,
"MaxpageDisplay": 10,
"User": { "UserId": "1" }
};
var r_rspage = "rsratingbox";
</script>
<script type="text/javascript" src="http://www.rating-system.com/widget/rsiframe.js"></script>
</div>
                    </div>
                </div>
            </div>
        </div>
                                
        <%@include file="footer.jsp"%>
        <%@include file="material.jsp"%>
    </body>
</html>