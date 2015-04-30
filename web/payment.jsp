<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container-fluid">
            <form role="form" method="post" action="LogPurchase">
                <div class="form-group payment-info">
                        <fieldset>
                            <h1 class="payment-info-h1">Payment method</h1>
                            <span>
                                <label for="cardnumber">Card Number</label>
                                <input id="cardnumber" class="form-control" name="cardnumber" type="text" placeholder="16 digits credit card number" pattern="[0-9]{16}"/>
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
                                <input id="secure" class="form-control" name="secure" type="text" placeholder="3-4 digits on the back" pattern="[0-9]{3}([0-9])*"/>
                            </span>
                            <span>
                                <label for="namecard">Name on Card</label>
                                <input id="namecard" class="form-control" name="namecard" type="text" placeholder="Exact name as on the card"/>
                            </span>
                            <span>
                                <label for="billingaddress">Billing Address</label>
                                <input id="namecard" class="form-control" name="billingaddress" type="text" placeholder="Address associated with credit card"/>
                            </span>
                            <div class="dropdown">
                                <select class="form-control" id="cc-info" name="creditcards">
                                    <option selected="selected">Existing Payment Method</option>
                                    <c:forEach var="card" items="${sessionScope.CreditCards}">
                                        <option value="${card}"><img src=""><a role="menuitem" tabindex="-1" href="#">${card}</a></option>
                                    </c:forEach>
                                </select>
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
        <script>
        var ccList = document.getElementById("cc-info");
        var num = 0;
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
