#' Search weather data
#'
#' @param x City
#' @return City name, weather description, tempreture, humidity
#' @examples
#' search_weather("london, UK")
#' search_weather("london")
#' @import covr
#' @export


search_weather <- function(x) {

  #API document url
  url <- "https://community-open-weather-map.p.rapidapi.com/find"

  #API required variables
  queryString <- list(
    q = x, #city
    cnt = "1", #how many city maximum are searching in the function
    mode = "null", #search mode
    lon = "0", #longitude
    type = "link, accurate", #searching type
    lat = "0", #latitude
    units = "imperial, metric" #unit

  )

  #get response messeage from the API
  response <- VERB("GET", url, add_headers(
    "x-rapidapi-key" = 'f3fd1a076fmshbc268bc94d81135p170834jsn088d3533d81c',
    "x-rapidapi-host" = 'community-open-weather-map.p.rapidapi.com'),
    query = queryString, content_type("application/octet-stream"))

  #change API info to data structure r can process
  weather <- content(response, "parsed")

  #Using Kelvin degrees -273.15, data wrangling
  feels_like <- weather$list[[1]]$main$feels_like - 273.15
  temp_min <- weather$list[[1]]$main$temp_min - 273.15
  temp_max <- weather$list[[1]]$main$temp_max - 273.15
  pressure <- weather$list[[1]]$main$pressure
  humidity <- weather$list[[1]]$main$humidity
  weather_type <- weather$list[[1]]$weather[[1]]$main

  #error handling
  if (length(weather$list[[1]]$name) != 0) {
    city <- weather$list[[1]]$name

    cat('\nCity:          ', city,
        '\nWeather:       ', weather_type,
        '\nMin Tempreture(C): ', temp_min,
        '\nMax Tempreture(C): ', temp_max,
        '\nFeels Like(C): ', feels_like,
        '\nPressure: ', pressure,
        '\nHumidity:      ', humidity, '%\n')
  }else{
    cat('Please try again with input format: "cityName, countryCode" ')
  }
}




