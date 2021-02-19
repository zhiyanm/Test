
test_that("Successful!", {
  expect_error(fiveDay())
  expect_output(fiveDay("vancouver,ca"))
  expect_output(fiveDay("nn"), 'Please try again with input format: "cityName, countryCode" ')

})

