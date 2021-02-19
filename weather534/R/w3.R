#' Historical Weather Data
#'
#' @param x DT, date from the 5 previous days (unix time, UTC time zone)
#' @return ggplot
#' @examples
#' historical_weather("1613547787")
#' @import covr httr tidyverse
#' @export

historical_weather <- function(x) {
  # Error handling for input variable
  if (!as.numeric(x) > 1600000000){
    cat("Wrong DT, please try again.")
  }else{

    # create global variables
    id <- feel <- NULL

    #API document URL
    url <- "https://community-open-weather-map.p.rapidapi.com/onecall/timemachine"

    #API required parameters
    queryString <- list(
      lat = "37.774929",
      lon = "-122.419418",
      dt = x
    )

    #calling API and ask for result
    response <- VERB("GET", url, add_headers(
      "x-rapidapi-key" = 'f3fd1a076fmshbc268bc94d81135p170834jsn088d3533d81c',
      "x-rapidapi-host" = 'community-open-weather-map.p.rapidapi.com'),
      query = queryString, content_type("application/octet-stream"))

    #change the result to the data structure r can process
    weather <- content(response, "parse")

    #data wrangling, get feels like temperature, pressure, humidity and temperature
    feels_like = list()
    pressure = list()
    humidity = list()
    temp = list()

    for (i in (1:length(weather$hourly))){
      feels_like[[i]] <- weather$hourly[[i]]$feels_like-273.15
      pressure[[i]] <- weather$hourly[[i]]$pressure
      humidity[[i]] <- weather$hourly[[i]]$humidity
      temp[[i]] <- weather$hourly[[i]]$temp - 273.15
    }

    #create dataframe for the ggplot
    df <- data.frame(id = c(1:length(feels_like)),feel = unlist(feels_like),
                     pressure = unlist(pressure), humidity = unlist(humidity),
                     temp = unlist(temp))

    #identify the end points of each line
    feel_pos = feels_like[[length(feels_like)]]
    temp_pos = temp[[length(temp)]]
    humidity_pos = humidity[[length(humidity)]]

    #draw the line graph of each variable
    ggplot2::ggplot(df, ggplot2::aes(x = id)) +
      ggplot2::geom_line( ggplot2::aes(y = feel), color = "darkred") +
      ggplot2::geom_line( ggplot2::aes(y = humidity), color="blue", linetype="dotdash") +
      ggplot2::geom_line( ggplot2::aes(y = temp), color="orange", linetype="longdash") +

      ggplot2::geom_text( ggplot2::aes(label = "feels like *C", x = 24, y=feel_pos), color = "darkred",
                          hjust = 1,vjust = 2) +
      ggplot2::geom_text( ggplot2::aes(label = "temp *C", x = 24, y=temp_pos), color = "orange",
                          hjust = 1,vjust = -1) +
      ggplot2::geom_text( ggplot2::aes(label = "humidity", x = 24, y=humidity_pos),color = "blue",
                          hjust = 1,vjust = 1) +
      ggplot2::ggtitle("Temperature and humdity change in the past 24 hours") +
      ggplot2::xlab("Hours") +  ggplot2::ylab("Value")

  }
}

