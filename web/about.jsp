<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container-fluid">
            <div class="main">
                <h1>About</h1>
                <div id="theaters" vertical layout wrap center>
                    <div class="card-header theater-card" layout horizontal center>
                        <div class="movie-card-outer">
                            <div class="movie-card-inner" style="padding:20px;">
                                <div class="h2">About Pulpkorn</div>
                                <div>
                                    <p>Pulpkorn was founded by four Stony Brook undergraduate students Michael Francis, Jackson Tan, Rahul Bhaya and Brian Bratt.</p>
                                    <p>We are a team of aspiring students who want to simplify your movie booking experience. Our website is designed with a user friendly interface.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-header theater-card" layout horizontal center>
                        <div class="movie-card-outer">
                            <div class="movie-card-inner" style="padding:20px;">
                                <div class="h2">The Team</div>
                                <div class="list-group">
                                    <div class="list-group-item">
                                        <div class="row-picture">
                                            <img class="circle" src="images/michael.jpg" alt="icon">
                                        </div>
                                        <div class="row-content">
                                            <h4 class="list-group-item-heading">Michael Francis</h4>
                                            <p class="list-group-item-text">Web Designer at Stony Brook University Employee Assistance Program</p>
                                        </div>
                                    </div>
                                    <div class="list-group-separator"></div>
                                    <div class="list-group-item">
                                        <div class="row-picture">
                                            <img class="circle" src="images/jackson.jpg" alt="icon">
                                        </div>
                                        <div class="row-content">
                                            <h4 class="list-group-item-heading">Jackson Tan</h4>
                                            <p class="list-group-item-text">Front-end Web Developer at Lenovo and Pulpkorn.</p>
                                        </div>
                                    </div>
                                    <div class="list-group-separator"></div>
                                    <div class="list-group-item">
                                        <div class="row-picture">
                                            <img class="circle" src="images/brian.jpg" alt="icon">
                                        </div>
                                        <div class="row-content">
                                            <h4 class="list-group-item-heading">Brian Bratt</h4>
                                            <p class="list-group-item-text">Student at State University of New York at Stony Brook</p>
                                        </div>
                                    </div>
                                    <div class="list-group-separator"></div>
                                    <div class="list-group-item">
                                        <div class="row-picture">
                                            <img class="circle" src="images/rahul.jpg" alt="icon">
                                        </div>
                                        <div class="row-content">
                                            <h4 class="list-group-item-heading">Rahul Bhaya</h4>
                                            <p class="list-group-item-text">Student at State University of New York at Stony Brook</p>
                                        </div>
                                    </div>
                                    <div class="list-group-separator"></div>
                                </div>
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
