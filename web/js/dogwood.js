var apiKey = "gs2spwmu9dt6uqnaxhsadxp6";
var baseURL = "http://api.rottentomatoes.com/api/public/v1.0";

var getBoxOfficeMovies = function (limit, country, callback) {
    $.ajax({
        dataType: "jsonp",
        url: baseURL + "/lists/movies/.json?apikey=" + apiKey +
                "&limit=" + encodeURI(limit) + "&country=" + encodeURI(country),
        success: callback
    });
};

var getInTheatersMovies = function (callback) {
    $.ajax({
        dataType: "jsonp",
        url: baseURL + "/lists/movies/in_theaters.json?apikey=" + apiKey,
        success: callback
    });
};

var getMovieCast = function (id, callback) {
    $.ajax({
        dataType: "jsonp",
        url: baseURL + "/movies/" + id + "/cast.json?apikey=" + apiKey,
        success: callback
    });
};

var getMovieInfo = function (id, callback) {
    $.ajax({
        dataType: "jsonp",
        url: baseURL + "/movies/" + id + ".json?apikey=" + apiKey,
        success: callback
    });
};

var getUpcomingMovies = function (callback) {
    $.ajax({
        dataType: "jsonp",
        url: baseURL + "/lists/movies/upcoming.json?apikey=" + apiKey,
        success: callback
    });
};

var searchMovies = function (query, page_limit, page, callback) {
    $.ajax({
        dataType: "jsonp",
        url: baseURL + "/movies.json?apikey=" + apiKey + "&q=" +
                encodeURI(query) + "&page_limit=" + encodeURI(page_limit) +
                "&page=" + encodeURI(page),
        success: callback
    });
};

function getGeoLocation() {
    var zipcode = '10001';
    var location = 'New York, NY';
    navigator.geolocation.getCurrentPosition(function (position) {
        var geocoder = new google.maps.Geocoder();
        var latLng = new google.maps.LatLng(
                position.coords.latitude, position.coords.longitude);
        geocoder.geocode({
            'latLng': latLng
        }, function (results, status) {
            for (var i = 0; i < results[0].address_components.length; i++) {
                var address = results[0].address_components[i];
                if (address.types[0] == "postal_code") {
                    zipcode = address.long_name;
                    location = results[0].formatted_address;
                }
            }
            document.getElementById("searchbar-theater").value = location;
        });
    });
}