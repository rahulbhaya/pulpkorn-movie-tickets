<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="js/jquery-1.11.2.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<script src="js/ripples.min.js"></script>
<script src="js/material.min.js"></script>
<script>
    $(document).ready(function() {
        // This command is used to initialize some elements and make them work properly
        $.material.init();

		setTimeout(function () {
			$(".jumbotron").css("opacity", "1");
			$(".jumbotron").css("margin-top", "0");
		}, 500);
    });
</script>