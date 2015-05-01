<!DOCTYPE html>
<html class="html" lang="en-US">
    <head>
        <%@include file="header.jsp"%>
        <script type="text/javascript">
            if (typeof Muse == "undefined")
                window.Muse = {};
            window.Muse.assets = {"required": ["jquery-1.8.3.min.js", "museutils.js", "jquery.watch.js", "index.css"], "outOfDate": []};
        </script>


        <meta http-equiv="Content-type" content="text/html;charset=UTF-8"/>
        <meta name="generator" content="2014.3.2.295"/>
        <title>About Us</title>
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="css/site_global.css?422415861"/>
        <link rel="stylesheet" type="text/css" href="css/aboutus.css?4150447411" id="pagesheet"/>
        <!-- Other scripts -->
        <script type="text/javascript">
            document.documentElement.className += ' js';
        </script>
    </head>
    <body>

        <div class="clearfix" id="page"><!-- column -->
            <div class="clearfix colelem" id="u75-4"><!-- content -->
                <p>About Us</p>
            </div>
            <div class="clearfix colelem" id="pu77-15"><!-- group -->
                <div class="clearfix grpelem" id="u77-15"><!-- content -->
                    <p>Pulpkorn was founded by four Stony Brook undergraduate students Michael Francis, Zhen Tan, Rahul Bhaya and Brian Bratt.</p>
                    <p>We are a team of aspiring students who want to simplify your movie booking experience. Our website is designed with a user friendly interface.</p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    <p id="u77-8">The Team</p>
                    <p>&nbsp;</p>
                    <p>Michael Francis&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Zhen Tan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Brian Bratt&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rahul Bhaya</p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                </div>
                <div class="clearfix grpelem" id="u78"><!-- group -->
                    <div class="clip_frame grpelem" id="u85"><!-- image -->
                        <img class="block" id="u85_img" src="images/michael.jpg" alt="" width="179" height="179"/>
                    </div>
                </div>
                <div class="clip_frame grpelem" id="u79"><!-- image -->
                    <img class="block" id="u79_img" src="images/10865818_10205954127558933_4122616811492680157_o.jpg" alt="" width="186" height="186"/>
                </div>
                <div class="clip_frame grpelem" id="u91"><!-- image -->
                    <img class="block" id="u91_img" src="images/facebook-default-no-profile-pic.jpg" alt="" width="187" height="187"/>
                </div>
                <div class="clip_frame clearfix grpelem" id="u97"><!-- image -->
                    <div id="u97_clip">
                        <img class="position_content" id="u97_img" src="images/facebook-default-no-profile-pic.jpg" alt="" width="186" height="187"/>
                    </div>
                </div>
            </div>
            <div class="verticalspacer"></div>
        </div>
        <!-- JS includes -->
        <script type="text/javascript">
            if (document.location.protocol != 'https:')
                document.write('\x3Cscript src="http://musecdn2.businesscatalyst.com/scripts/4.0/jquery-1.8.3.min.js" type="text/javascript">\x3C/script>');
        </script>
        <script type="text/javascript">
            window.jQuery || document.write('\x3Cscript src="scripts/jquery-1.8.3.min.js" type="text/javascript">\x3C/script>');
        </script>
        <script src="scripts/museutils.js?521960461" type="text/javascript"></script>
        <script src="scripts/jquery.watch.js?56779320" type="text/javascript"></script>
        <!-- Other scripts -->
        <script type="text/javascript">
            $(document).ready(function () {
                try {
                    (function () {
                        var a = {}, b = function (a) {
                            if (a.match(/^rgb/))
                                return a = a.replace(/\s+/g, "").match(/([\d\,]+)/gi)[0].split(","), (parseInt(a[0]) << 16) + (parseInt(a[1]) << 8) + parseInt(a[2]);
                            if (a.match(/^\#/))
                                return parseInt(a.substr(1), 16);
                            return 0
                        };
                        (function () {
                            $('link[type="text/css"]').each(function () {
                                var b = ($(this).attr("href") || "").match(/\/?css\/([\w\-]+\.css)\?(\d+)/);
                                b && b[1] && b[2] && (a[b[1]] = b[2])
                            })
                        })();
                        (function () {
                            $("body").append('<div class="version" style="display:none; width:1px; height:1px;"></div>');
                            for (var c = $(".version"), d = 0; d < Muse.assets.required.length; ) {
                                var f = Muse.assets.required[d], g = f.match(/([\w\-\.]+)\.(\w+)$/), k = g && g[1] ? g[1] : null, g = g && g[2] ? g[2] : null;
                                switch (g.toLowerCase()) {
                                    case "css":
                                        k = k.replace(/\W/gi, "_").replace(/^([^a-z])/gi, "_$1");
                                        c.addClass(k);
                                        var g = b(c.css("color")), h = b(c.css("background-color"));
                                        g != 0 || h != 0 ? (Muse.assets.required.splice(d, 1), "undefined" != typeof a[f] && (g != a[f] >>> 24 || h != (a[f] & 16777215)) && Muse.assets.outOfDate.push(f)) : d++;
                                        c.removeClass(k);
                                        break;
                                    case "js":
                                        k.match(/^jquery-[\d\.]+/gi) &&
                                                typeof $ != "undefined" ? Muse.assets.required.splice(d, 1) : d++;
                                        break;
                                    default:
                                        throw Error("Unsupported file type: " + g);
                                }
                            }
                            c.remove();
                            if (Muse.assets.outOfDate.length || Muse.assets.required.length)
                                c = "Some files on the server may be missing or incorrect. Clear browser cache and try again. If the problem persists please contact website author.", (d = location && location.search && location.search.match && location.search.match(/muse_debug/gi)) && Muse.assets.outOfDate.length && (c += "\nOut of date: " + Muse.assets.outOfDate.join(",")), d && Muse.assets.required.length && (c += "\nMissing: " + Muse.assets.required.join(",")), alert(c)
                        })()
                    })();
                    /* body */
                    Muse.Utils.transformMarkupToFixBrowserProblemsPreInit();/* body */
                    Muse.Utils.prepHyperlinks(true);/* body */
                    Muse.Utils.fullPage('#page');/* 100% height page */
                    Muse.Utils.showWidgetsWhenReady();/* body */
                    Muse.Utils.transformMarkupToFixBrowserProblems();/* body */
                } catch (e) {
                    if (e && 'function' == typeof e.notify)
                        e.notify();
                    else
                        Muse.Assert.fail('Error calling selector function:' + e);
                }
            });
            <%@include file="footer.jsp"%>
            <%@include file="material.jsp"%>
            < /body>
                    < /html>
