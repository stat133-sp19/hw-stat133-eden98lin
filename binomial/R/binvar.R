#' @title Binomial Variable
#' @description This funciton creates a binomial variable object
#' @param trials, number of trials of the binomial distribution
#' @param prob, probability of success of the binomial distribution
#' @return An object of class "binvar"
#' @export
#' @examples
#' bin_variable(6, 0.5)
#' bin_variable(20, 0.5)
bin_variable <- function(trials, prob){
  if(check_trials(trials) & check_prob(prob)){
    x <- list(trials = trials, prob = prob)
    class(x) <- "binvar"
    return (x)
  }
  else{
    stop("invalid entry of trials, prob")
  }
}


#' @export
print.binvar <- function(x){
  cat('"Binomial variable"\n')
  cat("\n")
  cat("- number of trials:", x$trials, "\n")
  cat("- prob of success:", x$prob)
}

#' @export
summary.binvar <- function(x){
  trials = x$trials
  prob = x$prob
  mean <- aux_mean(trials, prob)
  variance <- aux_variance(trials, prob)
  mode <- aux_mode(trials, prob)
  skewness <- aux_skewness(trials, prob)
  kurtosis <- aux_kurtosis(trials, prob)

  x <- list(trials = trials,
                        prob = prob,
                        mean = mean,
                        variance = variance,
                        mode = mode,
                        skewness = skewness,
                        kurtosis = kurtosis)

  class(x) <- "summary.binvar"
  return (x)
}

#' @export
print.summary.binvar <- function(x){
  cat('"Summary Binomial"\n')
  cat("\n")
  cat("Paramaters \n")
  cat("- number of trials:", x$trials, "\n")
  cat("- prob of success:", x$prob, "\n")
  cat("\n")
  cat("Measures \n")
  cat("- mean    :", x$mean, "\n")
  cat("- variance:", x$variance, "\n")
  cat("- mode    :", x$mode, "\n")
  cat("- skewness:", x$skewness, "\n")
  cat("- kurtosis:", x$kurtosis)
}


# private auxiliary functions to calculate the measures of the binomial distribution
# aux_mean() returns the mean of binomial random variable given the trials and probability
aux_mean <- function(trials, prob){
  return (trials * prob)
}

# aux_variance() returns the variance of binomial random variable given the trials and probability
aux_variance <- function(trials, prob){
  return (trials * prob * (1 - prob))
}

# aux_mode() returns the mode of binomial random variable given the trials and probability
aux_mode <- function(trials, prob){
  return (floor(trials * prob + prob))
}

# aux_skewness() returns the skewness of binomial random variable given the trials and probability
aux_skewness <- function(trials, prob){
  return ((1 - 2 * prob)/(sqrt(trials * prob * (1 - prob))))
}

# aux_kurtosis() returns Kurtosis (i.e. the "tailedness") of binomial random variable given the trails and probability
aux_kurtosis <- function(trials, prob){
  return ((1 - 6 * prob * (1 - prob))/(trials * prob * (1 - prob)))
}


#' @title Binomial Mean
#' @description Calculate the mean for a binomial distribution
#' @param trials, number of trials of the binomial distribution
#' @param prob, probability of succes of the binomial distriburion
#' @return The binomial mean of given number of trials and probability of success
#' @export
#' @examples
#' bin_mean(12, 0.7)
#' bin_mean(5, 0.23)
bin_mean <- function(trials, prob){
  if (check_trials(trials) & check_prob(prob)){
    return (aux_mean(trials, prob))
  }
}

#' @title Binomial Variance
#' @description Calculate the variance for a binomial distribution
#' @param trials, number of trials of the binomial distribution
#' @param prob, probability of succes of the binomial distriburion
#' @return The binomial variance of given number of trials and probability of success
#' @export
#' @examples
#' bin_variance(12, 0.7)
#' bin_variance(5, 0.23)
bin_variance <- function(trials, prob){
  if (check_trials(trials) & check_prob(prob)){
    return (aux_variance(trials, prob))
  }
}

#' @title Binomial Mode
#' @description Calculate the mode for a binomial distribution
#' @param trials, number of trials of the binomial distribution
#' @param prob, probability of succes of the binomial distriburion
#' @return The binomial mode of given number of trials and probability of success
#' @export
#' @examples
#' bin_mode(12, 0.7)
#' bin_mode(5, 0.23)
bin_mode <- function(trials, prob){
  if (check_trials(trials) & check_prob(prob)){
    return (aux_mode(trials, prob))
  }
}

#' @title Binomial Skewness
#' @description Calculate the skewness for a binomial distribution
#' @param trials, number of trials of the binomial distribution
#' @param prob, probability of succes of the binomial distriburion
#' @return The binomial skewness of given number of trials and probability of success
#' @export
#' @examples
#' bin_skewness(12, 0.7)
#' bin_skewness(5, 0.23)
bin_skewness <- function(trials, prob){
  if (check_trials(trials) & check_prob(prob)){
    return (aux_skewness(trials, prob))
  }
}

#' @title Binomial Kurtosis
#' @description Calculate the kurtosis for a binomial distribution
#' @param trials, number of trials of the binomial distribution
#' @param prob, probability of succes of the binomial distriburion
#' @return The binomial kurtosis of given number of trials and probability of success
#' @export
#' @examples
#' bin_kurtosis(12, 0.7)
#' bin_kurtosis(5, 0.23)
bin_kurtosis <- function(trials, prob){
  if (check_trials(trials) & check_prob(prob)){
    return (aux_kurtosis(trials, prob))
  }
}
