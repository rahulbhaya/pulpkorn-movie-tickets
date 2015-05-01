<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container-fluid">
            <div class="main">
                <h1>Buy Gift Card</h1>
                <div id="gift-card" horizontal layout center-justified>
                    <div class="jumbotron gift-card-main">
                        <div id="gift-card-body" horizontal end layout style="float: right;">
                            <div style="width: 50%;">
                                <img id="site-logo" src="images/Logo_icon.png" class="shake">
                                <div style="font-size: 3rem;font-weight: bold;">
                                    Pulpkorn Gift Card
                                </div>
                            </div>
                            <form>
                                <button class="btn btn-danger btn-fab btn-raised mdi-action-done gift-card-submit-btn" type="submit"></button>
                                <div class="gift-card-amount">
                                    <div class="form-group">
                                        <div class="input-group" style="width: 180px;">
                                            <span class="input-group-addon" style="font-size: 10rem;color: #FFF;">$</span>
                                            <select class="form-control dropdown-toggle" id="cardamt" style="width: 180px;font-size: 10rem;height: 140px;color: #FFF;text-align: right;">
                                                <option class="gift-card-amount-item">20</option>
                                                <option class="gift-card-amount-item">25</option>
                                                <option class="gift-card-amount-item">30</option>
                                                <option class="gift-card-amount-item">35</option>
                                                <option class="gift-card-amount-item">40</option>
                                                <option class="gift-card-amount-item">50</option>
                                                <option class="gift-card-amount-item">75</option>
                                                <option class="gift-card-amount-item">100</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="gift-card-quantity">
                                    <div class="form-group" style="float: right;">
                                        <div class="input-group" style="width: 65px;">
                                            <span class="input-group-addon" style="font-size: 5rem;color: #FFF;">×</span>
                                            <input type="text" class="form-control" id="cardqty" value="1" maxlength="1" size="1" required pattern="[1-9]" style="width: 65px;font-size: 5rem;height: 72px;color: #FFF;text-align: right;">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp"%>
        <%@include file="material.jsp"%>
    </body>
</html>