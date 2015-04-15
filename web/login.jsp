<%@page import="org.dogwood.Database"%>
<%@include file="security.jsp"%>
<%
    String name = request.getParameter("Name");
    if (name != null) {
        if (new Database().login(name, request.getParameter("Password"))) {
            session.setAttribute("loggedIn", name);
            response.sendRedirect("index.jsp");
        }
        else {
            name = "Incorrect login";
        }
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Project Pulpkorn</title>
        <script src="js/jquery-1.11.2.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/dogwood.js"></script>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="navbar.jsp"%>
            <div class="well">
                <h1>Log In</h1>
                <%
                    if (name != null) {
                %>
                <p class="bg-danger">Incorrect login</p>
                <%
                    }
                %>
                <form role="form">
                    <div class="form-group">
                        <label for="Name">Username:</label>
                        <input type="text" class="form-control" name="Name" placeholder="Enter username" required>
                    </div>
                    <div class="form-group">
                        <label for="Password">Password:</label>
                        <input type="password" class="form-control" name="Password" placeholder="Enter password" required>
                    </div>
                    <button class="btn btn-default" type="submit" >Submit</button>
                </form>
            </div>
        </div>
    </body>
</html>