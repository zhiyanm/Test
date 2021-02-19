#' 5 days weather forecast
#'
#' @param x City name, country code
#' @return City name, country code, date, weather description, temperature, humidity
#' @examples
#' fiveDay("vancouver")
#' fiveDay("vancouver, ca")
#' fiveDay("Vancouver, CA")
#' fiveDay("VANCOUVER, CA")
#' @import covr
#' @import httr
#' @import tidyverse
#' @export

fiveDay <- function(x) {
  url <- "https://community-open-weather-map.p.rapidapi.com/forecast"     # API documentation
  queryString <- list(q = x)
  response <- VERB("GET", url,
                   add_headers('x-rapidapi-key'  = '663cd4e808mshb2b76ba49419113p187089jsn7687c197632e',
                               'x-rapidapi-host' = 'community-open-weather-map.p.rapidapi.com' ),
                   query = queryString, content_type("application/octet-stream"))

  data <- content(response, "parsed")                              # data wrangling
  if (length(data[5]$city$name) != 0) {
    city <- data[5]$city$name                                      # get city name
    country <- data[5]$city$country                                # get country code
    cat('Location:      ', city, country, '\n')

    for (i in seq(1,33,8)){                                        # get weather forecast for 5 days
      a <- data[4]$list[[i]]$dt_txt                                # get dates
      b <- data[4]$list[[i]]$weather[[1]]$main                     # get weather descriptions
      c <- round(data[4]$list[[i]]$main$temp - 273.15,2)           # get temperatures (in Celsius)
      d <- round(data[4]$list[[i]]$main$feels_like - 273.15,2)     # get temperatures - feels like (in Celsius)
      e <- data[4]$list[[i]]$main$humidity                         # get humidity (%)
      cat('\nDate:          ', a,
          '\nWeather:       ', b,
          '\nTempreture(C): ', c,
          '\nFeels Like(C): ', d,
          '\nHumidity:      ', e, '%\n')                           # output 5 days weather forecast
    }                                                              # error handling for input error
  }else{
    cat('Please try again with input format: "cityName, countryCode" ')
  }
}
