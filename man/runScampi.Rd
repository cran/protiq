\name{runScampi}
\alias{runScampi}
\title{SCAMPI protein quantification function}

\description{
Estimate a protein abundance score for each protein in the dataset, based on the input peptide abundance scores and the connectivity information between peptides and proteins. Optionally, the peptide abundances can be estimated as well to compare the predicted values with the input measurements.
}
\usage{
runScampi(peptides, proteins, edgespp, rescaling = TRUE, method = "all", 
          quantifyPeptides = TRUE, numIter = 10, verbose = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{peptides}{
    Data frame with peptide information. The following columns are required: \code{pepId} (unique identification number for each distinct peptide sequence, numbering from 1:n where n=number of distinct peptide sequences), \code{pepSeq} (peptide sequence, optionally including modifications and charge states), and \code{pepQty} (peptide abundance score). An additional column \code{pepObs} (peptide observability or identification score) is used if provided. Each row in the data frame describes one observed distinct peptide sequence.
}
  \item{proteins}{
    Data frame with the protein information. The following columns are required: \code{protId} (unique identification number for each distinct protein sequence, numbering from (n+1):(n+m) where m=number of distinct protein sequences), \code{protName} (protein identifier or protein sequence). Each row describes a distinct protein sequence to which at least one of the observed peptides is matching.
}
  \item{edgespp}{
    Data frame with two mandatory columns: \code{pepId} and \code{protId}. Each row defines an edge of the bipartite graph.
}
  \item{rescaling}{
    If TRUE, the peptide abundance scores are logarithmized (log10). If this transformation 
    has not yet been done during preprocessing, it is strongly recommended to stick to the 
    default: \code{rescaling=TRUE}.
}
  \item{method}{
    Describes which method should be used for the parameter estimation. Available: \code{method="LSE"}, \code{method="MLE"} and \code{method="all"} (default). 
}
  \item{quantifyPeptides}{
    If \code{TRUE} (default) do also re-quantify the peptides and assess the peptide abundance scores.
}
  \item{numIter}{Only used with \code{method="MLE"}, see details. Default: \code{numIter=10}.
}
  \item{verbose}{
    If \code{TRUE}, detailed output is provided.
}
}

\details{
  To use \code{method="MLE"} the inverses of the covariance matrices (of the connected components) are needed. Depending on the chosen parameters, this can lead to stability issues. To avoid the function from crashing, a \code{try(...)} bolck is used: the parameter estimation is performed until it was successful \code{numIter} times. Among these \code{numIter} sets, the one with the lowest negative log-likelihood value is returned.
}

\value{An object of class \code{\linkS4class{scampiVal}} containing estimates for the model parameters, protein abundances and, optionally, for the peptide abundances/residuals.
}

\author{Sarah Gerster \email{sarah.gerster@isb-sib.ch}
}

\seealso{
Function \code{\link{iterateScampi}} tuns the model iteratively, by removing outlying peptides in each step.
}

\examples{
data("leptoSRM")
scampiOut <- runScampi(peptides=leptoSRMpeptides, 
                       proteins=leptoSRMproteins, 
                       edgespp=leptoSRMedgespp, 
                       rescaling=FALSE, method="LSE")
}

\keyword{ protein quantification }
\keyword{ peptide reassessment }
\keyword{ SCAMPI }
