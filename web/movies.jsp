<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container-fluid">
            <div class="main">
                <c:set var="query" value="${param.Title}"/>
                <c:if test="${query == ''}">
                    <c:set var="query" value="All Movies"/>
                </c:if>
                <form action="SearchMovies" method="POST" role="form">
                    <div id="filter-title" class="form-group" horizontal layout style="margin: 0;">
                        <h1 for="Title" style="padding-right: 15px;">Search Results for </h1>
                        <input class="form-control" name="Title" type="text" placeholder="All Movies" value="<c:out value='${param.Title}'/>" style="width: auto;height: 82px;font-size: 36px;">
                        <div horizontal="" center="" layout="">
                            <div flex=""></div>
                            <button class="btn btn-danger btn-fab btn-raised mdi-action-done submit-button" type="submit"></button>
                        </div>
                    </div>
                    <div layout horizontal class="form-group" id="filter-rating" style="margin: 0;">
                        <h2 for="MPAARating" style="padding-right: 15px;">MPAA Rating</h2>
                        <select id="filter-rating-select" class="form-control btn btn-default dropdown-toggle" name="MPAARating" style="width: auto;font-size: 30px;height: 55px;">
                            <option>All</option>
                            <option>G</option>
                            <option>PG</option>
                            <option>PG-13</option>
                            <option>R</option>
                            <option>NC-17</option>
                            <option>Unrated</option>
                        </select>
                    </div>
                    <div class="form-group" id="filter-release" horizontal layout style="margin: 0;">
                        <h2>Release:</h2>
                        <div class="radio radio-primary" style="padding-top: 20px;margin-top: 10px !important;">
                            <label>
                                <input type="radio" name="Release" value="All" checked=""><span class="circle"></span><span class="check"></span>
                                All
                            </label>
                        </div>
                        <div class="radio radio-primary" style="padding-top: 20px;margin-top: 10px !important;">
                            <label>
                                <input type="radio" name="Release" value="Current"><span class="circle"></span><span class="check"></span>
                                Current
                            </label>
                        </div>
                        <div class="radio radio-primary" style="padding-top: 20px;margin-top: 10px !important;">
                            <label>
                                <input type="radio" name="Release" value="Upcoming"><span class="circle"></span><span class="check"></span>
                                Upcoming
                            </label>
                        </div>
                    </div>
                </form>
                <div id="movies" horizontal layout wrap center-justified>
                    <c:forEach var="movie" items="${sessionScope.SearchMovies}">
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
        <script>
            $(document).ready(function () {
                var select = document.getElementById("filter-rating-select");
                for (var i = 0; i < select.childNodes.length; i++) {
                    if (select.childNodes[i].textContent.match('<c:out value="${param.MPAARating}"/>')) {
                        select.childNodes[i].selected = true;
                        break;
                    } else
                        select.childNodes[1].selected = true;
                }
                var release = document.getElementById("filter-release");
                for (var i = 0; i < select.childNodes.length; i++) {
                    if (release.childNodes[i].textContent.match('<c:out value="${param.Release}"/>')) {
                        release.childNodes[i].childNodes[1].childNodes[1].checked = true;
                        break;
                    } else
                        release.childNodes[3].childNodes[1].childNodes[1].checked = true;
                }
                if ($("#movies").children().length === 0) {
                    $("#movies").append($("<h3>").text("No results."));
                }
            });
        </script>
    </body>
</html>