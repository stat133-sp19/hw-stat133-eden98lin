context("Check binomials")

test_that("bin_choose with ok arguments", {
  expect_that(bin_choose(10, 3), equals(120))
  expect_that(bin_choose(17, 5), equals(6188))
  expect_that(bin_choose(20, 19), equals(20))
})

test_that("bin_choose fails with invalid arguments", {
  expect_error(bin_choose(10, 11))
  expect_error(bin_choose(5, 5.000001))
  expect_error(bin_choose(4.99999999, 5))
})

test_that("bin_probability with ok arguments", {
  expect_that(bin_probability(3, 10, 0.5), equals(0.1171875))
  expect_that(bin_probability(54, 60, 0.847), equals(0.08191757))
  expect_that(bin_probability(100, 101, 0.3478), equals(8.946639e-45))
})

test_that("bin_probability fails with invalid arguments", {
  expect_error(bin_probability(7, 5, 0.4))
  expect_error(bin_probability(5, 10, -0.4))
  expect_error(bin_probability(5, 8, 1.9))
  expect_error(bin_probability(4, 2, -34))
})

test_that("bin_distribution with ok arguments", {
  expect_that(bin_distribution(5, 0.5)[ ,2], is_equivalent_to(c(0.03125, 0.15625, 0.31250, 0.31250, 0.15625, 0.03125)))
  expect_that(bin_distribution(10, 0.2)[1:3, 2], is_equivalent_to(c(0.1073741824, 0.2684354560, 0.3019898880)))
  expect_that(bin_distribution(7, 0.7)[3:6, 2], is_equivalent_to(c(0.0250047, 0.0972405, 0.2268945, 0.3176523)))
})

test_that("bin_distriburion fails with invalid arguments", {
  expect_error(bin_distribution(-6, 0.5))
  expect_error(bin_distribution(6, -0.3))
  expect_error(bin_distribution(6, 1.4))
  expect_error(bin_distribution(-7, -265))
})

test_that("bin_cumulative with ok arguments", {
  expect_that(bin_cumulative(5, 0.5)[ ,3], is_equivalent_to(c(0.03125, 0.18750, 0.50000, 0.81250, 0.96875, 1.00000)))
  expect_that(bin_cumulative(10, 0.2)[1:3, 3], is_equivalent_to(c(0.1073741824, 0.3758096384, 0.6777995264)))
  expect_that(bin_cumulative(7, 0.7)[3:6, 3], is_equivalent_to(c(0.0287955, 0.1260360, 0.3529305, 0.6705828)))
})

test_that("bin_cumulative fails with invalid arguments", {
  expect_error(bin_cumulative(-3, 0.2))
  expect_error(bin_cumulative(26, -0.58))
  expect_error(bin_cumulative(9, 1.36))
  expect_error(bin_cumulative(-2, -0.5))
})
