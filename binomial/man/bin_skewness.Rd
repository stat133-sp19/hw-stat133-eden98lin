% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/binvar.R
\name{bin_skewness}
\alias{bin_skewness}
\title{Binomial Skewness}
\usage{
bin_skewness(trials, prob)
}
\arguments{
\item{trials, }{number of trials of the binomial distribution}

\item{prob, }{probability of succes of the binomial distriburion}
}
\value{
The binomial skewness of given number of trials and probability of success
}
\description{
Calculate the skewness for a binomial distribution
}
\examples{
bin_skewness(12, 0.7)
bin_skewness(5, 0.23)
}
