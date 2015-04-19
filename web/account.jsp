<%@include file="security.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
	    <%@include file="navbar.jsp"%>
        <div class="container-fluid">
            <div class="jumbotron">
                <h1>Your Account</h1>
                <h2>Change Password</h2>
                <%
                    if (session.getAttribute("ChangePasswordSuccess") != null) {
                %>
                <p class="bg-success">Successfully changed password!</p>
                <%
                        session.removeAttribute("ChangePasswordSuccess");
                    }
                    else if (session.getAttribute("ChangePasswordFail") != null) {
                %>
                <p class="bg-danger">Incorrect password</p>
                <%
                        session.removeAttribute("ChangePasswordFail");
                    }
                %>
                <form action="ChangePassword" method="POST" role="form">
                    <div class="form-group">
                        <label for="CurrentPassword">Current Password:</label>
                        <input class="form-control" name="CurrentPassword" placeholder="Enter current password" required type="password">
                    </div>
                    <div class="form-group">
                        <label for="New Password">New Password:</label>
                        <input class="form-control" name="NewPassword" placeholder="Enter new password" required type="password">
                    </div>
                    <button class="btn btn-default" type="submit">Submit</button>
                </form>
            </div>
        </div>
		<%@include file="material.jsp"%>
    </body>
</html>