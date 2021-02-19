
test_that("Successful!", {
  expect_error(search_weather())
  expect_output(search_weather("london, UK"))
  expect_output(search_weather("nn"), 'Please try again with input format: "cityName, countryCode" ')


})
