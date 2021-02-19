
test_that("Successful!", {
  expect_error(historical_weather())
  expect_output(historical_weather("102"),"Wrong DT, please try again.")
  vdiffr::expect_doppelganger("A blank plot",historical_weather("1613547787"))


})
