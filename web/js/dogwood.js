var apiKey = "gs2spwmu9dt6uqnaxhsadxp6";
var baseURL = "http://api.rottentomatoes.com/api/public/v1.0";

var getBoxOfficeMovies = function(limit, country, callback) {
    $.ajax({
        dataType: "jsonp",
        url: baseURL + "/lists/movies/.json?apikey=" + apiKey + 
                "&limit=" + encodeURI(limit) + "&country=" + encodeURI(country),
        success: callback
    });
};

var getInTheatersMovies = function(callback) {
    $.ajax({
        dataType: "jsonp",
        url: baseURL + "/lists/movies/in_theaters.json?apikey=" + apiKey,
        success: callback
    });
};

var getMovieCast = function(id, callback) {
    $.ajax({
        dataType: "jsonp",
        url: baseURL + "/movies/" + id + "/cast.json?apikey=" + apiKey,
        success: callback
    });
};

var getMovieInfo = function(id, callback) {
    $.ajax({
        dataType: "jsonp",
        url: baseURL + "/movies/" + id + ".json?apikey=" + apiKey,
        success: callback
    });
};

var getUpcomingMovies = function(callback) {
    $.ajax({
        dataType: "jsonp",
        url: baseURL + "/lists/movies/upcoming.json?apikey=" + apiKey,
        success: callback
    });
};

var searchMovies = function(query, page_limit, page, callback) {
    $.ajax({
        dataType: "jsonp",
        url: baseURL + "/movies.json?apikey=" + apiKey + "&q=" + 
                encodeURI(query) + "&page_limit=" + encodeURI(page_limit) + 
                "&page=" + encodeURI(page),
        success: callback
    });
};