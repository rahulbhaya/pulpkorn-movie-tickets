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
                <h1>Join Pulpkorn today</h1>
                <c:set var="registerFail" value="${sessionScope.RegisterFail}"/>
                <c:if test="${registerFail != null}">
                    <p class="bg-danger"><c:out value="${registerFail}"/></p>
                </c:if>
                <c:remove var="RegisterFail" scope="session"/>
                <form action="PurchaseRegister" method="POST" role="form">
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
            </div>
        </div>
        <%@include file="footer.jsp"%>
        <%@include file="material.jsp"%>
    </body>
</html>