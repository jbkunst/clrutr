test_that("as_rut handles scalar and vector inputs", {
  expect_equal(as_rut("16.019.432"), "160194324")
  expect_equal(as_rut("16.019.432-4"), "160194324")
  expect_equal(
    as_rut(c("16.019.432", "16.355.485", NA_character_, "")),
    c("160194324", "163554852", NA_character_, NA_character_)
  )
})

test_that("numeric helpers keep existing behaviour", {
  rutnum <- c(16019432, 16355485, 15724861, 121, 6505922)

  expect_equal(rutnum_dv(rutnum), c("4", "2", "8", "K", "3"))
  expect_equal(rutnum_rut(rutnum), c("160194324", "163554852", "157248618", "121K", "65059223"))
})
