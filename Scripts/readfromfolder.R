##### install necessary packages #####
#install.packages("raster")
#install.packages("rgdal")

library(raster)
library(rgdal)
###

generate_chm <- function(dtmfilename, dsmfilename, chmoutfilename){
  dtm_raster <- raster(dtmfilename)
  dsm_raster <- raster(dsmfilename)
  chm_raster <- dsm_raster - dtm_raster
  writeRaster(chm_raster, chmoutfilename,
              format= "GTiff", overwrite = TRUE)
}

dsmfiles <- c(list.files("C:\\Users\\MAWaskow\\Documents\\Research\\Spring20\\Coding", pattern = "*DSM.tif", full.names = 'True'))
dtmfiles <- c(list.files("C:\\Users\\MAWaskow\\Documents\\Research\\Spring20\\Coding", pattern = "*DTM.tif", full.names = 'True'))

for (i in seq_along(dsmfiles)){
  len = nchar(dsmfiles[i])
  begin = substr(dsmfiles[i], 1, len-7)
  end = "CHM.tif"
  chmname = paste(begin, end, sep = "")
  generate_chm(dtmfiles[i], dsmfiles[i], chmname)
}
