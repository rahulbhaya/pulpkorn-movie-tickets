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
        <div class="container-fluid">
            <div class="jumbotron">
                <h1>Your Account</h1>
                <h2>Change Password</h2>
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
                    <button class="btn btn-default" type="submit">Submit</button>
                </form>
            </div>
        </div> 
        <form id=payment method="post" action="SaveCardInfo">
            <fieldset>
                <legend>Card Details</legend>
                <ol>
                    <li>
                        <fieldset>
                            <legend>Card Type</legend>
                            <ol>
                                <li>
                                    <input id=visa name=cardtype type=radio />
                                    <label for=visa>VISA</label>
                                    <img src="images/visa.jpg">
                                </li>
                                <li>
                                    <input id=amex name=cardtype type=radio />
                                    <label for=amex>AmEx</label>
                                    <img src="images/amex.jpg" >
                                </li>
                                <li>
                                    <input id=mastercard name=cardtype type=radio />
                                    <label for=mastercard>Mastercard</label>
                                    <img src="images/mastercard.jpg"  >
                                </li>
                            </ol>
                        </fieldset>
                    </li>
                    <li>
                        <label for=cardnumber>Card Number</label>
                        <input id=cardnumber name=cardnumber type=number required />
                    </li>
                    <li>
                        <label for=secure>Security Code</label>
                        <input id=secure name=secure type=number required />
                    </li>
                    <li>
                        <label for=namecard>Name on Card</label>
                        <input id=namecard name=namecard type=text placeholder="Exact name as on the card" required />
                    </li>
                </ol>
            </fieldset>
            <fieldset>
                <button type=submit>Submit </button>
            </fieldset>
        </form>
	<%@include file="material.jsp"%>
    </body>
</html>