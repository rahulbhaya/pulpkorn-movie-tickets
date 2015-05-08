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
            <div class="main">
                <h1 vertical center layout>Admin Portal</h1>
                <div class="jumbotron account-card-main">
                    <h1 class="account-card-h1">Add/Edit Movie</h1>
                    <c:set var="addEditMovie" value="${sessionScope.AddEditMovieSuccess}"/>
                    <c:if test="${addEditMovie != null}">
                        <p class="alert-dismissable alert-success"><c:out value="${addEditMovie}"/></p>
                    </c:if>
                    <c:set var="addEditMovie" value="${sessionScope.AddEditMovieFail}"/>
                    <c:if test="${addEditMovie != null}">
                        <p class="alert-dismissable alert-danger"><c:out value="${addEditMovie}"/></p>
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
                            <div class="input-group">
                                <label for="MPAARating" class="input-group-addon">MPAA Rating:</label>
                                <select name="MPAARating" class="form-control btn btn-default dropdown-toggle" required>
                                    <option>G</option>
                                    <option>PG</option>
                                    <option>PG-13</option>
                                    <option>R</option>
                                    <option>NC-17</option>
                                    <option>Unrated</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-10">
                                <textarea name="Synopsis" class="form-control" rows="3" placeholder="Enter synopsis" required></textarea>
                            </div>
                        </div>              
                        <div horizontal center layout>
                            <div flex></div>
                            <button class="btn btn-danger btn-fab btn-raised mdi-action-done submit-button" type="submit"></button>
                        </div>
                    </form>
                </div>
                <div class="jumbotron account-card-main">
                    <h1 class="account-card-h1">Add/Modify User</h1>
                    <c:set var="addModifyUser" value="${sessionScope.AddModifyUserSuccess}"/>
                    <c:if test="${addModifyUser != null}">
                        <a id="goto"></a>
                        <p class="alert-dismissable alert-success"><c:out value="${addModifyUser}"/></p>
                    </c:if>
                    <c:set var="addModifyUser" value="${sessionScope.AddModifyUserFail}"/>
                    <c:if test="${addModifyUser != null}">
                        <a id="goto"></a>
                        <p class="alert-dismissable alert-danger"><c:out value="${addModifyUser}"/></p>
                    </c:if>
                    <c:remove var="AddModifyUserSuccess" scope="session"/>
                    <c:remove var="AddModifyUserFail" scope="session"/>
                    <form action="AddModifyUser" method="POST" role="form">
                        <div class="form-group">
                            <label for="Username">Username:</label>
                            <input class="form-control" name="Username" placeholder="Enter username" required type="text">
                        </div>
                        <div class="form-group">
                            <label for="Email">Email address:</label>
                            <input class="form-control" name="Email" placeholder="Email address" required type="text" pattern="([a-z]*[A-Z]*[0-9]*)+@([a-z]*[A-Z]*[0-9]*)+\.([a-z]*[A-Z]*[0-9]*)+">
                        </div>
                        <div class="form-group">
                            <label for="Password">Password:</label>
                            <input class="form-control" name="Password" placeholder="Enter password" required type="password">
                        </div>
                        <div class="form-group">
                            <label>User Type:</label>
                            <div class="radio radio-primary">
                                <label>
                                    <input type="radio" name="Type" value="NORMAL" checked>
                                    Normal
                                </label>
                            </div>
                            <div class="radio radio-primary">
                                <label>
                                    <input type="radio" name="Type" value="ADMIN">
                                    Admin
                                </label>
                            </div>
                        </div>        
                        <div horizontal center layout>
                            <div flex></div>
                            <button class="btn btn-danger btn-fab btn-raised mdi-action-done submit-button" type="submit"></button>
                        </div>
                    </form>
                </div>
                <div class="jumbotron account-card-main">
                    <h1 class="account-card-h1">Delete User</h1>
                    <c:set var="deleteUser" value="${sessionScope.DeleteUserSuccess}"/>
                    <c:if test="${deleteUser != null}">
                        <a id="goto"></a>
                        <p class="alert-dismissable alert-success"><c:out value="${deleteUser}"/></p>
                    </c:if>
                    <c:set var="deleteUser" value="${sessionScope.DeleteUserFail}"/>
                    <c:if test="${deleteUser != null}">
                        <a id="goto"></a>
                        <p class="alert-dismissable alert-danger"><c:out value="${deleteUser}"/></p>
                    </c:if>
                    <c:remove var="DeleteUserSuccess" scope="session"/>
                    <c:remove var="DeleteUserFail" scope="session"/>
                    <form action="DeleteUser" method="POST" role="form">
                        <div class="form-group">
                            <label for="Name">Username:</label>
                            <input class="form-control" name="Name" placeholder="Enter username" required type="text">
                        </div>
                        <div horizontal center layout>
                            <div flex></div>
                            <button class="btn btn-danger btn-fab btn-raised mdi-action-done submit-button" type="submit"></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp"%>
        <%@include file="material.jsp"%>
        <script>
            $(document.body).scrollTop($("#goto").position().top);
        </script>
    </body>
</html>