<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container-fluid">
            <form role="form" method="post" action="SavePurchaseInfo">
                <div id="card-info" class="jumbotron">
                    <h1>Checkout</h1>
                    <div class="form-group status-info">
                        <label>Checkout as:</label>
                        <div class="radio radio-primary">
                            <label>
                                <input type="radio" name="status" value="option1" checked>
                                Join Pulpkorn today
                            </label>
                        </div>
                        <div class="radio radio-primary">
                            <label>
                                <input type="radio" name="status" value="option2">
                                Sign in as a returned user
                            </label>
                        </div>
                        <div class="radio radio-primary">
                            <label>
                                <input type="radio" name="status" value="option3">
                                Checkout as a guest
                            </label>
                        </div>
                    </div>
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
