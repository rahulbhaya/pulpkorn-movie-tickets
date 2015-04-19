<%@include file="security.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <div class="container-fluid">
            <%@include file="navbar.jsp"%>
            <div class="jumbotron">
                <h1 style="font-size: 1.5em;color: #00BCD4;font-weight: lighter;">Log In</h1>
                <%
                    if (session.getAttribute("LogInFail") != null) {
                %>
                <p class="bg-danger">Incorrect login</p>
                <%
                        session.removeAttribute("LogInFail");
                    }
                %>
                <form action="LogIn" method="POST" role="form">
                    <div class="form-group">
                        <label for="Name">Email address</label>
                        <input class="form-control" name="Name" placeholder="Email address" required type="text">
                    </div>
                    <div class="form-group">
                        <label for="Password">Password</label>
                        <input class="form-control" name="Password" placeholder="Password" required type="password">
                    </div>
                    <button class="btn btn-danger btn-fab btn-raised mdi-action-done" type="submit" style="background-color: #d23f31;"></button>
                </form>
            </div>
        </div>
		<%@include file="material.jsp"%>
    </body>
</html>