<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-default nav-with-logo" style="background-image: url('images/Banner.png');">
    <div class="navbar-header nav-header-logo">
        <img id="site-logo" class="shake" src="images/Logo_icon.png">
    </div>
    <ul class="nav navbar-nav">
        <h1>Pulpkorn</h1>
        <li class="nav-list-item"><a href="GetInTheatersMovies">Home</a><li>
        <li class="nav-list-item"><a href="GetUpcomingMovies">Upcoming Movies</a></li>
        <li class="nav-list-item"><a href="GetUpcomingMovies">Gift Cards</a></li>
        <li class="dropdown nav-list-item">
            <a class="dropdown-toggle" data-toggle="dropdown" role="button">
                <c:set var="name" value="${sessionScope.LogIn}"/>
                <c:if test="${name == null}">
                    <c:set var="name" value="Guest"/>
                </c:if>
                <c:out value="${name}"/>
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu nav-drop-down" role="menu">
                <c:choose>
                    <c:when test="${name == 'Guest'}">
                        <li><a href="login.jsp">Log In</a></li>
                        <li><a href="register.jsp">Register</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="account.jsp">Account</a></li>
                        <c:if test="${sessionScope.IsAdmin != null}">
                            <li><a href="admin/index.jsp">Admin</a></li>
                        </c:if>
                        <li><a href="LogOut">Log Out</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </li>
    </ul>
    <form action="GetTheatersNear" class="navbar-form pull-right" method="POST" role="search">
        <div class="input-group">
            <input class="form-control nav-list-item" name="Near" placeholder="Enter City, State or ZIP..." type="text">
            <div class="input-group-btn">
                <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span></button>
            </div>
        </div>
    </form>
</nav>