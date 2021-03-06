% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/iNZightTS.R
\name{iNZightTS}
\alias{iNZightTS}
\alias{iNZightMTS}
\title{iNZightTS (Time-Series) Objects}
\usage{
iNZightTS(
  data,
  start = 1,
  end,
  freq = 1,
  var = 2,
  time.col = grep("time", names(data), ignore.case = TRUE)[1],
  ...
)
}
\arguments{
\item{data}{a \code{data.frame} containing time information and
observation or a path to a \code{.csv} file with
such information or a \code{ts} object}

\item{start}{the time of the first observation.
Either a single number or a vector
of two integers, which specify a natural time unit
and a (1-based) number of samples into the time unit}

\item{end}{the time of the last observation, specified in the
same way as \code{start}}

\item{freq}{the number of observations per unit of time}

\item{var}{the column number or name for the observations used
from \code{data} in the actual time series}

\item{time.col}{which column contains the time variable}

\item{...}{additional information passed to \code{read.csv()} and used when
\code{data} is a path}

\item{ignore.case}{logical, ignore the case?}
}
\value{
a \code{iNZightTS} object. If multiple variables are requested,
        the \code{iNZightMTS} class is added to the result. The result
        object contains the original data as a time series object,
        as well as information on the series start, end, and frequency.
}
\description{
The function \code{iNZightTS} is used to create time-series objects used
in iNZight.
}
\details{
The function \code{iNZgithTS} is used to create time-series
objects. Unlike \code{ts} objects, these are lists containing
information about the time-series as well as the data and the
time-series (\code{ts} object) itself.

If a \code{ts} object is used to create the \code{iNZightTS} object,
all the domain information is extracted from that object.

The function recognises the following time variable formatS without case sensitive:
 \itemize{
  \item "(Y)yyyy" annually data e.g."(Y)1991"
  \item "(Y)yyyyMmm" monthly data e.g."(Y)1991M01"
  \item "(Y)yyyyQqq" quarterly data e.g."(Y)1991Q01"
  \item "(Y)yyyyWww" weekly data with yearly seasonality e.g."(Y)1991W01"
  \item "(Y)yyyyDdd" daily data with yearly seasonality e.g."(Y)1991D01"
  \item "WwwDdd"  daily data with weekly seasonality e.g. "W01D01"
  \item "DddHhh" hourly data with daily seasonality e.g. "D01H01"
}
The length of digits of each time unit could be flexible and allowing space between the
time unit

In case of \code{data} being a data.frame or path to a \code{.csv}
file and \code{start} being omitted, the starting date and the
\code{freq} is extracted from the column that includes the time
information. This column is either named \code{"Time"} or is the first
column. If \code{end} is omitted, all of the data will be used for the
time-series.
}
\examples{
# create from a ts object
z <- iNZightTS(UKgas)
plot(z)

# create from a data.frame
x <- iNZightTS(data.frame(Return = rnorm(100), Time = 1900:1999),
    var = "Return")
# or specify a time column
x <- iNZightTS(data.frame(Return = rnorm(100), Year = 1900:1999),
    var = "Return", time.col = "Year")

# create from a data.frame with modified time frame
y <- iNZightTS(data.frame(Return = rnorm(100)),
    start = c(1990, 1), end = c(1993, 5), freq = 12, var = 1)
plot(y)

}
\seealso{
\code{\link{ts}}, \code{\link{print.iNZightTS}},
}
