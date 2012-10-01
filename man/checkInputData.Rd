\name{checkInputData}
\alias{checkInputData}
\title{
Generic function to check if the input data fulfills all requirements
for protein inference with MIPGEM or quantification with SCAMPI.
}
\description{
The dataframes are checked for completeness: are all needed input
variables provided? Furthermore, the numbering of the dataframes is
checked and inconsistencies are reported. 
}
\usage{
checkInputData(scampiData, ...)
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
  \code{\link{checkInputData.scampi}} for details about the checks
  performed on \code{\linkS4class{scampi}} objects
}
\examples{
data("leptoSRM")
dataChecked <- checkInputData(scampi(peptides=leptoSRMpeptides,
                                     proteins=leptoSRMproteins, 
                                     edgespp=leptoSRMedgespp),
                              rescaling=FALSE)
}
