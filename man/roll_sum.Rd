% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/roll.R
\name{roll_sum}
\alias{roll_sum}
\title{Rolling Sums}
\usage{
roll_sum(data, width, weights = rep(1, width), min_obs = width,
  complete_obs = FALSE, na_restore = FALSE, parallel_for = c("rows",
  "cols"))
}
\arguments{
\item{data}{matrix or xts object. Rows are observations and columns are variables.}

\item{width}{integer. Window size.}

\item{weights}{vector. Weights for each observation within a window.}

\item{min_obs}{integer. Minimum number of observations required to have a value within a window,
otherwise result is \code{NA}.}

\item{complete_obs}{logical. If \code{TRUE} then rows containing any missing values are removed,
if \code{FALSE} then each value is used.}

\item{na_restore}{logical. Should missing values be restored?}

\item{parallel_for}{character. Executes a "for" loop in which iterations run in parallel by
\code{rows} or \code{cols}.}
}
\value{
An object of the same class and dimension as \code{data} with the rolling sums.
}
\description{
A parallel function for computing rolling sums of time-series data.
}
\details{
The numerical calculations use RcppParallel to parallelize rolling sums of time-series data. 
RcppParallel provides a complete toolkit for creating safe, portable, high-performance parallel 
algorithms, built on top of the Intel Threading Building Blocks (TBB) and TinyThread libraries.

By default, all the available cores on a machine are used for parallel algorithms. If users are 
either already taking advantage of parallelism or instead want to use a fixed number or proportion of 
threads, then set the number of threads in the RcppParallel package with the 
\code{\link[RcppParallel]{setThreadOptions}} function.
}
\examples{
n_vars <- 10
n_obs <- 1000
data <- matrix(rnorm(n_obs * n_vars), nrow = n_obs, ncol = n_vars)

# Rolling sums
result <- roll_sum(data, 252)

# Rolling sums with exponential decay
weights <- 0.9 ^ (251:0)
result <- roll_sum(data, 252, weights)
}