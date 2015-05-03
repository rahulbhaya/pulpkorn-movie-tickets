<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${sessionScope.LogIn != null}">
    <c:redirect url="GetInTheatersMovies"/>
</c:if>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container-fluid">
            <div class="jumbotron login-card">
                <h1>Log In</h1>
                <c:set var="logInFail" value="${sessionScope.LogInFail}"/>
                <c:if test="${logInFail != null}">
                    <p class="alert-dismissable alert-danger"><c:out value="${logInFail}"/></p>
                </c:if>
                <c:remove var="LogInFail" scope="session"/>
                <form action="PurchaseLogin" method="POST" role="form">
                    <div class="form-group">
                        <label for="Name">Username</label>
                        <input class="form-control" name="Name" placeholder="Username" required type="text">
                    </div>
                    <div class="form-group">
                        <label for="Password">Password</label>
                        <input class="form-control" name="Password" placeholder="Password" required type="password">
                    </div>
                    <button class="btn btn-danger btn-fab btn-raised mdi-action-done login-submit-btn" type="submit"></button>
                </form>
            </div>
        </div>
        <%@include file="footer.jsp"%>
        <%@include file="material.jsp"%>
    </body>
</html>
