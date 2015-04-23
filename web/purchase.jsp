<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
	<%@include file="navbar.jsp"%>
        <div class="container-fluid">
            <div id="ticket-info" class="jumbotron" style="width:512px;margin-left:auto;margin-right:auto;">
                <h1 style="font-size: 1.5em;color: #00BCD4;font-weight: lighter;">Purhcase Tickets for MOVIE at TIME</h1>
                <p>THEATER</p>
                <form role="form">
                    <div class="form-group">
                        <label>Adult Tickets:</label>
                        <select class="form-control">
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
                                    <filedset>
                     <button class="btn btn-danger btn-fab btn-raised mdi-action-trending-neutral" style="background-color: #d23f31;float:right;" onclick="nextStep();"></button>
                    </filedset>
                    </div>
            </div>
            <div id="card-info" class="jumbotron" style="width:512px;margin-left:auto;margin-right:auto;display: none;">
                <h1 style="font-size: 1.5em;color: #00BCD4;font-weight: lighter;">Checkout</h1>
                <form role="form">
                    <div class="form-group">
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
                    <div class="form-group">
                        <label for="Name">Email address</label>
                        <input class="form-control" name="Name" placeholder="Email address" required type="text" pattern="([a-z]*[A-Z]*[0-9]*)+@([a-z]*[A-Z]*[0-9]*)+\.([a-z]*[A-Z]*[0-9]*)+">
                    </div>
                    <div class="form-group">
                        <label for="Password">Password</label>
                        <input class="form-control" name="Password" placeholder="Password" required type="password">
                    </div>
                        </div>
                    <div class="form-group">
                        <fieldset>
                        <h1 style="font-size: 1.5em;color: #00BCD4;font-weight: lighter;">Payment method</h1>
                                <label for="cardnumber">Card Number</label>
                                <input id="cardnumber" class="form-control" name="cardnumber" type="number" required pattern="[0-9]{16}"/>
                                <label for="secure">Security Code</label>
                                <input id="secure" class="form-control" name="secure" type="number" required pattern="[0-9]{3}([0-9])*">
                                <label for="namecard">Name on Card</label>
                                <input id="namecard" class="form-control" name="namecard" type="text" placeholder="Exact name as on the card" required />
                    </fieldset>
                    <fieldset>
                         <button class="btn btn-danger btn-fab btn-raised mdi-hardware-keyboard-backspace" onclick="goBack();" style="background-color: #d23f31; float:left;"></button>
                        <button class="btn btn-danger btn-fab btn-raised mdi-action-done" type="submit" style="background-color: #d23f31; float:right;"></button>
                    </fieldset>
                    </div>
                </form>
            </div>
        </div>
	<%@include file="material.jsp"%>
        <script>
            $("select").change(function() {
                var self = $(this);
                self.siblings(".total").text("$" + 
                        new Number(parseFloat(self.siblings(".cost").text().substring(1)) * 
                        self.val()).toFixed(2));
            });
            
            function goBack(){
                $("#card-info").fadeOut();
                $("#card-info").hide();
                $("#ticket-info").show();
                $("#ticket-info").fadeIn();
            }
            
            function nextStep(){
                $("#ticket-info").fadeOut();
                $("#ticket-info").hide();
                $("#card-info").show();
                $("#card-info").fadeIn();
            }
        </script>
    </body>
</html>