\name{getCovU}
\alias{getCovU}
\title{
Compute covariance matrix of peptide abundances
}
\description{
Compute the covariance matrix of the peptide abundances in the same connected component for given parameter values (\code{beta} and \code{tau}).
}
\usage{
getCovU(cc, beta, tau)
}
\arguments{
  \item{cc}{pre-processed connected component (list)
}
  \item{beta}{model parameter ("weight" of protein abundance contribution)
}
  \item{tau}{model parameter (variance of error term)
}
}
\value{
  Same list as \code{cc} with an additional element named \code{covU}
}
\author{
Sarah Gerster \email{sarah.gerster@isb-sib.ch}
}
\note{
  This function is called by higher level functions (\code{\link{quantifyProteins}}). Calling it directly is seldomly necessary.
}
\seealso{
\code{\link{quantifyProteins}}
}
\examples{
## get data
data("leptoSRM")
## check input data
dataChecked <- 
  checkInputData(scampiData=new("scampi", peptides=leptoSRMpeptides, 
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

}
\keyword{ parameter estimation }
