<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${sessionScope.LogIn == null || sessionScope.IsAdmin == null}">
    <c:redirect url="GetInTheatersMovies"/>
</c:if>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container-fluid" layout vertical center>
            <h1>Admin Portal</h1>
            <div class="jumbotron account-card-main">
                <h2 class="account-card-h2">Add/Edit Movie</h2>
                <c:set var="addEditMovie" value="${sessionScope.AddEditMovieSuccess}"/>
                <c:if test="${addEditMovie != null}">
                    <p class="bg-success"><c:out value="${addEditMovie}"/></p>
                </c:if>
                <c:set var="addEditMovie" value="${sessionScope.AddEditMovieFail}"/>
                <c:if test="${addEditMovie != null}">
                    <p class="bg-danger"><c:out value="${addEditMovie}"/></p>
                </c:if>
                <c:remove var="AddEditMovieSuccess" scope="session"/>
                <c:remove var="AddEditMovieFail" scope="session"/>
                <form action="AddEditMovie" method="POST" role="form">
                    <div class="form-group">
                        <label for="MovieId">Id:</label>
                        <input class="form-control" name="MovieId" placeholder="Enter movie id" required type="text">
                    </div>
                    <div class="form-group">
                        <label for="Title">Title:</label>
                        <input class="form-control" name="Title" placeholder="Enter movie title" required type="text">
                    </div>
                    <div class="form-group">
                        <label for="ReleaseDate">Release Date:</label>
                        <input class="form-control" name="ReleaseDate" placeholder="Enter movie title" required type="date">
                    </div>
                    <div class="form-group">
                        <label for="MPAARating">MPAA Rating:</label>
                        <select name="MPAARating" required>
                            <option>G</option>
                            <option>PG</option>
                            <option>PG-13</option>
                            <option>R</option>
                            <option>NC-17</option>
                            <option>Unrated</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="Synopsis">Synopsis:</label>
                        <textarea name="Synopsis" placeholder="Enter synopsis" rows="4" required></textarea>
                    </div>                
                    <div horizontal center layout>
                        <div flex></div>
                        <button class="btn btn-danger btn-fab btn-raised mdi-action-done submit-button" type="submit"></button>
                    </div>
                </form>
            </div>
        </div>
        <%@include file="footer.jsp"%>
        <%@include file="material.jsp"%>
    </body>
</html>