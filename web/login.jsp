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
                    <p class="bg-danger"><c:out value="${logInFail}"/></p>
                </c:if>
                <c:remove var="LogInFail" scope="session"/>
                <form action="LogIn" method="POST" role="form">
                    <div class="form-group">
                        <label for="Name">Email address</label>
                        <input class="form-control" name="Name" placeholder="Email address" required type="text" pattern="([a-z]*[A-Z]*[0-9]*)+@([a-z]*[A-Z]*[0-9]*)+\.([a-z]*[A-Z]*[0-9]*)+">
                    </div>
                    <div class="form-group">
                        <label for="Password">Password</label>
                        <input class="form-control" name="Password" placeholder="Password" required type="password">
                    </div>
                    <button class="btn btn-danger btn-fab btn-raised mdi-action-done login-submit-btn" type="submit"></button>
                </form>
                <p><a href="requestreset.jsp">Forgot your password?</a></p>
            </div>
        </div>
        <%@include file="footer.jsp"%>
        <%@include file="material.jsp"%>
    </body>
</html>