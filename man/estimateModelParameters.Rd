\name{estimateModelParameters}
\alias{estimateModelParameters}
\title{
Estimate the SCAMPI model paramteres alpha, beta, mu and tau from the data
}
\description{
Estimate the parameter values with maximum likelihood (\code{MLE}) or a method of moments approach (\code{LSE}), or both (\code{all})
}
\usage{
estimateModelParameters(method = "all", ccList, peptides = NULL, 
                        numIter = 10, verbose = FALSE)
}
\arguments{
  \item{method}{
    method to be used for the parameter estimation; can be \code{all} (MLE and LSE, default), \code{LSE} or \code{MLE}
}
  \item{ccList}{
    list of pre-processed connected components
}
  \item{peptides}{
    data frame with pre-processed peptide info (only used for LSE)
}
  \item{numIter}{
    number of successful munerical optimizations to perform (only used for MLE, see details)
}
  \item{verbose}{
    If \code{TRUE}, detailed output is provided.
}
}
\details{
  To use \code{method="MLE"} the inverses of the covariance matrices (of the connected components) are needed. Depending on the chosen parameters, this can lead to stability issues. To avoid the function from crashing, a \code{try(...)} bolck is used: the parameter estimation is performed until it was successful \code{numIter} times. Among these \code{numIter} sets, the one with the lowest negative log-likelihood value is returned.
}
\value{
  Named list of vectors with at least four named elements: \code{alphaH}, \code{betaH}, \code{muH} and \code{tauH} (estimates for the four model parameters). The name of the list elements corresponds to the parameter estimation method, namely \code{LSE} or \code{MLE}.
}
\author{
Sarah Gerster \email{sarah.gerster@isb-sib.ch}
}
\note{
  This function is called by one of the main functions of the package, \code{\link{runScampi}}. Calling this function directly is seldomly necessary.
}
\seealso{
\code{\link{runScampi}}, \code{\link{iterateScampi}}
}
\examples{
\dontrun{
data("leptoSRM")

dataChecked <- checkInputData(scampi(peptides=leptoSRMpeptides, 
                                     proteins=leptoSRMproteins, 
                                     edgespp=leptoSRMedgespp))
tmpPrepro <- preprocessInputData(dataChecked, rescaling=TRUE)
dataPrepro <- tmpPrepro[["dataPrepro"]]
ppGraph <- tmpPrepro[["ppGraph"]]
myCCList <- tmpPrepro[["ccList"]]
rm("tmpPrepro")
scampiParam <- estimateModelParameters(method="all", ccList=myCCList,
                                       peptides=dataPrepro@peptides,
                                       numIter=10)
}
}
\keyword{ parameter estimation }
