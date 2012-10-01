## class for input data, mostly used internally
scampi <- setClass("scampi",
                   representation(peptides = "data.frame",
                                  proteins = "data.frame",
                                  edgespp = "data.frame"))

## class for returning results (quantified proteins/peptides)
scampiVal <- setClass("scampiVal",
                      representation(call = "call",
                                     parameters = "list",
                                     ppGraph = "graphNEL",
                                     ccList = "list"),
                      contains = c("scampi"))
