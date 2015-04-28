<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
    $(document).ready(function() {
        // This command is used to initialize some elements and make them work properly
        $.material.init();
        
        setTimeout(function () {
                $(".jumbotron").css("opacity", "1");
                $(".jumbotron").css("margin-top", "0");
                $(".main").css("opacity", "1");
                $(".main").css("margin-top", "0");
        }, 500);
    });
</script>