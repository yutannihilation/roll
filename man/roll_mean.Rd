% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/roll.R
\name{roll_mean}
\alias{roll_mean}
\title{Rolling Means}
\usage{
roll_mean(x, width, weights = rep(1, width), min_obs = width,
  complete_obs = FALSE, na_restore = FALSE, online = TRUE)
}
\arguments{
\item{x}{matrix or xts object. Rows are observations and columns are variables.}

\item{width}{integer. Window size.}

\item{weights}{vector. Weights for each observation within a window.}

\item{min_obs}{integer. Minimum number of observations required to have a value within a window,
otherwise result is \code{NA}.}

\item{complete_obs}{logical. If \code{TRUE} then rows containing any missing values are removed,
if \code{FALSE} then each value is used.}

\item{na_restore}{logical. Should missing values be restored?}

\item{online}{logical. Process observations using an online algorithm.}
}
\value{
An object of the same class and dimension as \code{x} with the rolling means.
}
\description{
A function for computing rolling means of time-series data.
}
\examples{
n_vars <- 3
n_obs <- 15
x <- matrix(rnorm(n_obs * n_vars), nrow = n_obs, ncol = n_vars)

# rolling means
result <- roll_mean(x, 5)

# rolling means with exponential decay
weights <- 0.9 ^ (5:1)
result <- roll_mean(x, 5, weights)
}
