test_that("as_rut handles scalar and vector inputs", {
  expect_equal(as_rut("16.019.432"), "16019432K")
  expect_equal(as_rut("16.019.432-K"), "16019432K")
  expect_equal(
    as_rut(c("16.019.432", "16.355.485", NA_character_, "")),
    c("16019432K", "163554855", NA_character_, NA_character_)
  )
})

test_that("numeric helpers keep existing behaviour", {
  rutnum <- c(16019432, 16355485, 15724861, 121, 6505922)

  expect_equal(rutnum_dv(rutnum), c("K", "5", "8", "5", "1"))
  expect_equal(rutnum_rut(rutnum), c("16019432K", "163554855", "157248618", "1215", "65059221"))
})
