<%
    String loggedIn = (String) session.getAttribute("loggedIn");
    if (loggedIn == null) {
        loggedIn = "Guest";
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <nav class="navbar navbar-default">
            <ul class="nav navbar-nav">
                <li><a href="index.jsp">Home</a><li>
                <li><a href="upcoming.jsp">Upcoming Movies</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" role="button">
                        <%=loggedIn%>
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu" role="menu">
                        <%
                            if (loggedIn.equals("Guest")) {
                        %>
                        <li><a href="login.jsp">Log In</a></li>
                        <li><a href="register.jsp">Register</a></li>
                        <%
                            }
                            else {
                        %>
                        <li><a href="logout.jsp">Log Out</a></li>
                        <%
                            }
                        %>
                    </ul>
                </li>
            </ul>
        </nav>
    </body>
</html>