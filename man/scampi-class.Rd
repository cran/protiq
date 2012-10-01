\name{scampi-class}
\docType{class}
\alias{scampi-class}
\alias{scampi}
\alias{plot,scampi,missing-method}
\alias{show,scampi-method}
\alias{summary,scampi-method}

\title{Class \code{"scampi"}}

\description{This class of objects is used to group the input data for various functions in the \code{protiq} package. It is not needed to run the main functions such as \code{\link{runScampi}} and \code{\link{iterateScampi}} (which return objects of the class \code{\linkS4class{scampiVal}}). However, it is needed to run "under-functions" such as \code{\link{quantifyProteins}}.
Objects of this class have methods for the functions summary, show and plot.
}

\section{Creation of objects}{
Objects are created e.g. by \code{new("scampi", peptides, proteins, edgespp)}.
}

\section{Slots}{
  \describe{
    \item{\code{peptides}:}{Object of class \code{"data.frame"}:
      dataframe summarizing information about the peptides (input data
      as well as (optionally) reassessed abundances).}
    \item{\code{proteins}:}{Object of class \code{"data.frame"}:
      dataframe summarizing information about the proteins (input data
      as well as estimated protein abundances).}
    \item{\code{edgespp}:}{Object of class \code{"data.frame"}:
      dataframe summarizing the information about the edges of
      \code{ppGraph}, connecting the \code{peptides} to the \code{proteins}.}
  }
}

\section{Methods}{
  \describe{
    \item{plot}{\code{signature(x = "scampi", y = "missing")}: Plot the
      distribution of the measured peptide abundances (histogram).}
    \item{show}{\code{signature(object = "scampi")}: Display basic
      properties of the fitted object.}
    \item{summary}{\code{signature(object = "scampi")}: Display details
      of the fitted object.}
  }	
}

\author{Sarah Gerster \email{sarah.gerster@isb-sib.ch}}

\examples{
showClass("scampi")

## generate a scampi object
data("leptoSRM")
scampiData <- scampi(peptides=leptoSRMpeptides, 
                     proteins=leptoSRMproteins, 
                     edgespp=leptoSRMedgespp)

## use methods of class scampiVal
show(scampiData)
summary(scampiData)
plot(scampiData)
}

\keyword{classes}
