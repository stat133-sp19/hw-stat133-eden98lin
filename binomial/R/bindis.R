# private functions to check if inputs for the binomial distribution are valid
# check_prob() tests if an input prob is a valid probability value (i.e. 0>=p>=1).
check_prob <- function(prob) {
  if ((prob >= 0) & (prob <= 1)){
    return (TRUE)
  }
  else{
    stop("invalid prob value")
  }
}

# check_trials() tests if an input trials is a valid value for number of trials (i.e. n is non-negative integer).
check_trials <- function(trials){
  if (trials > 0){
    return (TRUE)
  }
  else{
    stop("invalid trials value")
  }
}

# check_success() tests if an input success is a valid value for number of successes (i.e. 0<=k<=n)
check_success <- function(success, trials){
  vec <- c()
  for (i in success){
    if ((i >= 0) & (i <= trials)){
      vec <- c(vec, TRUE)
    }
    else if (i > trials){
      stop("success cannot be greater than trials")
    }
    else{
      stop("invalid success value")
    }
  }
  return (all(vec))
}


#' @title Binomial Choose
#' @description Calculate the number of combinations in which k successes can occur in n trials
#' @param n, number of trials of the distribution
#' @param k, size of the combination want to be choose from the distribution
#' @return Number of combinations there are to choose sample of size k from distribution of size n
#' @export
#' @examples
#' bin_choose(5, 3)
#' bin_choose(10, 4)
bin_choose <- function(n, k){
  for (i in k){
    if (i > n){
      stop("k cannot be greater than n")
    }
  }
  denom_fac1 <- factorial(k)
  denom_fac2 <- factorial(n - k)
  return (factorial(n)/(denom_fac1 * denom_fac2))
}

#' @title Binomial Probability
#' @description Calculate the probability of a binomial random variable for desire number of successes with probability from a number of trials
#' @param success, number of successes
#' @param trials, number of trials
#' @param prob, the probability of success
#' @return The probability of having the given number of success from the given number of trials with given probability
#' @export
#' @examples
#' bin_probability(3, 7, 0.3)
#' bin_probability(2, 5, 0.5)
bin_probability <- function(success, trials, prob){
  if (check_trials(trials) & check_prob(prob) & check_success(success, trials)){
    return(bin_choose(trials, success) * (prob ^ success) * ((1 - prob) ^ (trials - success)))
  }
  else{
    stop("invalid trials value")
  }
}

#' @title Binomial Distribution
#' @description Given the number of trials and probability, find the binomial distribution
#' @param trials, number of trials of the distribution
#' @param prob, probability of succes for the binomial distribution
#' @return A data frame with the probability distribution: successes in the first column, probability in the second column
#' @export
#' @examples
#' bin_distribution(5, 0.2)
#' bin_distribution(7, 0.5)
bin_distribution <- function(trials, prob){
  success_vec <- c(0:trials)
  prob_vec <- bin_probability(success_vec, trials, prob)
  df <- data.frame(success = success_vec, probability = prob_vec)
  class(df) <- c("bindis", "data.frame")
  return (df)
}

#' @export
plot.bindis <- function(x){
  barplot(height = x$probability, names.arg = x$success, border = NA, xlab = "success", ylab = "probability")
}

#' @title Binomial Cumulative Distribution
#' @description Given the number of trials and the probability of success, calculate the binomial cumulative distribution
#' @param trials, number of trails of the binomial distribution
#' @param prob, probability of success of the binomial distribution
#' @return A data frame with both the probability distribution and the cumulative probabilities: successes in the first column, probability in the second column, and cumulative in the thrid column
#' @export
#' @examples
#' bin_cumulative(9, 0.45)
#' bin_cumulative(12, 0.3)
bin_cumulative <- function(trials, prob){
  success_vec <- c(0:trials)
  prob_vec <- bin_probability(success_vec, trials, prob)
  cum_vec <- c()
  for (i in 1:length(prob_vec)){
    if (i == 1){
      cum_vec <- c(cum_vec, prob_vec[i])
    }
    else{
      cum_vec <- c(cum_vec, cum_vec[i - 1] + prob_vec[i])
    }
  }
  df <- data.frame(success = success_vec, probability = prob_vec, cumulative = cum_vec)
  class(df) <- c("bincum", "data.frame")
  return (df)
}

#' @export
plot.bincum <- function(x){
  plot(x$cumulative, xlab = "success", ylab = "probability")
  lines(x$cumulative)
}




