<%@page import="org.dogwood.Database"%>
<%
    String name = (String) session.getAttribute("loggedIn");
    String movieId = request.getParameter("MovieId");
    String rating = request.getParameter("Rating");
    if (name == null || movieId == null || rating == null) {
        response.sendRedirect("index.jsp");
    }
    else if (!new Database().rate(name, movieId, rating)) {
        session.setAttribute("rated", "You already rated this movie.");
    }
    response.sendRedirect("movie.jsp?MovieId=" + movieId);
%>