\name{leptoSRM}
\alias{leptoSRM}
\docType{data}
\title{SRM quantification example data}
\description{
  This dataset holds peptide SRM measurements matching to 39 proteins. The data is summarized in three data frames.}
\usage{data(leptoSRM)}
\format{Three data frames (\code{leptoSRMpeptides}, \code{leptoSRMproteins} and \code{leptoSRMedgespp}) containing the required input data for SCAMPI.
  \describe{
  \item{leptoSRMpeptides:}{data frame with 151 distinct peptides (=151 rows)}
  \item{leptoSRMproteins:}{data frame with 39 distinct protein sequences (=39 rows)}
  \item{leptoSRMedgespp:}{data frame with 151 edges (=151 rows) between peptides and proteins}
  }
}
\source{Ludwig et al., see references}
\references{
Ludwig et al. Estimation of absolute protein quantities of unlabeled samples by selected reaction monitoring mass spectrometry (2011) \emph{Molecular & Cellular Proteomics}
}
\keyword{datasets}
