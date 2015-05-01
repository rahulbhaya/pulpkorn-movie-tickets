<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container-fluid">
            <div class="jumbotron gift-card">
                <h1>Buy Gift Card</h1>
                <h2>Select Gift card amount</h2>
                <select>
                    <option value="25">$25</option>
                    <option value="30">$30</option>
                    <option value="35">$35</option>
                    <option value="40">$40</option>
                    <<option value="50">$50</option>
                    <option value="75">$75</option>
                    <option value="100">$100</option>

                </select>
                <h3>Quantity</h3>
                <input type="text" id="cardqty" name="cardqty" value="1" maxlength="3" size="3" tabindex="2" >

                <button class="btn btn-danger btn-fab btn-raised mdi-action-done login-submit-btn" type="submit"></button>
                </form>
            </div>
        </div>
        <%@include file="footer.jsp"%>
        <%@include file="material.jsp"%>
    </body>
</html>