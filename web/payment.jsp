<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container-fluid">
            <form role="form" method="post" action="LogPurchase">
                <div id="ticket-info" class="form-group payment-info jumbotron">
                    <fieldset>
                        <h1 class="payment-info-h1">Payment method</h1>
                        <span>
                            <label for="cardnumber">Card Number</label>
                            <div horizontal center layout>
                                <input id="cardnumber" class="form-control" name="cardnumber" type="text" placeholder="16 digits credit card number" required="" pattern="[0-9]{16}">
                                <c:if test="${sessionScope.LogIn == null}">
                                    <div class="dropdown">
                                        <img id="cc-img" src="/images/default-credit-card.png">
                                    </div>
                                </c:if>
                            </div>
                        </span>
                        <span>
                            <label for="expdate">Expiration Date</label>
                            <div style="display:flex;">
                                <input id="expdate-mm" class="form-control" name="expdate-mm" type="text" placeholder="2 digits Month (MM)" pattern="[1-9]{2}"/>
                                <input id="expdate-yy" class="form-control" name="expdate-yy" type="text" placeholder="2 digits Year (YY)" pattern="[0-9]{2}"/>
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
                            <input id="zip-code" class="form-control" name="zipcode" type="text" placeholder="ZIP code, in format 5 or 5+4" maxlength="10" required />
                        </span>
                        <span>
                            <label for="phonenumber">Phone number</label>
                            <input id="phone-number" class="form-control" name="phonenumber" type="text" placeholder="Your phone number in form 123-456-7890" maxlength="12" required />
                        </span>
                        <c:if test="${sessionScope.LogIn != null}">
                            <div class="dropdown" horizontal center layout>
                                <img id="cc-img" src="/images/default-credit-card.png">
                                <select class="form-control btn btn-default dropdown-toggle" id="cc-info" name="creditcards" onchange="changeCcImg();">
                                    <option selected="selected">Existing Payment Method</option>
                                    <c:forEach var="card" items="${sessionScope.CreditCards}">
                                        <option value="${card}"><a role="menuitem" tabindex="-1" href="#">${card}</a></option>
                                    </c:forEach>
                                </select>
                            </div>
                        </c:if>
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
        <script>
            <c:if test="${sessionScope.LogIn != null}">
            function changeCcImg() {
                var ccList = document.getElementById("cc-info");
                for (var i = 0; i < ccList.childNodes.length; i++) {
                    if (ccList.childNodes[i].selected) {
                        var ccType = ccList.childNodes[i].textContent;
                        if (ccType.match("AMEX")) {
                            document.getElementById("cc-img").src = "/images/AMEX.png";
                        } else if (ccType.match("VISA")) {
                            document.getElementById("cc-img").src = "/images/VISA.png";
                        } else if (ccType.match("MasterCard")) {
                            document.getElementById("cc-img").src = "/images/MasterCard.png";
                        } else if (ccType.match("Discover")) {
                            document.getElementById("cc-img").src = "/images/Discover.png";
                        } else
                            document.getElementById("cc-img").src = "/images/default-credit-card.png";
                    }
                }
            }
            </c:if>
            <c:if test="${sessionScope.LogIn == null}">
            $('#cardnumber').bind('input', detectCcType);
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
            </c:if>
        </script>
    </body>
</html>
