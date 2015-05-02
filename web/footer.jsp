<%@page contentType="text/html" pageEncoding="UTF-8"%>
<footer>
    <div class="section-wrapper" layout horizontal>
        <div class="logo">
            <img alt="Logo" src="images/Logo.png">
        </div>
        <div flex>
        </div>
        <script>
            var subscribe = function (email) {
                var re = new RegExp("\([a-z]*[A-Z]*[0-9]*\)+@\([a-z]*[A-Z]*[0-9]*\)+\.\([a-z]*[A-Z]*[0-9]*\)+");
                if (re.exec(email) != null) {
                    $.post("Subscribe", {Email: email}, function (text) {
                        if (text === "Success") {
                            $(".fanmail-module input").prop("disabled", true).val("Thanks for subscribing");
                        } else {
                            $(".fanmail-module input").prop("disabled", true).val("This email is already subscribed");
                        }
                    });
                } else {
                    $(".fanmail-module input").val("");
                    $(".fanmail-module input").attr("placeholder", "Invalid email address");
                    setTimeout(function () {
                        $(".fanmail-module input").attr("placeholder", "Enter email to subscribe our newsletter");
                    }, 2000);
                }
            };
        </script>
        <div class="fanmail-module" style="margin-top: auto;margin-bottom: auto;padding-top: 5px;">
            <input class="form-control" name="Name" onkeydown="if (event.keyCode == 13)
                        subscribe(this.value)" placeholder="Enter email to subscribe our newsletter" type="text" required pattern="([a-z]*[A-Z]*[0-9]*)+@([a-z]*[A-Z]*[0-9]*)+\.([a-z]*[A-Z]*[0-9]*)+" style="width: 260px;color:#FFF;">
        </div>
        <ul>
            <li>
                <a href="about.jsp">About</a>
            </li>
            <li>
                <a href="">&nbsp;/&nbsp;</a>
            </li>
            <li>
                <a href="privacy_policy.jsp">Privacy</a>
            </li>
            <li>
                <a href="">&nbsp;/&nbsp;</a>
            </li>
            <li>
                <a href="help.html">Help</a>
            </li>
        </ul>
    </div>
</footer>