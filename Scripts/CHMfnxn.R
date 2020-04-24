# This program has a function that converts inputted dsm and dtm/dem files
# into a chm file

generate_chm <- function(dtmfilename, dsmfilename, chmoutfilename){
  dtm <- raster(dtmfilename)
  dsm <- raster(dsmfilename)
  chm_raster = dsm_raster - dem_raster
  writeRaster(chm_raster, chmoutfilename,
              format= "GTiff")
}

generate_chm("Data/SantaRita20170708DTM.tif", "Data/SantaRita20170708DSM.tif", 
             "Data/SantaRita20170708CHM2.tif")
