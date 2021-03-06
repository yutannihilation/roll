% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/roll.R
\name{roll_cov}
\alias{roll_cov}
\title{Rolling Covariance Matrices}
\usage{
roll_cov(x, y = NULL, width, weights = rep(1, width), center = TRUE,
  scale = FALSE, min_obs = width, complete_obs = TRUE,
  na_restore = FALSE, online = TRUE)
}
\arguments{
\item{x}{matrix or xts object. Rows are observations and columns are variables.}

\item{y}{matrix or xts object. Rows are observations and columns are variables.}

\item{width}{integer. Window size.}

\item{weights}{vector. Weights for each observation within a window.}

\item{center}{logical. If \code{TRUE} then the weighted mean of each variable is used,
if \code{FALSE} then zero is used.}

\item{scale}{logical. If \code{TRUE} then the weighted standard deviation of each variable is used,
if \code{FALSE} then no scaling is done.}

\item{min_obs}{integer. Minimum number of observations required to have a value within a window,
otherwise result is \code{NA}.}

\item{complete_obs}{logical. If \code{TRUE} then rows containing any missing values are removed,
if \code{FALSE} then pairwise is used.}

\item{na_restore}{logical. Should missing values be restored?}

\item{online}{logical. Process observations using an online algorithm.}
}
\value{
A cube with each slice the rolling covariance matrix.
}
\description{
A function for computing rolling covariance matrices of time-series data.
}
\details{
The denominator used gives an unbiased estimate of the covariance, so if the weights are the 
default then the divisor \code{n - 1} is obtained.
}
\examples{
n_vars <- 3
n_obs <- 15
x <- matrix(rnorm(n_obs * n_vars), nrow = n_obs, ncol = n_vars)

# rolling covariance matrices
result <- roll_cov(x, width = 5)

# rolling covariance matrices with exponential decay
weights <- 0.9 ^ (5:1)
result <- roll_cov(x, width = 5, weights = weights)
}
