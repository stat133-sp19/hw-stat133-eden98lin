context("Check checker functions")

test_that("check_prob with ok probability", {
  expect_true(check_prob(0.5))
  expect_true(check_prob(0.34))
  expect_true(check_prob(0.0007))
  expect_true(check_prob(1))
  expect_true(check_prob(0))
})

test_that("check_prob fails with invalid probability", {
  expect_error(check_prob(-0.3))
  expect_error(check_prob(1.5))
  expect_error(check_prob(-13))
})

test_that("check_trials with ok trials", {
  expect_true(check_trials(1))
  expect_true(check_trials(5))
  expect_true(check_trials(100))
})

test_that("check_trials fails with invalid number of trials", {
  expect_error(check_trials(0))
  expect_error(check_trials(-100))
  expect_error(check_trials(-0.0000001))
})

test_that("check_success with ok trials and success", {
  expect_true(check_success(0, 10))
  expect_true(check_success(1, 100))
  expect_true(check_success(99, 100))
})

test_that("check_success fails with invalid number of success and/or number of trials", {
  expect_error(check_success(-1, 10))
  expect_error(check_success(10, 9))
  expect_error(check_success(5, -9))
  expect_error(check_success(-2, -3))
})
