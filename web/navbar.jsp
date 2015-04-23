<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-default">
    <div class="navbar-header">
        <a class="navbar-brand">Project Pulpkorn</a>
    </div>
    <ul class="nav navbar-nav">
        <li><a href="GetInTheatersMovies">Home</a><li>
        <li><a href="GetUpcomingMovies">Upcoming Movies</a></li>
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" role="button">
                <c:set var="name" value="${sessionScope.LogIn}"/>
                <c:if test="${name == null}">
                    <c:set var="name" value="Guest"/>
                </c:if>
                <c:out value="${name}"/>
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu" role="menu">
                <c:choose>
                    <c:when test="${name == 'Guest'}">
                        <li><a href="login.jsp">Log In</a></li>
                        <li><a href="register.jsp">Register</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="account.jsp">Account</a></li>
                        <li><a href="LogOut">Log Out</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </li>
    </ul>
    <form action="GetTheatersNear" class="navbar-form pull-right" method="POST" role="search">
        <div class="input-group">
	    <input class="form-control" name="Near" placeholder="Search City, ZIP..." type="text">
            <div class="input-group-btn">
                <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span></button>
            </div>
        </div>
    </form>
</nav>