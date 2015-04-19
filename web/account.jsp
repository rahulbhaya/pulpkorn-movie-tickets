<%
    if (session.getAttribute("LogIn") == null) {
        response.sendRedirect("index.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
	<%@include file="navbar.jsp"%>
        <div class="container-fluid">
            <div class="jumbotron">
                <h1>Your Account</h1>
                <h2>Change Password</h2>
                <%
                    if (session.getAttribute("ChangePasswordSuccess") != null) {
                %>
                <p class="bg-success">Successfully changed password!</p>
                <%
                        session.removeAttribute("ChangePasswordSuccess");
                    }
                    else if (session.getAttribute("ChangePasswordFail") != null) {
                %>
                <p class="bg-danger">Incorrect password</p>
                <%
                        session.removeAttribute("ChangePasswordFail");
                    }
                %>
                <form action="ChangePassword" method="POST" role="form">
                    <div class="form-group">
                        <label for="CurrentPassword">Current Password:</label>
                        <input class="form-control" name="CurrentPassword" placeholder="Enter current password" required type="password">
                    </div>
                    <div class="form-group">
                        <label for="NewPassword">New Password:</label>
                        <input class="form-control" name="NewPassword" placeholder="Enter new password" required type="password">
                    </div>
                    <button class="btn btn-default" type="submit">Submit</button>
                </form>
            </div>
        </div>
           
       <form id=payment>
    <fieldset>
        <legend>Card Details</legend>
        <ol>
            <li>
            <fieldset>
                <legend>Card Type</legend>
                <ol>
                    <li>
                        <input id=visa name=cardtype type=radio />
                        <label for=visa>VISA</label>
                        <img src="images/visa.jpg">
                    </li>
                    <li>
                        <input id=amex name=cardtype type=radio />
                        <label for=amex>AmEx</label>
                        <img src="images/amex.jpg" >
                    </li>
                    <li>
                        <input id=mastercard name=cardtype type=radio />
                        <label for=mastercard>Mastercard</label>
                        <img src="images/mastercard.jpg"  >
                    </li>
                </ol>
            </fieldset>
            </li>
            <li>
                <label for=cardnumber>Card Number</label>
                <input id=cardnumber name=cardnumber type=number required />
            </li>
            <li>
                <label for=secure>Security Code</label>
                <input id=secure name=secure type=number required />
            </li>
            <li>
                <label for=namecard>Name on Card</label>
                <input id=namecard name=namecard type=text placeholder="Exact name as on the card" required />
            </li>
        </ol>
    </fieldset>
    <fieldset>
        <button type=submit>Submit </button>
    </fieldset>
</form>
	<%@include file="material.jsp"%>
    </body>
</html>