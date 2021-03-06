<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container-fluid">
            <form role="form" method="post" action="SaveTickets">
                <div id="ticket-info" class="jumbotron">
                    <h1>Purchase Tickets for ${sessionScope.MovieTitle} at ${sessionScope.MovieTime}</h1>
                    <p>${sessionScope.Theater}</p>
                    <c:set var="adultPrice" value="${sessionScope.AdultPrice}"/>
                    <c:set var="childSeniorPrice" value="${sessionScope.ChildSeniorPrice}"/>
                    <div class="form-group">
                        <label>Adult Tickets:</label>
                        <select class="form-control" name="adults">
                            <option>0</option>
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                            <option>8</option>
                            <option>9</option>
                        </select>
                        <span> x </span>
                        <span class="cost">$<c:out value="${adultPrice}"/></span>
                        <span> = </span>
                        <span class="total">$0.00</span>
                    </div>
                    <div class="form-group">
                        <label>Senior Tickets:</label>
                        <select class="form-control" name="seniors">
                            <option>0</option>
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                            <option>8</option>
                            <option>9</option>
                        </select>
                        <span> x </span>
                        <span class="cost">$<c:out value="${childSeniorPrice}"/></span>
                        <span> = </span>
                        <span class="total">$0.00</span>                      
                    </div>
                    <div class="form-group">
                        <label>Child Tickets:</label>
                        <select class="form-control" name="children">
                            <option>0</option>
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                            <option>8</option>
                            <option>9</option>
                        </select>
                        <span> x </span>
                        <span class="cost">$<c:out value="${childSeniorPrice}"/></span>
                        <span> = </span>
                        <span class="total">$0.00</span>
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

        <script>
            $("select").change(function () {
                var self = $(this);
                self.siblings(".total").text("$" +
                        new Number(parseFloat(self.siblings(".cost").text().substring(1)) *
                                self.val()).toFixed(2));
            });

            $('input[type=radio][name=status]').change(function () {
                if (this.value == 'option1') {
                    $("#email-group").show();
                    $("#password-group").show();
                    $(".payment-info").hide();
                } else if (this.value == 'option2') {
                    $("#email-group").show();
                    $("#password-group").show();
                    $(".payment-info").hide();
                } else if (this.value == 'option3') {
                    $("#email-group").hide();
                    $("#password-group").hide();
                    $(".payment-info").show();
                }
            });
        </script>
    </body>
</html>