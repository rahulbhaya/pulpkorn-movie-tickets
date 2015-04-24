<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container-fluid">
            <div id="ticket-info" class="jumbotron">
                <h1>Purchase Tickets for MOVIE at TIME</h1>
                <p>THEATER</p>
                <form role="form">
                    <div class="form-group">
                        <label>Adult Tickets:</label>
                        <select class="form-control">
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
                        <span class="cost">$19.50</span>
                        <span> = </span>
                        <span class="total">$19.50</span>
                    </div>
                    <div class="form-group">
                        <label>Senior Tickets:</label>
                        <select class="form-control">
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
                        <span class="cost">$16.50</span>
                        <span> = </span>
                        <span class="total">$16.50</span>                      
                    </div>
                    <div class="form-group">
                        <label>Child Tickets:</label>
                        <select class="form-control">
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
                        <span class="cost">$16.50</span>
                        <span> = </span>
                        <span class="total">$16.50</span>
                    </div>
                </form>
                <div class="form-group">
                    <div horizontal center layout>
                        <div flex></div>
                        <button class="btn btn-danger btn-fab btn-raised mdi-action-trending-neutral login-submit-btn" onclick="nextStep();"></button>
                    </div>
                </div>
            </div>
            <div id="card-info" class="jumbotron" style="display: none;">
                <h1>Checkout</h1>
                <form role="form">
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
                    <div class="user-info">
                        <div id="email-group" class="form-group">
                            <label for="Name">Email address</label>
                            <input class="form-control" name="Name" placeholder="Email address" required type="text" pattern="([a-z]*[A-Z]*[0-9]*)+@([a-z]*[A-Z]*[0-9]*)+\.([a-z]*[A-Z]*[0-9]*)+">
                        </div>
                        <div id="password-group" class="form-group">
                            <label for="Password">Password</label>
                            <input class="form-control" name="Password" placeholder="Password" required type="password">
                        </div>
                    </div>
                    <div class="form-group payment-info" style="display: none;">
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
                        </fieldset>
                    </div>
                    <fieldset>
                            <button class="btn btn-danger btn-fab btn-raised mdi-hardware-keyboard-backspace payment-goback-btn" onclick="goBack();"></button>
                            <button class="btn btn-danger btn-fab btn-raised mdi-action-done login-submit-btn" type="submit"></button>
                    </fieldset>
                </form>
            </div>
        </div>
        <%@include file="footer.jsp"%>
        <%@include file="material.jsp"%>
        <script>
            
            $(document).ready(function() {
                <c:if test="${sessionScope.LogIn != null}">
                    $(".status-info").hide();
                    $(".user-info").hide();
                    $(".payment-info").show();
                </c:if>
            });
            
            $("select").change(function () {
                var self = $(this);
                self.siblings(".total").text("$" +
                        new Number(parseFloat(self.siblings(".cost").text().substring(1)) *
                                self.val()).toFixed(2));
            });
            
            $('input[type=radio][name=status]').change(function() {
                if (this.value == 'option1') {
                    $("#email-group").show();
                    $("#password-group").show();
                    $(".payment-info").hide();
                }
                else if (this.value == 'option2') {
                    $("#email-group").show();
                    $("#password-group").show();
                    $(".payment-info").hide();
                }
                else if (this.value == 'option3') {
                    $("#email-group").hide();
                    $("#password-group").hide();
                    $(".payment-info").show();
                }
            });

            function goBack() {
                $("#card-info").fadeOut();
                $("#card-info").hide();
                $("#ticket-info").show();
                $("#ticket-info").fadeIn();
            }

            function nextStep() {
                $("#ticket-info").fadeOut();
                $("#ticket-info").hide();
                $("#card-info").show();
                $("#card-info").fadeIn();
            }
        </script>
    </body>
</html>