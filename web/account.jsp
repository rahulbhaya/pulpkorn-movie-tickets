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
             <div class="container-fluid" layout vertical center>
            <div class="jumbotron account-card-main">
           
                <h2 class="account-card-h2">Change Email</h2>
                <c:set var="changeEmail" value="${sessionScope.ChangeEmailSuccess}"/>
                <c:if test="${changeEmail != null}">
                    <p class="bg-success"><c:out value="${changeEmail}"/></p>
                </c:if>
                <c:set var="changeEmail" value="${sessionScope.ChangeEmailFail}"/>
                <c:if test="${changeEmail != null}">
                    <p class="bg-danger"><c:out value="${changeEmail}"/></p>
                </c:if>
                <c:remove var="ChangeEmailSuccess" scope="session"/>
                <c:remove var="ChangeEmailFail" scope="session"/>
                <form action="ChangeEmail" method="POST" role="form">
                    <div class="form-group">
                        <label for="CurrentEmail">Current Email:</label>
                        <input class="form-control" name="CurrentEmail" placeholder="Enter current email" required type="email">
                    </div>
                    <div class="form-group">
                        <label for="NewEmail">New Email:</label>
                        <input class="form-control" name="NewEmail" placeholder="Enter new email" required type="email">
                    </div>
                    <div horizontal center layout>
                        <div flex></div>
                        <button class="btn btn-danger btn-fab btn-raised mdi-action-done submit-button" type="submit"></button>
                    </div>
                </form>
            </div>   
            <div class="jumbotron account-card-main">
                <h1 class="account-card-h1">Saved Credit Cards</h1>
                <div id="cc-info">
                    <c:forEach var="card" items="${sessionScope.CreditCards}">
                        <li role="presentation"><img src=""><a role="menuitem" tabindex="-1" href="#">${card}</a><a href="javascript:void(0)" class="btn btn-flat btn-danger">Remove</a></li>
                    </c:forEach>
                </div>
            </div>

            <div class="jumbotron account-card-main">
                <h1 class="account-card-h1">Add a New Credit Card</h2>
                    <c:set var="saveCard" value="${sessionScope.SaveCardSuccess}"/>
                    <c:if test="${saveCard != null}">
                        <p class="bg-danger"><c:out value="${saveCard}"/></p>
                    </c:if>
                    <c:set var="saveCard" value="${sessionScope.SaveCardFailure}"/>
                    <c:if test="${saveCard != null}">
                        <p class="bg-danger"><c:out value="${saveCard}"/></p>
                    </c:if>
                    <c:remove var="SaveCardSuccess" scope="session"/>
                    <c:remove var="SaveCardFailure" scope="session"/>
                    <form id="payment" method="post" action="SaveCardInfo">
                        <fieldset>
                            <span>
                                <label for="cardnumber">Card Number</label>
                                <input id="cardnumber" class="form-control" name="cardnumber" type="text" placeholder="16 digits credit card number" required pattern="[0-9]{16}"/>
                            </span>
                            <span>
                                <label for="expdate">Expiration Date</label>
                                <div style="display:flex;">
                                    <input id="expdate-mm" class="form-control" name="expdate-mm" type="text" placeholder="2 digits Month (MM)" required pattern="[0-9]{2}"/>
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
                            <span>
                                <label for="billingaddress">Billing Address</label>
                                <input id="namecard" class="form-control" name="billingaddress" type="text" placeholder="Address associated with credit card" required />
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
        <script>
            $(document).ready(function () {
                var ccList = document.getElementById("cc-info");
                for (var i = 0; i < ccList.childNodes.length; i++) {
                    if (ccList.childNodes[i].tagName === "LI") {
                        var ccType = ccList.childNodes[i].childNodes[1].textContent;
                        if (ccType.match("AMEX")) {
                            ccList.childNodes[i].childNodes[0].src = "/images/amex.jpg";
                        } else if (ccType.match("VISA")) {
                            ccList.childNodes[i].childNodes[0].src = "/images/visa.jpg";
                        } else if (ccType.match("MasterCard")) {
                            ccList.childNodes[i].childNodes[0].src = "/images/mastercard.jpg";
                        } else
                            ccList.childNodes[i].childNodes[0].src = "/images/discover.jpg";
                    }
                }
            });
        </script>
    </body>
</html>