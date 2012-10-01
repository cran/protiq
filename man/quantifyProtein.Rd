\name{quantifyProtein}
\alias{quantifyProtein}
\title{
Compute expected value and variance of a protein abundance.
}
\description{
Use provided model parameter values to compute the expected value and variance of the abundance for a given protein.
}
\usage{
quantifyProtein(protInfo, ccList, param, verbose = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{protInfo}{
    Vector with two elements: \code{protId} and index of connected component (in list \code{ccList}) which contains \code{protId}.
}
  \item{ccList}{
    List of pre-processed connected components.
}
  \item{param}{
   Vector with at least four named elements: \code{alphaH}, \code{betaH}, \code{muH} and \code{tauH} (estimates for the four model parameters).

}
  \item{verbose}{
    If \code{TRUE}, detailed output is provided.
}
}

\value{
  Vector with two values: expected value and variance of the protein abundance.}

\author{
Sarah Gerster \email{sarah.gerster@isb-sib.ch}
}

\note{
This function is intended to quantify a single protein when the parameter values have been computed previously. To run a whole analysis (check input data, preprocess connected components, estimate model parameters and compute abundance sore estimates) you should use the function \code{\link{runScampi}} or \code{\link{iterateScampi}}.
}

\seealso{
\code{\link{runScampi}}, \code{\link{iterateScampi}}
}
\examples{
## get data
data("leptoSRM")
## check input data
dataChecked <- checkInputData(scampiData=new("scampi", 
                                             peptides=leptoSRMpeptides, 
                                             proteins=leptoSRMproteins,
                                             edgespp=leptoSRMedgespp))
## preprocess input data
tmpPrepro <- preprocessInputData(scampiData=dataChecked, rescaling=FALSE) 
dataPrepro <- tmpPrepro[["dataPrepro"]]
myCCList <- tmpPrepro[["ccList"]]
rm(tmpPrepro)

## compute covariance matrices
myCCList <- lapply(myCCList, getCovU,
                   beta=0.2,
                   tau=0.5)

## compute expected value and variance of abundance for protein 7
protAbundanceScore <- 
  quantifyProtein(protInfo=dataPrepro@proteins[7, c("protId", "ccInd")], 
                  ccList=myCCList, param=c(alphaH=0, betaH=0.2, muH=0.3, 
                  tauH=0.2))[1]
protAbundanceVariance <- 
  quantifyProtein(protInfo=dataPrepro@proteins[7, c("protId", "ccInd")], 
                  ccList=myCCList, param=c(alphaH=0, betaH=0.2, muH=0.3, 
                  tauH=0.2))[2]
}

\keyword{ protein quantification }
