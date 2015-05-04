<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <%@include file="navbar.jsp"%>
        <h1>Movie News</h1>
        <div class="container-fluid">
            <div class="main">
                <h2></h2>
                <div style="border:0px; overflow:hidden; margin: 15px auto; display:block; width:100%; height:100%; max-width: 963px;">
<iframe scrolling="yes" src="http://www.cinemablend.com/news.php" style="border: 0px none;  margin-left:-291px;height: 1500px; margin-top: -180px; width: 1550px; margin-bottom: -720px;">
</iframe>
</div>
            </div>
        </div>
        <%@include file="footer.jsp"%>
        <%@include file="material.jsp"%>
    </body>
</html>