<%@include file="security.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <div class="container-fluid">
            <%@include file="navbar.jsp"%>
            <div class="jumbotron">
                <h1>Log In</h1>
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
                        <label for="Name">Username:</label>
                        <input class="form-control" name="Name" placeholder="Enter username" required type="text">
                    </div>
                    <div class="form-group">
                        <label for="Password">Password:</label>
                        <input class="form-control" name="Password" placeholder="Enter password" required type="password">
                    </div>
                    <button class="btn btn-default" type="submit">Submit</button>
                </form>
            </div>
        </div>
		<%@include file="material.jsp"%>
    </body>
</html>