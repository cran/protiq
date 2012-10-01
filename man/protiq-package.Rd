\name{protiq-package}
\alias{protiq-package}
\alias{protiq}
\docType{package}
\title{
Protein (identification and) quantification based on peptide evidence
}
\description{
Method for protein quantification based on identified and quantified peptides. \code{protiq} can be used for absolute and relative protein quantification. Input peptide abundance scores can come from various sources, including SRM transition areas and intentisites or spectral counts derived from shotgun experiments. The package is being extended to also include the model for protein identification, MIPGEM, presented in Gerster et al., see references.
}
\details{
\tabular{ll}{
Package: \tab protiq\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2012-09-30\cr
License: \tab GPL (>= 2)\cr
Depends: \tab methods\cr
Imports: \tab graph, RBGL, mvtnorm\cr
}
}
\author{
Sarah Gerster (maintainer) \email{sarah.gerster@isb-sib.ch}
Peter Buehlmann
}
\references{
Gerster, S., Qeli, E., Ahrens, C.H. and Buehlmann, P. (2010). Protein and gene model inference based on statistical modeling in k-partite graphs. \emph{Proceedings of the National Academy of Sciences} 107(27):12101-12106.
}
\keyword{ package }
\seealso{
Main functions: \code{\link{runScampi}}, \code{\link{iterateScampi}}
}
