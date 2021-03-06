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
            <div class="main">
                <h1 vertical center layout>Account Overview</h1>
                <div class="jumbotron account-card-main">
                    <h1 class="account-card-h1">Change Password</h1>
                    <c:set var="changePassword" value="${sessionScope.ChangePasswordSuccess}"/>
                    <c:if test="${changePassword != null}">
                        <p class="alert-dismissable alert-success"><c:out value="${changePassword}"/></p>
                    </c:if>
                    <c:set var="changePassword" value="${sessionScope.ChangePasswordFail}"/>
                    <c:if test="${changePassword != null}">
                        <p class="alert-dismissable alert-danger"><c:out value="${changePassword}"/></p>
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
                    <h1 class="account-card-h1">Change Login Email</h2>
                        <c:set var="changeEmail" value="${sessionScope.ChangeEmailSuccess}"/>
                        <c:if test="${changeEmail != null}">
                            <a id="goto"></a>
                            <p class="alert-dismissable alert-success"><c:out value="${changeEmail}"/></p>
                        </c:if>
                        <c:set var="changeEmail" value="${sessionScope.ChangeEmailFail}"/>
                        <c:if test="${changeEmail != null}">
                            <a id="goto"></a>
                            <p class="alert-dismissable alert-danger"><c:out value="${changeEmail}"/></p>
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
                    <form action="RemoveCard" method="POST" role="form">
                    <div id="cc-info">
                        <c:forEach var="card" items="${sessionScope.CreditCards}">
                            <li role="presentation" style="list-style-type: none;"><img src=""><a role="menuitem" tabindex="-1" href="#" value="${card}">${card}</a><button type="submit" class="btn btn-flat btn-danger">Remove</button>
                                <input type="hidden" name="cardNum" value="${card}"/>
                            </li>
                                </c:forEach>
                    </div>
                    </form>
                </div>

                <div class="jumbotron account-card-main">
                    <h1 class="account-card-h1">Add a New Credit Card</h2>
                        <c:set var="saveCard" value="${sessionScope.SaveCardSuccess}"/>
                        <c:if test="${saveCard != null}">
                            <a id="goto"></a>
                            <p class="alert-dismissable alert-success"><c:out value="${saveCard}"/></p>
                        </c:if>
                        <c:set var="saveCard" value="${sessionScope.SaveCardFailure}"/>
                        <c:if test="${saveCard != null}">
                            <a id="goto"></a>
                            <p class="alert-dismissable alert-danger"><c:out value="${saveCard}"/></p>
                        </c:if>
                        <c:remove var="SaveCardSuccess" scope="session"/>
                        <c:remove var="SaveCardFailure" scope="session"/>
                        <form id="payment" method="post" action="SaveCardInfo">
                            <fieldset>
                                <span>
                                    <label for="cardnumber">Card Number</label>
                                    <div horizontal center layout>
                                        <input id="cardnumber" class="form-control" name="cardnumber" type="text" placeholder="16 digits credit card number" required="" pattern="[0-9]{16}">
                                        <div class="dropdown">
                                            <img id="cc-img" src="/images/default-credit-card.png">
                                        </div>
                                    </div>
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
                                    <input id="secure" class="form-control" name="secure" type="password" placeholder="3-4 digits on the back" required pattern="[0-9]{3}([0-9])*"/>
                                </span>
                                <span>
                                    <label for="namecard">Name on Card</label>
                                    <input id="namecard" class="form-control" name="namecard" type="text" placeholder="Exact name as on the card" required />
                                </span>
                                <span>
                                    <label for="billingaddress">Billing Address</label>
                                    <input id="address" class="form-control" name="billingaddress" type="text" placeholder="Street address associated with credit card" required />
                                </span>
                                <span>
                                    <label for="cityname">City</label>
                                    <input id="city" class="form-control" name="cityname" type="text" placeholder="Enter your city" required />
                                </span>
                                <span>
                                    <label for="state">State</label>
                                    <input id="state" class="form-control" name="state" type="text" placeholder="State" maxlength="2" style="text-transform: uppercase;" required />
                                </span>
                                <span>
                                    <label for="zipcode">ZIP code</label>
                                    <input id="zip-code" class="form-control" name="zipcode" type="text" placeholder="5 digits ZIP code" maxlength="5" required />
                                </span>
                                <span>
                                    <label for="phonenumber">Phone number</label>
                                    <input id="phone-number" class="form-control" name="phonenumber" type="text" placeholder="Your phone number in form 123-456-7890" maxlength="12" required />
                                </span>
                            </fieldset>
                            <div horizontal center layout>
                                <div flex></div>
                                <button class="btn btn-danger btn-fab btn-raised mdi-action-done submit-button" type="submit"></button>
                            </div>
                        </form>
                </div>
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
                            ccList.childNodes[i].childNodes[0].src = "/images/AMEX.png";
                        } else if (ccType.match("VISA")) {
                            ccList.childNodes[i].childNodes[0].src = "/images/VISA.png";
                        } else if (ccType.match("MasterCard")) {
                            ccList.childNodes[i].childNodes[0].src = "/images/MasterCard.png";
                        } else if (ccType.match("Discover")) {
                            ccList.childNodes[i].childNodes[0].src = "/images/Discover.png";
                        } else
                            ccList.childNodes[i].childNodes[0].src = "/images/default-credit-card.png";
                    }
                }

                $('#cardnumber').bind('input', detectCcType);
            });

            function detectCcType() {
                var ccNum = document.getElementById("cardnumber").value;
                var typeDigit = ccNum.charAt(0);
                switch (typeDigit) {
                    case "3":
                        document.getElementById("cc-img").src = "/images/AMEX.png";
                        break;
                    case "4":
                        document.getElementById("cc-img").src = "/images/VISA.png";
                        break;
                    case "5":
                        document.getElementById("cc-img").src = "/images/MasterCard.png";
                        break;
                    case "6":
                        document.getElementById("cc-img").src = "/images/Discover.png";
                        break;
                    default:
                        document.getElementById("cc-img").src = "/images/default-credit-card.png";
                        break;
                }
            }
            $(document.body).scrollTop($("#goto").position().top);
        </script>
    </body>
</html>