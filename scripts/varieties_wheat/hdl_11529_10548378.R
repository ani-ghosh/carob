# R script for "carob"


carob_script <- function(path) {
  
"International Durum Screening Nursery (IDSN) distributes diverse CIMMYT-bred spring durum wheat germplasm adapted to irrigated and variable moisture stressed environments. Disease resistance and high industrial pasta quality are essential traits possessed in this germplasm. It is distributed to 100 locations, and contains 150 entries. (2018)"

  uri <- "hdl:11529/10548378"
  group <- "varieties_wheat"
  ff <- carobiner::get_data(uri, path, group)
  
  meta <- carobiner::get_metadata(uri, path, group, major=3, minor=0,
    data_organization = "CIMMYT",
    publication= NA,
    project="International Durum Screening Nursery",
    data_type= "experiment",
    response_vars = "yield",
    treatment_vars = "variety_code",
    carob_contributor= "Fredy Chimire",
    carob_date="2024-10-20"
  )
  
  proc_wheat <- carobiner::get_function("proc_wheat", path, group)
  d <- proc_wheat(ff)	
  
  carobiner::write_files(path, meta, d)
}
