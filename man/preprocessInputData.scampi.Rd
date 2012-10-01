\name{preprocessInputData.scampi}
\alias{preprocessInputData.scampi}
\title{
Precompute all quantities which will be used (repetitously) for further computations and do not depend on the parameter values.

}
\description{
Build the bipartite graph, generate the list of connected components, store information about the graph structure for each nodes (e.g. number of neighbors or index of the connected components), optionally transform peptide abundance score.
}
\usage{
\method{preprocessInputData}{scampi}(scampiData, verbose = FALSE, ...)
}
\arguments{
  \item{scampiData}{
  Object of class \code{\linkS4class{scampi}}
}
  \item{verbose}{
    If \code{TRUE}, detailed output is provided.
}
  \item{\dots}{further arguments}
}
\value{
  List
  \item{dataPrepro }{object of class \code{\linkS4class{scampi}}}
  \item{ppGraph }{object of class \code{graphNEL}}
  \item{ccList }{list of connected components of \code{ppGraph}}
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
data("leptoSRM")
dataChecked <- checkInputData(scampi(peptides=leptoSRMpeptides, 
                                     proteins=leptoSRMproteins, 
                                     edgespp=leptoSRMedgespp),
                              rescaling=FALSE)
dataPrepro <- preprocessInputData(dataChecked)
}
\keyword{ preprocessing }
