% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/occ_names_options.R
\name{occ_names_options}
\alias{occ_names_options}
\title{Look up options for parameters passed to each source for occ_names function}
\usage{
occ_names_options(from = "gbif", where = "console")
}
\arguments{
\item{from}{(character) Data source to get data from, any combination of gbif, bison,
and/or ecoengine. Case doesn't matter.}

\item{where}{(character) One of console (print to console) or html (opens help page, if in
non-interactive R session, prints help to console).}
}
\value{
Opens up the documentation for the function that is used internally within
the occ function for each source.
}
\description{
Look up options for parameters passed to each source for occ_names function
}
\details{
Any of the parameters passed to e.g. \code{\link[rgbif]{name_lookup}} from the
\code{rgbif} package can be passed in the associated gbifopts list in \code{\link[spocc]{occ}}.

Note that the from parameter is lowercased within the function and is called through
\code{match.arg} first, so you can match on unique partial strings too (e.g., 'e' for
'ecoengine').
}
\examples{
\dontrun{
# opens up documentation for this function
occ_names_options()

# Open up documentation for the appropriate search function for each source
occ_names_options('gbif')
occ_names_options('ecoengine')
occ_names_options('bison')

# Or open in html version
occ_names_options('bison', 'html')
}
}

