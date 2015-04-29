<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <%@include file="navbar.jsp"%>
        <script src="js/jquery-ui.js"></script>
        <script>
            $(function () {
                $("#accordion").accordion();
            });
            $("h3").hover(function () {
                $(this).css("color","#009688");
            });
        </script>
        <div class="container-fluid">
            <div class="main">
                <h1>Frequently Asked Questions</h1>
                <div id="theaters" vertical layout wrap center>
                    <div class="card-header theater-card" layout horizontal center>
                        <div class="movie-card-outer">
                            <div class="movie-card-inner" style="padding:20px;">
                                <div id="accordion">
                                    <c:forEach var="faq" items="${sessionScope.FAQs}">
                                        <h3><c:out value="${faq.question}"/></h3>
                                        <div>
                                            <p><c:out value="${faq.answer}"/></p>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp"%>
        <%@include file="material.jsp"%>
    </body>
</html>