<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container-fluid">
            <div class="main">
                <h1>Special Offers</h1>
                <div id="specialoffers" horizontal layout wrap center-justified>
                    <div class="card-header movie-card" layout horizontal center>
                        <div class="movie-card-outer">
                            <a href="register.jsp">
                                <img src="images/Logo_icon.png">
                            </a>
                            <div class="movie-card-inner">
                                <div class="h2"><a href="register.jsp">Become a Pulpkorn Member</a></div>
                                <p>Comment on movies and save purchase information for faster checkouts as a Pulpkorn member!</p>
                            </div>
                        </div>
                    </div>
                    <div class="card-header movie-card" layout horizontal center>
                        <div class="movie-card-outer">
                            <a href="https://www.kelloggsfamilyrewards.com/en_US/promotions/avengers-snacks-instant-win-sweepstakes.html">
                                <img src="http://images.fandango.com/r96.6/ImageRenderer/270/0/redesign/static/img/noxsquare.jpg/0/images/spotlight/avengers-banner_ads-fandango_300x150.png">
                            </a>
                            <div class="movie-card-inner">
                                <div class="h2"><a href="https://www.kelloggsfamilyrewards.com/en_US/promotions/avengers-snacks-instant-win-sweepstakes.html">Kellogg’s® 'Avengers: Age Of Ultron' Sweepstake</a></div>
                                <p>Enter now for a chance to win a Jeep® Cherokee® Limited, movie tickets, and more!</p>
                            </div>
                        </div>                        
                    </div>
                    <div class="card-header movie-card" layout horizontal center>
                        <div class="movie-card-outer">
                            <a href="http://promo.subway.com/">
                                <img src="http://images.fandango.com/r96.6/ImageRenderer/270/0/redesign/static/img/noxsquare.jpg/0/images/spotlight/subi15070w4avengers_fandango_270x135_100k.jpg">
                            </a>
                            <div class="movie-card-inner">
                                <div class="h2"><a href="http://promo.subway.com/">Subway Sweepstakes</a></div>
                                <p>Look for codes on 30oz Avengers cups and Doritos Jacked 3D Snacks at your local Subway for a chance to win subs, movie tickets and more!</p>
                            </div>
                        </div>   
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp"%>
        <%@include file="material.jsp"%>
    </body>
</html>