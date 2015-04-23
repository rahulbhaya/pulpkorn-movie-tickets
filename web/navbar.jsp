<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-default" style="
    background-image: url('images/Banner.png');    background-size: cover;    min-height: 120px;    transition: all 0.18s ease-in;
">
    <div class="navbar-header" style="margin: 8px 8px;">
        <img id="site-logo" class="shake" src="images/Logo_icon.png" style="height: 120px; margin-right: 25px; display: inline-block;">
    </div>
    <ul class="nav navbar-nav" style="margin: 8px 8px;">
        <h1 style="margin: 0;display: block;font-size: 2em;-webkit-margin-before: 0.67em;-webkit-margin-after: 0.67em;-webkit-margin-start: 0px;-webkit-margin-end: 0px;font-weight: bold;">Pulpkorn</h1>
        <li style="font-size: 1.6em;"><a href="GetInTheatersMovies">Home</a><li>
        <li style="font-size: 1.6em;"><a href="GetUpcomingMovies">Upcoming Movies</a></li>
        <li class="dropdown" style="font-size: 1.6em;">
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