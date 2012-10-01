\name{checkInputData.scampi}
\alias{checkInputData.scampi}
\title{
Check if input object fulfills all requirements in order to proceed with
the protein quantification step.
}
\description{
The dataframes contained in the input object are tested for completeness
and consistency. It ensures that the input data is suited to build the
bipartite graph and holds all needed variables for parameter estimation,
prediction of protein quantities and peptide abundance reassessment. If
some optional variables are missing, the dataframes are completed with
default values.
}
\usage{
\method{checkInputData}{scampi}(scampiData, rescaling = TRUE, verbose = FALSE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{scampiData}{object of class \code{\link{scampi-class}}}
  \item{rescaling}{
    If TRUE, the peptide abundance scores are logarithmized (log10). If this transformation 
    has not yet been done during preprocessing, it is strongly recommended to stick to the 
    default: \code{rescaling=TRUE}.
}
  \item{verbose}{if TRUE, basic information are printed to indicate the
    progress of the function}
  \item{\dots}{further arguments}
}
\value{Object of class \code{\link{scampi-class}} containing the checked,
  and possily completed, dataframes. If the input data does not match
  the requirements, the function exits with an error message.
}
\author{
  Sarah Gerster \email{sarah.gerster@isb-sib.ch}
}

\seealso{
  \code{\link{scampi-class}}
}
\examples{
data("leptoSRM")
dataChecked <- checkInputData(scampi(peptides=leptoSRMpeptides,
                                     proteins=leptoSRMproteins, 
                                     edgespp=leptoSRMedgespp),
                              rescaling=FALSE)
}
