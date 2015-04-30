<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container-fluid">
            <form role="form" method="post" action="GetInTheatersMovies">
                <div class="form-group payment-info">
                        <fieldset>
                            <h1 class="payment-info-h1">Payment method</h1>
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
                            <span>
                                <label for="billingaddress">Billing Address</label>
                                <input id="namecard" class="form-control" name="billingaddress" type="text" placeholder="Address associated with credit card" required />
                            </span>
                            <div class="dropdown">
                                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
                                    Existing payment method
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu" id="cc-info" role="menu" aria-labelledby="dropdownMenu1">
                                    <c:forEach var="card" items="${sessionScope.CreditCards}">
                                        <li role="presentation"><img src=""><a role="menuitem" tabindex="-1" href="#">${card}</a></li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </fieldset>
                    <div class="form-group">
                        <div horizontal center layout>
                            <div flex></div>
                            <button class="btn btn-danger btn-fab btn-raised mdi-action-trending-neutral login-submit-btn" type="submit"></button>
                        </div>
                    </div>
                    </div>
            </form>
        </div>
        <%@include file="footer.jsp"%>
        <%@include file="material.jsp"%>
    </body>
</html>
