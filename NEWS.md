spocc 0.6.0
===========

### NEW FEATURES

* Added a new data source: Atlas of Living Australia (ALA), under
the abbreviation `ala` (#98)
* Added a new data source: Ocean Biogeographic Information System (OBIS), 
under the abbreviation `obis` (#155)

### MINOR IMPROVEMENTS

* Added note to docs and minor tweak to internal methods to account
for max results from iDigBio of 100,000. Now when you request more than 
100K, you should get a warning saying as much (#169)

### BUG FIXES

* Made `occ2df()` more robust to varied inputs - allowing for users
that may on purpose or not have a subset of the data source slots
normally in the `occdat` class object (#171)


spocc 0.5.4
===========

### MINOR IMPROVEMENTS

* `rvertnet`, a dependency dealing with data from Vertnet, was failing 
on certain searches. `rvertnet` was fixed and a new version on CRAN now. 
No changes here other than requiring the new version of `rvertnet` (#168)
* Fix to internal INAT parsers to handle JSON data output instead of 
CSV output. And fix to internal date parsing; INAT changed field for date 
from `datetime` to `observed_on`.
* Move all `is()` to `inherits()`, and namespace all `setNames()` calls
* We are now using `rgbif::occ_data()` instead of `rgbif::occ_search()`
* We are now using `rvertnet::searchbyterm()` instead of 
`rgbif::vertsearch()`

### BUG FIXES

* Fixes to iDigBio internal plugin - we were dropping scientificname
if geometry was passed by the user. Fixed now. (#167)
* Fixed bug in GBIF internal plugin - when more than 1 result given back
(e.g., multiple searches were done, resulting in a list of objects)
we weren't parsing the output correctly. Fixed now. (#166)



spocc 0.5.0
===========

### NEW FEATURES

* `occ()` now allows queries that only pass `from` and one of the data
source opts params (e.g., `gbifopts`) - allows specifying any options
passed down to the internal functions used to do data queries without
having to use the other params in `occ` (#163)

### MINOR IMPROVEMENTS

* Now using `tibble` for representing data.frames (#164)
* Now using explicit `encoding="UTF-8"` in `httr::content()` calls 
to parse raw data from web requests (#160)
* Now using `ridigbio` as its on CRAN - was using 
internal fxns prior to this (#154)

### BUG FIXES

* There was a problem in the ebird parser where it wasn't processing 
results from ebird with no data. A problem with `has_coords` also 
fixed. (#161)


spocc 0.4.5
===========

### MINOR IMPROVEMENTS

* Using `data.table::setDF()` instead of `data.frame()` to set a `data.table` 
style table to a `data.frame`
* Added many more tests to make it less likely errors will occur
* Added `vertnet` as an option to `occ_options()` to get the options for passing
to `vertopts` in `occ()`

### BUG FIXES

* Fix to `print.occdatind()` - which in last version introduced a bug in this
print method - wasn't fatal as only applied to empty slots in the output 
of a call to `occ()`, but nonetheless, not good (#159)


spocc 0.4.4
===========

### MINOR IMPROVEMENTS

* New import `data.table` for fast list to data.frame

### BUG FIXES

* Fix to ecoengine spatial search - internally we were not making the 
bounding box correctly - fixed now (#158)


spocc 0.4.0
===========

### NEW FEATURES

* New function `as.vertnet()` to coerce various inputs (e.g., result from `occ()`, `occ2df()`, or a key itself) to occurrence data objects (#142)
* `occ()` gains two parameters `start` and `page` to facilitate paging 
through results across data sources, instead of having to page 
individually for each data source. Some sources use the `start` parameter, 
while others use the `page` parameter. See __Paging__ section in `?occ` for
details on Paging (#140)

### MINOR IMPROVEMENTS

* Added Code of Conduct

### BUG FIXES

* `wkt_vis()` now works with WKT polygons with multipe polygons, e.g., 
`spocc::wkt_vis("POLYGON((-125 38.4, -121.8 38.4, -121.8 40.9, -125 40.9, -125 38.4), (-115 22.4, -111.8 22.4, -111.8 30.9, -115 30.9, -115 22.4))")` (#147)
* Fix to `print.occdatind()` to print more helpful info when a 
geometry search is used as opposed to a taxonomy based search (#149)
* Fix to `print.occdatind()` to not fail when first element not present; 
proceeds to next slot with data (#143)
* Fixed problem where `occ()` failed when multiple `geometry` elements
passed in along with taxonomic names (#146)
* Fix to `occ2df()` for combining outputs to not fail when AntWeb 
doesn't give back dates (#144) (#145) - thanks @timcdlucas
* Fix to `occ2df()` to not fail when date field missing (#141)


spocc 0.3.2
===========

### NEW FEATURES

* Added iDigBio as a new data source in `spocc` (#136) (#124)

### MINOR IMPROVEMENTS

* Added much more detail on what parameters in child packages are being used inside of the `occ()` function. Each data source is taken care of in a separate package or set of wrapper functions, and the man file now details what API parameters are being queried (#138)

### BUG FIXES

* Fixed bug where when latitude/longitude columns missing, caused problems downstream in printing outputs, etc. Now we put in NA's when those columns missing (#139)
* Fixed bug in inat data source - `Datetime` variable changed to `datetime`
* Fixed bug in vertnet data source - `occurrenceID` variable changed to `occurrenceid`

spocc 0.3.0
===========

### NEW FEATURES

* Mapping functions all gone, and put into a new package `spoccutils` (https://github.com/ropensci/spoccutils) (#132)
* `occ()` gains new parameter `has_coords` - a global parameter (except for ebird and bison) to return only records with lat/long data. (#128)
* `type` (#134) and `rank` (#133) parameters dropped from `occ()` 
* When object returned by `occ()` is printed, we now include a message that total count of records found (not returned) is not completely known __if ebird is included__, because eBird does not include data on records found on their servers with requests to their API (#111)
* New functions `as.*()` (e.g., `as.gbif`) for most data sources. These functions take in occurrence keys or sets of keys, and retrieve detailed occurrence record data for each key (#112)
* New data source: VertNet (#110)
* `occ2df()` now returns more fields. This function collapses all essential fields that are easy to get in all data sources: `name`, `lat`, `long`, `prov`, `date`, `key`. The `key` field is the occurrence key for each record, which you can use to keep track of individual records, get more data on the record, etc. (#103) (#108)
* New function `inspect()` - takes output from `occ()` or individual occurrence keys and gets detailed occurrence data. 

### MINOR IMPROVEMENTS

* Now importing packages: `jsonlite`, `V8`, `utils`, and `methods`. No longer importing: `ggmap`, `maptools`, `rworldmap`, `sp`, `rgeos`, `RColorBrewer`, `rgdal`, and `leafletR`. Pkgs removed mostly due to splitting off some functionality into `spoccutils`. related issues: (#131) (#132)
* Now importing explicitly all non-base R functions that we use: now importing `methods`, `utils` (#120)
* We now attempt to standardize dates across all data sources, and return that in the output of a call to `occ2df()` (#106)
* `wkt_vis()` now only has an option to view a WKT shape in the browser.

### BUG FIXES

* Fixes to being able to pass curl options on to each data source's functions (#107)

spocc 0.2.4
===========

### MINOR IMPROVEMENTS

* Improved documentation for bounding boxes, their expected format, etc. (#96)
* Remove dependency on the following packages: `assertthat`, `plyr`, `data.table`, and `XML` (#102)
* Using package `gistr` now to post interactive geojson maps on GitHub gists (#100)
* `rgbif` now must be `v0.7.7` or greater (the latest version on CRAN).
* Removed the startup message.

### BUG FIXES

* Duplicate, but not working correctly, function `occ2sp()` removed. The function `occ_to_sp()` function is the working version. (#97)
* Fixed bug where some records returned form GBIF did not have lat/long column headers, and we internally rearranged columns, which caused complete stop when that happened. Fixed now. (#101)
* Changed all `\donttest` to `\dontrun` in examples as requested by CRAN maintainers (#99)

spocc 0.2.2
===========

### NEW FEATURES

* Added new function `occ_names()` to search only for taxonomic names. The goal here is to use ths function if there is some question about what names you want to use to search for occurrences with. (#84). Suggested by @jarioksa
* New function `occ_names_options()` to quickly get parameter options to pass to `occ_names()`.
* New `summary()` method for the `occdat` `S3` object that is output from `occ()` (#83)
* In many places in `spocc` (README, vignette, `occ()` documentation file, at package startup), we make it clear that there could be duplicate records returned in certain scenarios. And a new documentation page detailing what to watch out for: `?spocc_duplicates`. (#77)

### MINOR IMPROVEMENTS

* All latitude/longitude column headers are now changed to latitude and longitude, whereas they use to vary from `latitude`, `decimalLatitude`, `Latitude`, `lat`, and `decimal_latitude`. (#91)
* Default is 500 now for the `limit` parameter in `occ()` (#78)
* You can now pass in `limit` to each functions options parameter, and it will work. Each data source can have a different parameter internally from `limit`, but now internally within `spocc`, we allow you to use `limit` so you don't have to know what the data source specific parameter is. (#81)
* There is a now a startup message to give information on the package (#79)
* `occ_options()` gains new parameter `where` to print either in the console or to open man file in the IDE, or prints to console in command line R. 

spocc 0.2.0
===========

### NEW FEATURES

* `occ()` gains new parameter `callopts` to pass on curl debugging options to `httr::GET()` (#35)
* `wkt_vis()` now by default plots a well known text area (WKT) on an interactive mapbox map in your default browser. New parameter `which` allows you to choose the interactive map or a static ggplot2 map. (#70)
* Individual data sources `occ()` gains new class. In the previous version of this package, a `data.frame` was printed. Now the data is assigned the object `occdatind` (short for _occdat individual_).
* `occ()` now uses a print method for the `occdatind` class, adopted from `dplyr` that prints a brief `data.frame`, with columns wrapped to fit the width of your console, and additional columns not printed given at bottom with their class type. Note that the print behavior for the resulting object of an `occ()` call remains the same. (#69) (#74)

### MINOR IMPROVEMENTS

* Added `whisker` as a package import to use in the `wkt_vis()` function. (#70)
* Mapping functions now all accept the same input. Previously `mapggplot()` accepted the output of `occ()`, of class `occdat`, while the other two functions for mapping, `mapleaflet()` and `mapgist()` accepted a `data.frame`. Now all three functions accept  the output of `occ()`, an object of class `occdat`. (#75)
* The `meta` slot in each returned object (indexed by `object$meta`) contains spots for `returned` and `found`, to designate number of records returned, and number of records found. (#64)

### BUG FIXES

* Fixed bug in AntWeb output, where there was supposed to be a column titled `name`. (#71)

spocc 0.1.4
===========

### NEW FEATURES

* Can now do geometry only queries. See examples in `occ()`.
* In addition, you can pass in sp objects of SpatialPolygons or SpatialPolygonsDataFrame classes.

spocc 0.1.2
===========

### NEW FEATURES

* There were quite a few changes in one of the key packages that `spocc` depends on: `rgbif`. A number of input and output parameter names changed. A new version of `rgbif` was pushed to CRAN. (#56)
* New function `clean_spocc()` started (not finished yet) to attempt to clean data. For example, one use case is removing impossible lat/long values (i.e., longitue values greater than absolute 180). Another, not implemented yet, is to remove points that are not in the country or habitat your points are supposed to be in. (#44)
* New function `fixnames()` to trim species names with optional input parameters to make data easier to use for mapping.
* New function `wkt_vis()` to visualize a WKT (well-known text) area on a map. Uses `ggmap` to pull down a Google map so that the visualization has some geographic and natural earth context. We'll soon introduce an interactive version of this function that will bring up a small Shiny app to draw a WKT area, then return those coordinates to your R session. (#34)

### MINOR IMPROVEMENTS

* Added a CONTRIBUTING.md file to the github repo to help guide contributions (#61)
* Packages that require a certain version are forced to be X version or greater. Thes are rinat (>= 0.1.1), rbison (>= 0.3.2), rgbif (>= 0.6.2), ecoengine (>= 1.3), rebird (>= 0.1.1), AntWeb (>= 0.6.1), and leafletR (>= 0.2-0). This should help avoid problems.
* General improvement to function documentation.

spocc 0.1.0
===========

* Initial release to CRAN
