<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container-fluid">
            <form role="form" method="post" action="SaveEmailToSession">
                <div id="refund-field" class="jumbotron account-card-main" layout center>
                    <fieldset>
                        <h1 class="payment-info-h1">Receipt Email:</h1>
                        <span>
                            <div horizontal center layout>
                                <input id="emailField" class="form-control" name="email" placeholder="Enter an email address to be sent a purchase receipt" required type="email">
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
