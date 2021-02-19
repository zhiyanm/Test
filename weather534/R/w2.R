#' Current Weather
#'
#' @param x City name, country code
#' @return City name, date, weather, temperature, pressure, humidity, visibility, wind speed
#' @examples
#' current("vancouver")
#' current("vancouver, ca")
#' current("Vancouver, CA")
#' current("VANCOUVER, CA")
#' @import httr
#' @import tidyverse
#' @import covr
#' @export

current <- function(x){

  url <- "https://community-open-weather-map.p.rapidapi.com/weather"
  queryString <- list(  q = x,
                        lat = "0",
                        lon = "0",
                        lang = "null",
                        units = "metric or imperial",        # API Documentation
                        mode = "xml, html")

  response <- VERB("GET", url,
                   add_headers('x-rapidapi-key' = '663cd4e808mshb2b76ba49419113p187089jsn7687c197632e',
                              'x-rapidapi-host' = 'community-open-weather-map.p.rapidapi.com'),
                   query = queryString, content_type("application/octet-stream"))

  data <- content(response, "parsed")                       # Data wrangling
  if (length(data$name) != 0) {
    city <- data$name                                       # get city name
    date <- format(Sys.time(),usetz = TRUE)                 # get current date
    a <- data$weather[[1]]$main                             # get weather description
    c <- round(data$main$temp - 273.15,1)                   # get temperature (in Celsius)
    d <- round(data$main$feels_like - 273.15,1)             # get temperature - feels like (in Celsius)
    e <- round((data$main$temp - 273.15)*9/5 + 32,1)        # get temperature (in Fahrenheit)
    f <- round((data$main$feels_like - 273.15)*9/5 + 32,1)  # get temperature - feels like (in Fahrenheit)
    g <- round(data$main$temp,1)                            # get temperature (in Kelvin)
    h <- round(data$main$feels_like ,1)                     # get temperature - feels like (in Kelvin)
    l <- data$main$pressure                                 # get pressure (hPa)
    m <- data$main$humidity                                 # get humidity (%)
    n <- data$visibility                                    # get visibility (in feet)
    o <- data$wind$speed                                    # get wind speed (miles per hour)

    cat('\nCity:          ', city,
        '\nDate:          ', date, '\n',                    # output current weather descriptions
        '\nWeather:       ', a,
        '\nTempreture(C): ', c,
        '\nFeels Like(C): ', d,
        '\nTempreture(F): ', e,
        '\nFeels Like(F): ', f,
        '\nTempreture(K): ', g,
        '\nFeels Like(K): ', h,
        '\nPressure:      ', l, 'hPa',
        '\nHumidity:      ', m, '%',
        '\nVisibility:    ', n, 'ft',
        '\nWind Speed:    ', o, 'm/h')
  }else{                                                    # error handling for input error
    cat('Please try again with input format: "cityName, countryCode" ')
  }
}
