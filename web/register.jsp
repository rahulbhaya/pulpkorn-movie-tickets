<%@include file="security.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
	    <%@include file="navbar.jsp"%>
        <div class="container-fluid">
            <div class="jumbotron" style="width:512px;height:340px;margin-left:auto;margin-right:auto;">
                <h1 style="font-size: 1.5em;color: #00BCD4;font-weight: lighter;">Join Pulpkorn today</h1>
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
                        <label for="Name">Email address</label>
                        <input class="form-control" name="Name" placeholder="Email address" required type="text">
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