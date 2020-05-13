##### install necessary packages #####
#install.packages("raster")
#install.packages("rgdal")
#install.packages("rgeos")
#install.packages("RColorBrewer")

##### libraries #####
library(raster)
library(rgdal)
library(rgeos)
library(RColorBrewer)

##### function #####
generate_ndvi <- function(orthophotoinfile, ndvioutfile){
  options(stringsAsFactors = FALSE)
  orthoforndvi <- stack(orthophotoinfile)
  orthoforndvi_brick <- brick(orthoforndvi)
  r_brick <- orthoforndvi_brick[[1]]
  nir_brick <- orthoforndvi_brick[[4]]
  ndvicalc <- (nir_brick - r_brick) / (nir_brick + r_brick)
  plot(ndvicalc, 1000000, 1000000, main = ndvioutfile)
  writeRaster(x = ndvicalc,
              filename= ndvioutfile, format = "GTiff", datatype='INT2S', overwrite = TRUE)
}

##### Here is where you select the folder from which you will select the files #####
filenames <- c(list.files("C:\\Users\\MAWaskow\\Documents\\Research\\Spring20\\Coding", pattern = "*orthophoto.tif", full.names = 'True'))

##### main code #####
for (i in seq_along(filenames)){
  len = nchar(filenames[i])
  begin = substr(filenames[i], 1, len-14)
  end = "NDVI.tif"
  ndviname = paste(begin, end, sep = "")
  generate_ndvi(filenames[i], ndviname)
}
