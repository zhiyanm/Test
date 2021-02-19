
test_that("Successful!", {
  expect_error(current())
  expect_output(current("vancouver,ca"))
  expect_output(current("nn"), 'Please try again with input format: "cityName, countryCode" ')

})
