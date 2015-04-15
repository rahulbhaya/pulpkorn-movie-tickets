var apiKey = "gs2spwmu9dt6uqnaxhsadxp6";
var baseURL = "http://api.rottentomatoes.com/api/public/v1.0";

var boxOfficeMovies = function(limit, country, callback) {
    $.ajax({
        dataType: "jsonp",
        url: baseURL + "/lists/movies/.json?apikey=" + apiKey + 
                "&limit=" + encodeURI(limit) + "&country=" + encodeURI(country),
        success: callback
    });
};

var inTheatersMovies = function(callback) {
    $.ajax({
        dataType: "jsonp",
        url: baseURL + "/lists/movies/in_theaters.json?apikey=" + apiKey,
        success: callback
    });
};

var movieCast = function(id, callback) {
    $.ajax({
        dataType: "jsonp",
        url: baseURL + "/movies/" + id + "/cast.json?apikey=" + apiKey,
        success: callback
    });
};

var movieInfo = function(id, callback) {
    $.ajax({
        dataType: "jsonp",
        url: baseURL + "/movies/" + id + ".json?apikey=" + apiKey,
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

var upcomingMovies = function(callback) {
    $.ajax({
        dataType: "jsonp",
        url: baseURL + "/lists/movies/upcoming.json?apikey=" + apiKey,
        success: callback
    });
};