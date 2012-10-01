\name{iterateScampi}
\alias{iterateScampi}
\title{SCAMPI protein quantification function with iterative outlier removal
}
\description{
Estimate a protein abundance score for each protein in the dataset, based on the input peptide abundance scores and the connectivity information between peptides and proteins. The expected values for the peptide abundances are computed as well. Comparing these values with the initial measurements allows to detect outliers in the input data. Several iterations of abundance estimation and outlier removal can then be performed.
}
\usage{
iterateScampi(peptides, proteins, edgespp, rescaling = TRUE, 
              method = "LSE", numIter = 2, numMLEIter = 10, 
              thresh = 2, verbose = FALSE)
}
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
    Describes which method should be used for the parameter estimation. Available: \code{method="LSE"} (default), \code{method="MLE"} and \code{method="all"}.
}
  \item{numIter}{
    Number of estimation/outlier-removal iterations to be performed. 
}
  \item{numMLEIter}{
    Only used with \code{method="MLE"}, see details. Default: \code{numIter=10}.
}
  \item{thresh}{
    Constant to tune the outlier selection process. See details.
}
  \item{verbose}{
    If \code{TRUE}, detailed output is provided.
}
}
\details{
  To use \code{method="MLE"} the inverses of the covariance matrices (of the connected components) are needed. Depending on the chosen parameters, this can lead to stability issues. To avoid the function from crashing, a \code{try(...)} bolck is used: the parameter estimation is performed until it was successful \code{numIter} times. Among these \code{numIter} sets, the one with the lowest negative log-likelihood value is returned.

  Peptide outlier detection is based on an interquartile range criterion on the peptide abundance residuals. The larger the chosen \code{thresh}, the less peptides get discarded.
}
\value{
  Named list. Each element corresponds to one iteration step, and is a list itself with
  \item{scampiRes }{object of class \code{\linkS4class{scampiVal}}}
  \item{peptideOutliers }{dataframe with the peptides selected as outliers and not used (removed from the graph) for this iteration step}
}
\author{
Sarah Gerster \email{sarah.gerster@isb-sib.ch}
}
\seealso{
\code{\link{runScampi}} to perform a single iteration
}
\examples{
data("leptoSRM")
scampiIterRes <- iterateScampi(peptides=leptoSRMpeptides, 
                               proteins=leptoSRMproteins, 
                               edgespp=leptoSRMedgespp, rescaling=FALSE,
                               method="LSE", numIter=3, thresh=1.37)
}
\keyword{ protein quantification }
\keyword{ peptide reassessment }
\keyword{ SCAMPI }
