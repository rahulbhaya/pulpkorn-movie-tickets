<%
    String name = (String) session.getAttribute("LogIn");
    if (name == null) {
        name = "Guest";
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-default">
    <ul class="nav navbar-nav">
        <li><a href="index.jsp">Home</a><li>
        <li><a href="upcoming.jsp">Upcoming Movies</a></li>
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" role="button">
                <%=name%>
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu" role="menu">
                <%
                    if (name.equals("Guest")) {
                %>
                <li><a href="login.jsp">Log In</a></li>
                <li><a href="register.jsp">Register</a></li>
                    <%
                        }
                        else {
                    %>
                <li><a href="account.jsp">Account</a></li>
                <li><a href="LogOut">Log Out</a></li>
                    <%
                        }
                    %>
            </ul>
        </li>
    </ul>
    <form action="theaters.jsp" class="navbar-form pull-right" method="POST" role="search">
        <div class="input-group">
			<input class="form-control" name="Near" placeholder="Search City, ZIP..." type="text">
            <div class="input-group-btn">
                <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span></button>
            </div>
        </div>
    </form>
</nav>