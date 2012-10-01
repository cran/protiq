\name{preprocessInputData}
\alias{preprocessInputData}
\title{
Generic function to preprocess the input data for protein inference with MIPGEM or quantification with SCAMPI to speed up further computations.
}
\description{
Quantities which do not depend on the parameter values are precomputed and stored to be accessed quickly in further computations.
}
\usage{
preprocessInputData(scampiData, ...)
}
\arguments{
  \item{scampiData}{object of class \code{scampi} or \code{mipgem}}
  \item{\dots}{further arguments to be passed to the methods}
}
\details{
  Currently only the functions for quantification, related to objects of the class
  \code{\linkS4class{scampi}}, are available.
}
\author{
Sarah Gerster \email{sarah.gerster@isb-sib.ch}
}
\seealso{
  \code{\link{preprocessInputData.scampi}} for details about the preprocessing
    performed on \code{\linkS4class{scampi}} objects
}
\examples{
data("leptoSRM")
dataChecked <- checkInputData(scampi(peptides=leptoSRMpeptides, 
                                     proteins=leptoSRMproteins, 
                                     edgespp=leptoSRMedgespp))
dataPrepro <- preprocessInputData(dataChecked, rescaling=FALSE)
}
\keyword{ preprocessing }
