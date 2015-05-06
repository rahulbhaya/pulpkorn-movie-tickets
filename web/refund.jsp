<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container-fluid">
            <form role="form" method="post" action="RefundPurchase">
                <div id="refund-field" class="jumbotron refund-card" layout center>
                    <fieldset>
                        <h1 class="payment-info-h1">Enter Purchase Number to Refund Purchase</h1>
                        <c:set var="refundSuccess" value="${sessionScope.RefundSuccess}"/>
                        <c:if test="${refundSuccess != null}">
                            <p class="alert-dismissable alert-danger"><c:out value="${refundSuccess}"/></p>
                        </c:if>
                        <span>
                            <div horizontal center layout>
                                <input id="pinField" class="form-control" name="pin" type="text" placeholder="Enter 7-digit pin" required pattern="[0-9]{7}">
                            </div>
                        </span>
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