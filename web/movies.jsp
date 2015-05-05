<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container-fluid" layout vertical center>
            <div class="main">
                <h1>Search Results for '<c:out value="${param.Title}"/>':</h1>
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
                        <div class="form-group">
                            <label for="Title">Title</label>
                            <input class="form-control" name="Title" type="text" value="<c:out value='${param.Title}'/>">
                        </div>
                        <div class="form-group">
                            <label for="MPAARating">MPAA Rating</label>
                            <select name="MPAARating">
                                <option>All</option>
                                <option>G</option>
                                <option>PG</option>
                                <option>PG-13</option>
                                <option>R</option>
                                <option>NC-17</option>
                                <option>Unrated</option>
                            </select>
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
    </body>
</html>