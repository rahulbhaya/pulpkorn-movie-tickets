<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
	<%@include file="navbar.jsp"%>
        <div class="container-fluid">
            <div class="jumbotron" style="width:512px;margin-left:auto;margin-right:auto;">
                <h1 style="font-size: 1.5em;color: #00BCD4;font-weight: lighter;">Purhcase Tickets for MOVIE at TIME</h1>
                <p>THEATER</p>
                <form role="form">
                    <div class="form-group">
                        <label>Adult Tickets:</label>
                        <select class="form-control">
                            <option>1</option>
                            <option>2</option>
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
                        </select>
                        <span> x </span>
                        <span class="cost">$16.50</span>
                        <span> = </span>
                        <span class="total">$16.50</span>
                    </div>
                </form>
            </div>
            <div class="jumbotron" style="width:512px;margin-left:auto;margin-right:auto;">
                <h1 style="font-size: 1.5em;color: #00BCD4;font-weight: lighter;">Purhcase Tickets for MOVIE at TIME</h1>
                <p>THEATER</p>
                <form role="form">
                    <div class="form-group">
                        <label>Adult Tickets:</label>
                        <select class="form-control">
                            <option>1</option>
                            <option>2</option>
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
                        </select>
                        <span> x </span>
                        <span class="cost">$16.50</span>
                        <span> = </span>
                        <span class="total">$16.50</span>
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
        </script>
    </body>
</html>