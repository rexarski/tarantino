# test tarantino_palette ------------------------------------------------

test_that("tarantino_palette is palette", {
  expect_s3_class(tarantino_palette(name = "KillBillVol1"), "palette")
})

test_that("tarantino_palette can extract number of colors no greater than its cardinality", {
  expect_equal(length(tarantino_palette(name = "KillBillVol1", n = 2)), 2)
})

test_that('tarantino_palette cannot extract number of colors greater than its cardinality while type is "discrete"', {
  expect_error(tarantino_palette(name = "KillBillVol1", n = 20, type = "discrete"))
})

test_that("tarantino_palette cannot extract movies not directed by Tarantino", {
  expect_error(tarantino_palette(name = "TheWolfofWallStreet"))
})

test_that('tarantino_palette can extract any number of colors as long as the type is "continuous"', {
  expect_equal(length(tarantino_palette(name = "KillBillVol1", n = 100, type = "continuous")), 100)
  expect_s3_class(tarantino_palette(name = "KillBillVol1", n = 100, type = "continuous"), "palette")
})
