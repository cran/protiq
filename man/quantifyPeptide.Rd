\name{quantifyPeptide}
\alias{quantifyPeptide}

\title{
Compute expected value for the peptide abundance.
}

\description{
  Use provided model parameter values to compute the expected value of the abundance for a given petpitde. This value can the be compared to the originally measure value to identify outliers in the input data.
}

\usage{
quantifyPeptide(pepInfo, ccList, param, verbose = FALSE)
}
\arguments{
  \item{pepInfo}{
    Vector with two elements: \code{pepId} and index of connected component (in list \code{ccList}) which contains \code{pepId}.
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
\details{
In order to avoid overfitting, the value computed by this function E[U_k|U_{{i}-k}], hence the kth measurement is not used to predict the expected value of peptide k. 
}

\value{
  Expected value of the peptide abundance (see details).
}

\author{
Sarah Gerster \email{sarah.gerster@isb-sib.ch}
}

\note{
This function is intended to assess a single peptide when the parameter values have been computed previously. To run a whole analysis (check input data, preprocess connected components, estimate model parameters and compute abundance sore estimates) you should use the function \code{\link{runScampi}} or \code{\link{iterateScampi}}.
}

\seealso{
\code{\link{runScampi}}, \code{\link{iterateScampi}}
}

\examples{
## get data
data("leptoSRM")
## check input data
dataChecked <- checkInputData(scampiData=scampi(peptides=leptoSRMpeptides, 
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

## compute expected value of abundance for peptide 13
pepAbundanceScore <- 
  quantifyPeptide(pepInfo=dataPrepro@peptides[13, c("pepId", "ccInd")], 
                  ccList=myCCList, param=c(alphaH=0, betaH=0.2, muH=0.3, 
                  tauH=0.2))
}

\keyword{ peptide score reassessment }
