<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-default nav-with-logo" style="background-image: url('images/Banner.png');" horizontal layout>
    <div class="navbar-header nav-header-logo">
        <img id="site-logo" class="shake" src="images/Logo_icon.png">
    </div>
    <div horizontal layout>
        <ul class="nav navbar-nav">
            <h1>Pulpkorn</h1>
            <li class="nav-list-item"><a href="GetInTheatersMovies">Home</a><li>
            <li class="nav-list-item"><a href="GetUpcomingMovies">Upcoming Movies</a></li>
            <li class="nav-list-item"><a href="BuyGiftCards">Gift Cards</a></li>
            <li class="nav-list-item"><a href="GetSpecialOffers">Special Offers</a></li>
            <li class="nav-list-item"><a href="ViewFAQs">FAQs</a></li>
            <li class="nav-list-item"><a href="ViewMovieNews">Movie News</a></li>
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
                            <li><a href="refund.jsp">Refund Purchase</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="GetAccountInfo">Account</a></li>
                            <li><a href="refund.jsp">Refund Purchase</a></li>
                            <c:if test="${sessionScope.IsAdmin != null}">
                                <li><a href="admin.jsp">Admin Portal</a></li>
                            </c:if>
                            <li><a href="LogOut">Log Out</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </li>
        </ul>
        <div>
            <form action="SearchMovies" class="navbar-form pull-right" method="POST" role="search">
                <div class="input-group">
                    <input class="form-control nav-list-item" name="Title" placeholder="Enter Movie Title..." type="text">
                    <div class="input-group-btn">
                        <button class="btn btn-default" type="submit" style="color:#FFF;"><span class="glyphicon glyphicon-search"></span></button>
                    </div>
                </div>
            </form>
            <form action="GetTheatersNear" class="navbar-form pull-right" method="POST" role="search">
                <div class="input-group" id="theater-search-group">
                    <input class="form-control nav-list-item" name="Near" id="searchbar-theater" placeholder="Enter City, State or ZIP..." type="text">
                    <div class="input-group-btn">
                        <button class="btn btn-default" onclick="getGeoLocation();" type="button" style="color:#FFF;"><span class="glyphicon mdi-device-gps-fixed"></span></button>
                        <button class="btn btn-default" id="searchbtn-search" type="submit" style="color:#FFF;display: none;"><span class="glyphicon glyphicon-search"></span></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</nav>