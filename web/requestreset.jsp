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
            <div class="jumbotron login-card" style="height:250px;">
                <h1>Reset Your Password</h1>
                <c:set var="requestResetSuccess" value="${sessionScope.RequestResetSuccess}"/>
                <c:if test="${requestResetSuccess != null}">
                    <p class="bg-success"><c:out value="${requestResetSuccess}"/></p>
                </c:if>
                <c:set var="requestResetFail" value="${sessionScope.RequestResetFail}"/>
                <c:if test="${requestResetFail != null}">
                    <p class="bg-danger"><c:out value="${requestResetFail}"/></p>
                </c:if>
                <c:remove var="RequestResetSuccess" scope="session"/>
                <c:remove var="RequestResetFail" scope="session"/>
                <form action="RequestPasswordReset" method="POST" role="form">
                    <div class="form-group">
                        <label for="Email">Email address</label>
                        <input class="form-control" name="Email" placeholder="Your Login Email address" required type="text" pattern="([a-z]*[A-Z]*[0-9]*)+@([a-z]*[A-Z]*[0-9]*)+\.([a-z]*[A-Z]*[0-9]*)+">
                    </div>
                    <button class="btn btn-danger btn-fab btn-raised mdi-action-done login-submit-btn" type="submit"></button>
                </form>
            </div>
        </div>
        <%@include file="footer.jsp"%>
        <%@include file="material.jsp"%>
    </body>
</html>