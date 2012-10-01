\name{quantifyProteins}
\alias{quantifyProteins}

\title{
Compute the protein (and optionally the peptide) abundance scores.
}

\description{
Compute the protein (and optionally the peptide) abundance scores for all proteins given the specified parameter values
}

\usage{
quantifyProteins(scampiData, ccList, paramList, quantifyPeptides = FALSE, 
                 verbose = FALSE)
}

\arguments{
  \item{scampiData}{
    Object of class \code{\linkS4class{scampi}}
}
  \item{ccList}{
    List of pre-processed connected components
}
  \item{paramList}{
    Named list of vectors with at least four named elements: \code{alphaH}, \code{betaH}, \code{muH} and \code{tauH} (estimates for the four model parameters). The name of list element corresponds to the parameter estimation method, namely \code{LSE} or \code{MLE}.
}
  \item{quantifyPeptides}{
    If TRUE, also compute peptide abundance scores/residuals.
}
  \item{verbose}{
    If \code{TRUE}, detailed output is provided.
}
}

\value{
Object of class \code{\linkS4class{scampi}}.
}

\author{
Sarah Gerster \email{sarah.gerster@isb-sib.ch}
}

\note{
This function is intended to quantify (a subset of) proteins and reassess peptide scores when the parameter values have already been computed previously. To run a whole analysis (check input data, preprocess connected components, estimate model parameters and compute abundance sore estimates) you should use the function \code{\link{runScampi}} or \code{\link{iterateScampi}}.
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

## compute protein and peptide abundance scores
scampiRes <- 
  quantifyProteins(scampiData=dataPrepro, ccList=myCCList, 
                   paramList=list(LSE=c(alphaH=0, betaH=0.2, muH=0.3, 
                                        tauH=0.2)),
                   quantifyPeptides=FALSE)
}

\keyword{ protein quantification }
\keyword{ peptide reassessment }
