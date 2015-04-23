<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
	<%@include file="navbar.jsp"%>
        <div class="container-fluid">
            <div class="jumbotron">
                <div id="movie">
                    <c:set var="movie" value="${sessionScope.MovieById}"/>
                    <h1><c:out value="${movie.title}"/></h1>
                    <img src="<c:out value='${movie.image}'/>">
                    <h2>Release Date: <c:out value="${movie.releaseDate}"/></h2>
                    <h3>MPAA Rating: <c:out value="${movie.mpaaRating}"/></h3>
                    <h4>Synopsis:</h4>
                    <h5><c:out value="${movie.synopsis}"/></h5>
                    <div class="rw-ui-container"></div>
                </div>
            </div>
        </div>
        <script type="text/javascript">(function(d, t, e, m){
    
    // Async Rating-Widget initialization.
    window.RW_Async_Init = function(){
                
        RW.init({
            huid: "231447",
            uid: "45da1f49755606614115b385764dc9fe",
            source: "website",
            options: {
                "size": "medium",
                "style": "oxygen"
            } 
        });
        RW.render();
    };
        // Append Rating-Widget JavaScript library.
    var rw, s = d.getElementsByTagName(e)[0], id = "rw-js",
        l = d.location, ck = "Y" + t.getFullYear() + 
        "M" + t.getMonth() + "D" + t.getDate(), p = l.protocol,
        f = ((l.search.indexOf("DBG=") > -1) ? "" : ".min"),
        a = ("https:" == p ? "secure." + m + "js/" : "js." + m);
    if (d.getElementById(id)) return;              
    rw = d.createElement(e);
    rw.id = id; rw.async = true; rw.type = "text/javascript";
    rw.src = p + "//" + a + "external" + f + ".js?ck=" + ck;
    s.parentNode.insertBefore(rw, s);
    }(document, new Date(), "script", "rating-widget.com/"));
        </script>

        <%@include file="material.jsp"%>
    </body>
</html>