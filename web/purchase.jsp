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
                        <span class="cost">$19.50</span>
                        <span> = </span>
                        <span class="total">$19.50</span>
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
                        <span class="cost">$16.50</span>
                        <span> = </span>
                        <span class="total">$16.50</span>                      
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
                        <span class="cost">$16.50</span>
                        <span> = </span>
                        <span class="total">$16.50</span>
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