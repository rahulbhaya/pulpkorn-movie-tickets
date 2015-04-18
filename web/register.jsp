<%@include file="security.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <div class="container-fluid">
            <%@include file="navbar.jsp"%>
            <div class="well">
                <h1>Register</h1>
                <%
                    if (session.getAttribute("RegisterFail") != null) {
                %>
                <p class="bg-danger">Username was either entered incorrectly or it already exists</p>
                <%
                        session.removeAttribute("RegisterFail");
                    }
                %>
                <form action="Register" method="POST" role="form">
                    <div class="form-group">
                        <label for="Name">Username:</label>
                        <input type="text" class="form-control" name="Name" placeholder="Enter username" required>
                    </div>
                    <div class="form-group">
                        <label for="Password">Password:</label>
                        <input type="password" class="form-control" name="Password" placeholder="Enter password" required>
                    </div>
                    <button class="btn btn-default" type="submit">Submit</button>
                </form>
            </div>
        </div>
    </body>
</html>