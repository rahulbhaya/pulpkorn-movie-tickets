<%@page import="org.dogwood.Database"%>
<%@include file="security.jsp"%>
<%
    String name = request.getParameter("Name");
    if (name != null) {
        if (new Database().register(name, request.getParameter("Password"), "NORMAL")) {
            session.setAttribute("loggedIn", name);
            response.sendRedirect("index.jsp");
        }
        else {
            name = "Username was either entered incorrectly or it already exists";
        }
    }
%>
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
                    if (name != null) {
                %>
                <p class="bg-danger">Username was either entered incorrectly or it already exists</p>
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