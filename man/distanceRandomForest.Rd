% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/distance.R
\name{distanceRandomForest}
\alias{distanceRandomForest}
\title{Distance calculation based on RandomForest Proximity or Depth}
\usage{
distanceRandomForest(x, y = NULL, rfObject, method = "Proximity",
  threads = NULL)
}
\arguments{
\item{x}{a data.frame}

\item{y}{a second data.frame}

\item{rfObject}{\code{ranger} object}

\item{method}{distance calculation method}
}
\value{
a \code{dist} or a matrix object with pairwise distance of 
observations in x vs y (if not null)
}
\description{
Distance calculation based on RandomForest Proximity or Depth
}
\examples{
\dontrun{
library(ranger)
# get proximity pairwise distances
rf.fit <- ranger(Species ~ ., data = iris, num.trees = 5, write.forest = TRUE)
distanceRandomForest(x = iris[, -5], rfObject = rf.fit, method = "Proximity")

# depth distance for train versus test subset
set.seed(1234L)
learn <- sample(1:150, 100)
test <- (1:150)[-learn]
rf <- ranger(Species ~ ., data = iris[learn, ], num.trees = 5, write.forest = TRUE)
distanceRandomForest(x = iris[learn, -5], y = iris[test, -5], rfObject = rf.fit, method = "Depth")
}

}