context("Check summary measures")

test_that("aux_mean does correct calculation", {
  expect_that(aux_mean(10, 0.5), equals(5))
  expect_that(aux_mean(7, 0.25), equals(1.75))
  expect_that(aux_mean(45, 0.32), equals(14.4))
})

test_that("aux_variance does correct calculation", {
  expect_that(aux_variance(5, 0.2), equals(0.8))
  expect_that(aux_variance(10, 0.24), equals(1.824))
  expect_that(aux_variance(953, 0.53), equals(237.3923))
})

test_that("aux_mode does correct calculation", {
  expect_that(aux_mode(10, 0.3), equals(3))
  expect_that(aux_mode(77, 0.43), equals(33))
  expect_that(aux_mode(9, 0.9), equals(9))
})

test_that("aux_skewness does correct calculation", {
  expect_that(aux_skewness(14, 0.2), equals(0.4008918629))
  expect_that(aux_skewness(5, 0.5), equals(0))
  expect_that(aux_skewness(20, 0.25), equals(0.2581989))
})

test_that("aux_kurtosis does correct calculation", {
  expect_that(aux_kurtosis(10, 0.3), equals(-0.1238095238))
  expect_that(aux_kurtosis(39, 0.75), equals(-0.01709402))
  expect_that(aux_kurtosis(5, 0.12), equals(0.6939394))
})

