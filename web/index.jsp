<%
    //Check if user is logged in
    String email = "Guest";
    if (session.getAttribute("loggedIn") != null) {
        email = (String) session.getAttribute("loggedIn");
    }
%>

<!doctype html>
<html>

<head>

    <title>Project PULPKORN</title>

    <meta name="viewport" content="width=device-width, minimum-scale=1.0, initial-scale=1.0, user-scalable=yes">
    <meta charset="utf-8">

    <script src="bower_components/webcomponentsjs/webcomponents.js"></script>
    <script src="js/jquery-1.11.2.min.js"></script>
    <script src="js/dogwood.js"></script>
    <link rel="stylesheet" href="css/default.css">
    <link rel="import" href="bower_components/paper-elements/paper-elements.html">
    <link rel="import" href="bower_components/core-elements/core-elements.html">
    <link rel="import" href="bower_components/sampler-scaffold/sampler-scaffold.html">
    <link rel="import" href="bower_components/font-roboto/roboto.html">
    <link rel="import" href="post-list.html">
    <script>
        //Test
        searchMovies("Gone with the Wind", 30, 1, function(data) {
            var movies = data.movies;
            $.each(movies, function(index, movie) {
                console.log(movie.title);
            });
        });
        $.ajax({
            url: "theaters.jsp?Near=11747",
            success: function(data) {
                var theaters = JSON.parse(data);
                for (var theater in theaters) {
                    console.log(theaters[theater].name);
                }
            }
        });
        $.ajax({
            url: "movie.jsp?MovieId=770672122",
            success: function(data) {
                var movie = JSON.parse(data);
                console.log(movie.title);
            }
        });
    </script>
    <style>
        * {
            -webkit-transition: all 0.1s ease-in;
            transition: all 0.1s ease-in;
        }

        html, body {
            height: 100%;
            margin: 0;
            background-color: #E5E5E5;
            font-family: "RobotoDraft", "Noto Sans", "Roboto", sans-serif !important;
            text-shadow: silver 0px 0px 1px !important;
        }

        core-header-panel {
            height: 100%;
            overflow: auto;
            -webkit-overflow-scrolling: touch;
        }

        core-toolbar {
            background: #03a9f4;
            color: white;
        }

        #tabs {
            width: 100%;
            margin-left: 200px;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            text-transform: uppercase;
        }

        @media (min-width: 481px) {
            #tabs {
                /*width: 200px;*/
            }
        }

        .container {
            padding: 1rem;
        }

        img {
            border: none;
        }

        #normal2, #normal3, #normal4, #normal5 {
            display: none;
        }

        .gallery {
            margin: 0 auto;
            width: 800px;
        }

        #thumbs {
            margin: 10px auto 10px auto;
            text-align: center;
            width: 800px;
        }

        #bigimages {
            width: 770px;
            float: left;
        }

        #thumbs img {
            width: 130px;
            height: 130px;
        }

        #bigimages img {
            border: 4px solid #03a9f4;
            margin-top: 5px;
            width: 750px;
        }

        #thumbs a:link, #thumbs a:visited {
            width: 130px;
            height: 130px;
            border: 5px solid #555;
            margin: 6px;
            float: left;
        }

        #thumbs a:hover {
            border: 5px solid #ffff8d;
        }

        footer {
            background: #444;
            height: 125px;
        }

        footer, header, section {
            display: block;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .section-wrapper {
            margin: 0 auto;
        }

        .logo {
            display: inline-block;
            float: left;
            width: 96px;
        }

        footer ul {
            margin: 0;
            padding: 51px 30px 0;
            text-align: right;
        }

        footer li {
            display: inline;
            line-height: 2.19;
            list-style: none;
            margin: auto;
        }

        footer a {
            color: #f3f3f3;
            font-size: .9em;
            font-weight: 400;
        }

        a {
            color: #0277bb;
            text-decoration: none;
            -webkit-transition: color 0.1s linear;
            -moz-transition: color 0.1s linear;
            transition: color 0.1s linear;
        }

        a {
            background: transparent;
            color: #02a8f3;
            text-decoration: none;
        }

        a {
            text-decoration: none;
        }

        @-webkit-keyframes shakeit {
            0% {
                -webkit-transform: translate(2px, 1px) rotate(0deg);
                transform: translate(2px, 1px) rotate(0deg);
            }

            2% {
                -webkit-transform: translate(-1px, -2px) rotate(-1deg);
                transform: translate(-1px, -2px) rotate(-1deg);
            }

            4% {
                -webkit-transform: translate(-3px, 0px) rotate(1deg);
                transform: translate(-3px, 0px) rotate(1deg);
            }

            6% {
                -webkit-transform: translate(0px, 2px) rotate(0deg);
                transform: translate(0px, 2px) rotate(0deg);
            }

            8% {
                -webkit-transform: translate(1px, -1px) rotate(1deg);
                transform: translate(1px, -1px) rotate(1deg);
            }

            10% {
                -webkit-transform: translate(-1px, 2px) rotate(-1deg);
                transform: translate(-1px, 2px) rotate(-1deg);
            }

            12% {
                -webkit-transform: translate(-3px, 1px) rotate(0deg);
                transform: translate(-3px, 1px) rotate(0deg);
            }

            14% {
                -webkit-transform: translate(2px, 1px) rotate(-1deg);
                transform: translate(2px, 1px) rotate(-1deg);
            }

            16% {
                -webkit-transform: translate(-1px, -1px) rotate(1deg);
                transform: translate(-1px, -1px) rotate(1deg);
            }

            18% {
                -webkit-transform: translate(2px, 2px) rotate(0deg);
                transform: translate(2px, 2px) rotate(0deg);
            }

            20% {
                -webkit-transform: translate(1px, -2px) rotate(-1deg);
                transform: translate(1px, -2px) rotate(-1deg);
            }
        }

        .shake:hover,
        .shake:focus {
        }

        .shake {
            display: inline-block;
            -webkit-animation-name: shakeit;
            -webkit-animation-duration: 2.5s;
            -webkit-transform-origin: 50% 50%;
            -webkit-animation-iteration-count: infinite;
            -webkit-animation-timing-function: linear;
            animation-name: shakeit;
            animation-duration: 2.5s;
            transform-origin: 50% 50%;
            animation-iteration-count: infinite;
            animation-timing-function: linear;
        }

        .container {
            -webkit-transition: margin 0.318s ease-in-out, opacity 0s ease-in;
            transition: margin 0.318s ease-in-out, opacity 0s ease-in;
        }
    </style>

</head>

<body unresolved>

    <core-header-panel mode="waterfall-tall">

        <core-toolbar id="site-head" class="tall" style="background-image:url('images/Banner.png'); background-size:cover;min-height: 120px;transition: all 0.18s ease-in;">
            <div class="core-header">
                <img id="site-logo" class="shake" src="images/Logo_icon.png" style="height: 120px;margin-top: 125px;margin-right:25px;">
                <paper-icon-button id="toolbar-menu" icon="menu" role="button" tabindex="0" aria-label="menu" style="display:none;"></paper-icon-button>
                <h1 style="margin: 0;">Pulpkorn</h1>
            </div>
            <paper-input id="searchbar" label="Search Movie or Theater" style="width:100%;"></paper-input>
            <paper-icon-button icon="search" role="button" tabindex="0" aria-label="search"></paper-icon-button>
            <paper-icon-button icon="more-vert" role="button" tabindex="0" aria-label="more-vert"></paper-icon-button>
            <paper-menu-button id="placeholder_user" tabindex="0" relative="" style="min-width: 126px;">
                <paper-item tabindex="0"><%=email %></paper-item>
                <paper-dropdown class="dropdown core-transition core-closed" tabindex="-1" style="outline: none; color: rgb(0, 0, 0); display: none;">
                <core-menu class="menu">
                    <paper-item id="dropdown_share" tabindex="0" class="">Share</paper-item>
                    <paper-item id="dropdown_settings" tabindex="0" class="">Settings</paper-item>
                    <paper-item id="dropdown_help" tabindex="0" class="">Help</paper-item>
                    <paper-item id="dropdown_signin" tabindex="0" class="" onclick="showLogInPage();">Sign In</a></paper-item>
                    <paper-item id="dropdown_reg" tabindex="0" class="" onclick="showRegistrationPage();">Join Today</paper-item>
                    <paper-item id="dropdown_signout" tabindex="0" class=""><a href="logout.jsp">Sign out</a></paper-item>
                </core-menu>
                </paper-dropdown>
            </paper-menu-button>
            <paper-tabs id="tabs" class="bottom indent" scrollable selected="all" self-end style="font-size: 22px;">
                <paper-tab name="all">Home</paper-tab>
                <paper-tab name="videos">In Theaters</paper-tab>
                <paper-tab name="upcoming">Upcoming</paper-tab>
            </paper-tabs>
        </core-toolbar>

        <div class="container" onmousewheel="checkToolboarHeight()" vertical center style="margin-top:2160px;opacity:0;">
            <post-list show="all"></post-list>
        </div>
        <footer>
            <div class="section-wrapper">
                <div class="logo">
                    <img alt="Logo" src="images/Logo.png" style="padding-left: 30px;height: 120px;">
                </div>
                <ul>
                    <li>
                        <a href="/">Project PULPKORN</a>
                    </li>
                    <li>
                        <a href="/">&nbsp;/&nbsp;</a>
                    </li>
                    <li>
                        <a href="">Privacy</a>
                    </li>
                    <li>
                        <a href="/">&nbsp;/&nbsp;</a>
                    </li>
                    <li>
                        <a href="/about/">About Us</a>
                    </li>
                </ul>
            </div>
        </footer>
        <paper-dialog id="content-dialog" transition="core-transition-bottom" role="dialog" backdrop layout="" vertical="" tabindex="-1" class="core-transition core-transition-bottom core-opened" style="position: fixed; outline: none; z-index: 12; top: 0px;">
            <iframe id="content-dialog-frame" src="" onload='javascript: resizeFrameHeight(this);' style="border: none; display: block; width: 100%"></iframe>
        </paper-dialog>
        <paper-toast id="toast1" class="core-transition core-transition-bottom" text="Post loaded successfully" style="padding-right: 60px; position: fixed; outline: none; z-index: 16; box-sizing: border-box; display: none;" role="status" touch-action="none" tabindex="-1"></paper-toast>
    </core-header-panel>


    <script>
        var tabs = document.querySelector('paper-tabs');
        var list = document.querySelector('post-list');
        
        function ajaxSwitchTabs(tabHtmlPath, isIndexPage){
            $(".container").css("opacity", "0");
            $(".container").css("margin-top", "2160px");
            if(isIndexPage){
                        var list = document.querySelectorAll( '.container' )[0].childNodes;
                        for (var i = 0; i < list.length; ++i) {
                          if(list[i].tagName==="POST-LIST"){
                              list[i].style.display = "";
                          }
                          else if(list[i].tagName!=undefined){
                              list[i].outerHTML="";
                          }
                        }
                        displayTransitionAnimation();
            }
            else{
                var ajaxFetch = new XMLHttpRequest();
                ajaxFetch.onreadystatechange = function () {
                    if (ajaxFetch.readyState == 4 && ajaxFetch.status == 200) {
                        var documentResponse = ajaxFetch.response;
                        var list = document.querySelectorAll( '.container' )[0].childNodes;
                        for (var i = 0; i < list.length; ++i) {
                          if(list[i].tagName==="POST-LIST"){
                              list[i].style.display = "none";
                          }
                          else if(list[i].tagName!=undefined){
                              list[i].outerHTML="";
                          }
                        }
                        document.getElementsByClassName('container')[0].innerHTML += documentResponse;
                        adjustContentHeight();
                        displayTransitionAnimation();
                    }
                };
                ajaxFetch.open('GET', tabHtmlPath + '.html', true);
                ajaxFetch.send();
            }
        }

        tabs.addEventListener('core-select', function () {
            list.show = tabs.selected;
            if(tabs.selected=="all")
                ajaxSwitchTabs(tabs.selected,true);
            else
                ajaxSwitchTabs(tabs.selected,false);
        });
        
        function showLogInPage(){
            ajaxSwitchTabs("signin", false);
        }
        
        function showRegistrationPage(){
            ajaxSwitchTabs("register", false);
        }
        
        function checkLoginStatus(){
            if($('#placeholder_user').find('paper-item')[0].textContent=="Guest"){
                $('#dropdown_signout').hide();
            }
            else{
                var reg_username = /(\w+)@(\w+)\.(\w+)/ig;
                $('#placeholder_user').find('paper-item')[0].textContent = reg_username.exec($('#placeholder_user').find('paper-item')[0].textContent)[1];
                $('#dropdown_signin').hide();
                $('#dropdown_reg').hide();
            }
        }
        
        
        function checkToolboarHeight() {
            var h = document.getElementById("site-head").clientHeight;
            if (h <= 120) {
                $('#site-logo').hide();
                //$('#toolbar-menu').fadeIn('fast');
                document.getElementById("searchbar").style.marginLeft = "50px";
                document.getElementById("tabs").style.marginLeft = "0px";
            } else {
                $('#site-logo').fadeIn('fast');
                //$('#toolbar-menu').hide();
                document.getElementById("searchbar").style.marginLeft = "0px";
                document.getElementById("tabs").style.marginLeft = "200px";
            }
        }
        function adjustContentHeight() {
            var contenth = document.body.clientHeight - document.getElementById("site-head").clientHeight - document.getElementsByTagName("footer")[0].clientHeight;
            document.getElementsByClassName("container")[0].style.minHeight = contenth + "px";
        }
        
        function displayTransitionAnimation() {
            var list = document.querySelectorAll( '.container' )[0];
                setTimeout(function () {
                $(".container").css("opacity", "1");
                $(".container").css("margin-top", "0");
                checkLoginStatus();
            }, 500);
        }

        function showContentDialog(postUrl) {
            document.querySelector('#content-dialog-frame').src = postUrl;
            document.querySelector('#content-dialog').style.left = (document.body.clientWidth - (document.body.clientWidth / 2) - 32 - 32) / 2 + 'px';
            document.querySelector('#content-dialog').toggle();
        }
        function resizeFrameHeight(frame) {
            frame.style.width = document.body.clientWidth / 2 + 'px';
            frame.style.height = 'auto';
            frame.style.minHeight = document.body.clientHeight - 32 - 32 + 'px';
            frame.style.height = frame.contentDocument.documentElement.scrollHeight + 'px';
            frame.contentWindow.document.body.style.overflow = 'hidden';
            if ($("#content-dialog-frame").length == 0)
                document.querySelector('#toast1').show();
        }

        $(document).ready(function () {
            setTimeout(function () {
                $(".container").css("opacity", "1");
                $(".container").css("margin-top", "0");
                checkLoginStatus();
            }, 500);
        });

    </script>
</body>

</html>