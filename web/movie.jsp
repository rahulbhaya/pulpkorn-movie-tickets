<%@page import="org.dogwood.Movie"%>
<%@page import="org.dogwood.Database"%>
<%
    Database db = new Database();
    Movie movie = db.getMovieById(request.getParameter("Id"));
    db.close();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <div class="container-fluid">
            <%@include file="navbar.jsp"%>
            <div class="jumbotron">
                <div id="movie">
                    <h1><%=movie.title%></h1>
                    <img src="<%=movie.image%>">
                    <h2>Release Date: <%=movie.releaseDate%></h2>
                    <h3>MPAA Rating: <%=movie.mpaaRating%></h3>
                    <h4>Synopsis:</h4>
                    <h5><%=movie.synopsis%></h5>
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
    }(document, new Date(), "script", "rating-widget.com/"));</script>

<div class="rw-ui-container"></div>
    </body>
</html>