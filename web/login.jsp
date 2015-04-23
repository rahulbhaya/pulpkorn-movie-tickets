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
            <div class="jumbotron" style="width:512px;height:340px;margin-left:auto;margin-right:auto;">
                <h1 style="font-size: 1.5em;color: #00BCD4;font-weight: lighter;">Log In</h1>
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
                    <button class="btn btn-danger btn-fab btn-raised mdi-action-done" type="submit" style="background-color: #d23f31;float:right;"></button>
                </form>
            </div>
        </div>
	<%@include file="material.jsp"%>
    </body>
</html>