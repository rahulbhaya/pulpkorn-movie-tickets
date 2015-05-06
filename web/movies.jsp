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
                <h1>Search Results for <c:out value="${query}"/>:</h1>
                <h2>MPAA Rating: <c:out value="${param.MPAARating}"/></h2>
                <h2>Release: <c:out value="${param.Release}"/></h2>
                <div id="movies" horizontal layout wrap center-justified>
                    <c:forEach var="movie" items="${sessionScope.SearchMovies}">
                        <div class="card-header movie-card" layout horizontal center>
                            <div class="movie-card-outer">
                                <a href="GetMovieById?MovieId=<c:out value='${movie.id}'/>">
                                    <img src="<c:out value='${movie.image}'/>">
                                </a>
                                <div class="movie-card-inner">
                                    <div class="h2"><a href="GetMovieById?Id=<c:out value='${movie.id}'/>"><c:out value="${movie.title}"/></a></div>
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
                <div class="jumbotron account-card-main" layout horizontal center>
                    <h1>Filter Search</h1>
                    <form action="SearchMovies" method="POST" role="form">
                        <div id="filter-title" class="form-group">
                            <label for="Title">Title</label>
                            <input class="form-control" name="Title" type="text" value="<c:out value='${param.Title}'/>">
                        </div>

                        <div id="filter-rating" class="form-group">
                            <label for="MPAARating">MPAA Rating</label>
                            <select id="filter-rating-select" class="form-control btn btn-default dropdown-toggle" name="MPAARating">
                                <option>All</option>
                                <option>G</option>
                                <option>PG</option>
                                <option>PG-13</option>
                                <option>R</option>
                                <option>NC-17</option>
                                <option>Unrated</option>
                            </select>
                        </div>

                        <div id="filter-release" class="form-group">
                            <label>Release:</label>
                            <div class="radio radio-primary">
                                <label>
                                    <input type="radio" name="Release" value="All" checked>
                                    All
                                </label>
                            </div>
                            <div class="radio radio-primary">
                                <label>
                                    <input type="radio" name="Release" value="Current">
                                    Current
                                </label>
                            </div>
                            <div class="radio radio-primary">
                                <label>
                                    <input type="radio" name="Release" value="Upcoming">
                                    Upcoming
                                </label>
                            </div>
                        </div>

                        <div horizontal center layout>
                            <div flex></div>
                            <button class="btn btn-danger btn-fab btn-raised mdi-action-done submit-button" type="submit"></button>
                        </div>
                    </form>
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
                    if(select.childNodes[i].textContent.match('<c:out value="${param.MPAARating}"/>')){
                        select.childNodes[i].selected=true;
                        break;
                    }
                    else
                        select.childNodes[1].selected=true;
                }
                var release = document.getElementById("filter-release");
                for (var i = 0; i < select.childNodes.length; i++) {
                    if(release.childNodes[i].textContent.match('<c:out value="${param.Release}"/>')){
                        release.childNodes[i].childNodes[1].childNodes[1].checked=true;
                        break;
                    }
                    else
                        release.childNodes[3].childNodes[1].childNodes[1].checked=true;
                }
            });
        </script>
    </body>
</html>