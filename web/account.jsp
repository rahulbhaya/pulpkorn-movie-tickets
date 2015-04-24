<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${sessionScope.LogIn == null}">
    <c:redirect url="GetInTheatersMovies"/>
</c:if>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container-fluid" layout vertical center>
            <div class="jumbotron account-card-main">
                <h1 class="account-card-h1">Your Account</h1>
                <h2 class="account-card-h2">Change Password</h2>
                <c:set var="changePassword" value="${sessionScope.ChangePasswordSuccess}"/>
                <c:if test="${changePassword != null}">
                    <p class="bg-success"><c:out value="${changePassword}"/></p>
                </c:if>
                <c:set var="changePassword" value="${sessionScope.ChangePasswordFail}"/>
                <c:if test="${changePassword != null}">
                    <p class="bg-danger"><c:out value="${changePassword}"/></p>
                </c:if>
                <c:remove var="ChangePasswordSuccess" scope="session"/>
                <c:remove var="ChangePasswordFail" scope="session"/>
                <form action="ChangePassword" method="POST" role="form">
                    <div class="form-group">
                        <label for="CurrentPassword">Current Password:</label>
                        <input class="form-control" name="CurrentPassword" placeholder="Enter current password" required type="password">
                    </div>
                    <div class="form-group">
                        <label for="NewPassword">New Password:</label>
                        <input class="form-control" name="NewPassword" placeholder="Enter new password" required type="password">
                    </div>
                    <div horizontal center layout>
                        <div flex></div>
                        <button class="btn btn-danger btn-fab btn-raised mdi-action-done submit-button" type="submit"></button>
                    </div>
                </form>
            </div>
            <div class="jumbotron account-card-main">
                <form id="payment" method="post" action="SaveCardInfo">
                    <fieldset>
                        <div class="form-group">
                            <h1 class="account-card-h1">Card Details</h1>
                            <h2 class="account-card-h2">Card Type</h2>
                            <div class="radio radio-primary">
                                <label>
                                    <input id="visa" type="radio" name="cardtype" value="VISA" checked>
                                    VISA
                                </label>
                                <img src="images/visa.jpg">
                            </div>
                            <div class="radio radio-primary">
                                <label>
                                    <input id="mastercard" type="radio" name="cardtype" value="MASTERCARD">
                                    MasterCard
                                </label>
                                <img src="images/mastercard.jpg"  >
                            </div>
                            <div class="radio radio-primary">
                                <label>
                                    <input id="amex" type="radio" name="cardtype" value="AMEX">
                                    American Express
                                </label>
                                <img src="images/amex.jpg" >
                            </div>
                        </div>
                        </span>
                        <span>
                            <label for="cardnumber">Card Number</label>
                            <input id="cardnumber" class="form-control" name="cardnumber" type="text" placeholder="16 digits credit card number" required pattern="[0-9]{16}"/>
                        </span>
                        <span>
                            <label for="expdate">Expiration Date</label>
                            <div style="display:flex;">
                                <input id="expdate-mm" class="form-control" name="expdate-mm" type="text" placeholder="2 digits Month (MM)" required pattern="((1[01])|[1-9])"/>
                                <input id="expdate-yy" class="form-control" name="expdate-yy" type="text" placeholder="2 digits Year (YY)" required pattern="[0-9]{2}"/>
                            </div>
                        </span>
                        <span>
                            <label for="secure">Security Code (CVV)</label>
                            <input id="secure" class="form-control" name="secure" type="text" placeholder="3-4 digits on the back" required pattern="[0-9]{3}([0-9])*"/>
                        </span>
                        <span>
                            <label for="namecard">Name on Card</label>
                            <input id="namecard" class="form-control" name="namecard" type="text" placeholder="Exact name as on the card" required />
                        </span>
                    </fieldset>
                    <div horizontal center layout>
                        <div flex></div>
                        <button class="btn btn-danger btn-fab btn-raised mdi-action-done submit-button" type="submit"></button>
                    </div>
                </form>
            </div>
        </div>
        <%@include file="footer.jsp"%>
        <%@include file="material.jsp"%>
    </body>
</html>