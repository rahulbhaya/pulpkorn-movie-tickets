<%@page import="java.util.List"%>
<%@page import="org.dogwood.Database"%>
<%@page import="org.dogwood.Movie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Database db = new Database();
    List<Movie> movies = db.getInTheatersMovies();
    db.close();
%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        
	<%@include file="navbar.jsp"%>
        <div class="container-fluid">
            <!-- AdSpeed.com Serving Code 7.9.7 for [Ad] Game 600x200 -->
<script type="text/javascript">var asdate=new Date();var q='&tz='+asdate.getTimezoneOffset()/60 +'&ck='+(navigator.cookieEnabled?'Y':'N') +'&jv='+(navigator.javaEnabled()?'Y':'N') +'&scr='+screen.width+'x'+screen.height+'x'+screen.colorDepth +'&z='+Math.random() +'&ref='+escape(document.referrer.substr(0,255)) +'&uri='+escape(document.URL.substr(0,255));document.write('<ifr'+'ame width="600" height="200" src="http://g.adspeed.net/ad.php?do=html&aid=228639&oid=18710&wd=600&ht=200&target=_blank'+q+'" frameborder="0" scrolling="no" allowtransparency="true" hspace="0" vspace="0"></ifr'+'ame>');</script>
<noscript><iframe width="600" height="200" src="http://g.adspeed.net/ad.php?do=html&aid=228639&oid=18710&wd=600&ht=200&target=_blank" frameborder="0" scrolling="no" allowtransparency="true" hspace="0" vspace="0"><a href="http://g.adspeed.net/ad.php?do=clk&aid=228639&oid=18710&wd=600&ht=200&pair=as" target="_blank"><img style="border:0px;" src="http://g.adspeed.net/ad.php?do=img&aid=228639&oid=18710&wd=600&ht=200&pair=as" width="600" height="200"/></a></iframe>
</noscript><!--AdSpeed.com End -->
            <div class="jumbotron">
                <h1>Now Playing</h1>
                <div id="movies">
                    <%
                        for (Movie movie : movies) {
                    %>
                    <div class="movie-card">
                        <a href="movie.jsp?Id=<%=movie.id%>"><img src="<%=movie.image%>"></a>
                        <p><a href="movie.jsp?Id=<%=movie.id%>"><%=movie.title%></a></p>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
	<%@include file="material.jsp"%>
    </body>
</html>