<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container-fluid movie-detail-container" horizontal center>
            <div class="jumbotron">
                <div id="movie" horizontal center layout>
                    <c:set var="isAdmin" value="${sessionScope.IsAdmin}"/>
                    <c:set var="movie" value="${sessionScope.MovieById}"/>
                    <div class="movie-detail-card">
                        <h1><c:out value="${movie.title}"/></h1>
                        <img src="<c:out value='${movie.image}'/>">
                    </div>
                    <div>
                        <h2>Release Date: <c:out value="${movie.releaseDate}"/></h2>
                        <h3>MPAA Rating: <c:out value="${movie.mpaaRating}"/></h3>
                        <h4>Synopsis:</h4>
                        <h5><c:out value="${movie.synopsis}"/></h5>
                        <button class="btn btn-default" onclick="getGeoLocation('<c:out value='${movie.title}'/>');" type="button">View Movie Times</button>
                        <h4>Cast:</h4>
                        <h5>
                            <c:forEach var="cast" items="${sessionScope.Cast}">
                                <c:out value="${cast.name}"/>,&nbsp;
                            </c:forEach>
                        </h5>
                        <div class="rw-ui-container"></div>
                        <c:if test="${isAdmin != null}">
                            <form action="DeleteMovie" method="POST" role="form">
                                <div class="form-group">
                                    <input name="MovieId" type="hidden" value="<c:out value='${param.MovieId}'/>">
                                    <button class="btn btn-flat btn-danger pull-right" type="submit">
                                        Delete Movie
                                    </button>
                                </div>
                            </form>
                        </c:if>
                    </div>
                </div>
                <div>
                    <a href="https://www.facebook.com/sharer/sharer.php?u=http://localhost:8080/GetMovieById?MovieId='${param.MovieId}' target='_blank'">
                        <img src="/images/fb_icon_325x325.png" height="20" width="20">Share on Facebook</a>
                </div>                 
            </div>
            <div class="jumbotron">
                <h3>Trailer</h3>
                <iframe width="700" height="395" src="<c:out value='${Trailer}'/>" frameborder="0" allowfullscreen></iframe>
            </div>

            <div class="jumbotron">
                <div>
                    <h3>Comments</h3>
                    <div class="list-group">
                        <c:forEach var="comment" items="${sessionScope.Comments}">
                            <c:set var="name" value="${comment.userName}"/>
                            <c:if test="${isAdmin != null}">
                                <form action="RemoveComment" method="POST" role="form">
                                    <div class="form-group">
                                        <input name="Commenter" type="hidden" value="<c:out value='${name}'/>">
                                        <input name="MovieId" type="hidden" value="<c:out value='${param.MovieId}'/>">
                                        <input name="DateCommented" type="hidden" value="<c:out value='${comment.dateCommented}'/>">
                                        <button class="btn btn-flat btn-danger pull-right" type="submit">
                                            Remove
                                        </button>
                                    </div>
                                </form>
                            </c:if>
                            <div class="list-group-item">
                                <div class="row-picture">
                                    <img class="circle" src="https://github.com/identicons/<c:out value='${name}'/>.png">
                                </div>
                                <div class="row-content">
                                    <h4 class="list-group-item-heading"><c:out value="${name}"/> on <c:out value="${comment.dateCommented}"/></h4>
                                    <p class="list-group-item-text"><h5><c:out value="${comment.message}"/></h5></p>
                                </div>
                            </div>
                            <div class="list-group-separator"></div>

                        </c:forEach>
                    </div>
                    <c:if test="${sessionScope.LogIn != null}">
                        <form action="Comment" method="POST" role="form">
                            <div class="form-control-wrapper" horizontal layout>
                                <input name="MovieId" type="hidden" value="<c:out value='${param.MovieId}'/>">
                                <textarea class="form-control empty" maxlength="140" name="Message" rows="1"></textarea>
                                <div class="floating-label">Write a new comment...</div>
                                <span class="material-input"></span>
                                <div horizontal center layout>
                                    <div flex=""></div>
                                    <button class="btn btn-flat btn-primary mdi-content-send" type="submit"></button>
                                </div>
                            </div>
                        </form> 
                    </c:if>
                    <c:if test="${sessionScope.LogIn == null}">
                        <label>Commenting disabled for guests. <a href="login.jsp">Sign in</a> to comment.</label>
                    </c:if>
                </div>

            </div>

        </div>                        
        <%@include file="footer.jsp"%>
        <%@include file="material.jsp"%>
        <script type="text/javascript">(function (d, t, e, m) {

                // Async Rating-Widget initialization.
                window.RW_Async_Init = function () {

                    RW.init({
                        huid: "231447",
                        uid: "45da1f49755606614115b385764dc9fe",
                        source: "website",
                        options: {
                            "size": "medium",
                            "style": "oxygen",
                            "forceSync": false
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
                if (d.getElementById(id))
                    return;
                rw = d.createElement(e);
                rw.id = id;
                rw.async = true;
                rw.type = "text/javascript";
                rw.src = p + "//" + a + "external" + f + ".js?ck=" + ck;
                s.parentNode.insertBefore(rw, s);
            }(document, new Date(), "script", "rating-widget.com/"));
        </script>
    </body>
</html>