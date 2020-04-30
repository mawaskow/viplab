#install.packages("raster")
#install.packages("rgdal")
#install.packages("rgeos")
#install.packages("RColorBrewer")

# libraries
library(raster)
library(rgdal)
library(rgeos)
library(RColorBrewer)

# remove factors
options(stringsAsFactors = FALSE)

# import orthophoto
orthoforndvi <- stack("Data/SantaRita20170708orthophoto.tif")

# convert to rasterbrick (lowers time)
orthoforndvi_brick <- brick(orthoforndvi)

# make r and nir values
r_brick <- orthoforndvi_brick[[1]]
nir_brick <- orthoforndvi_brick[[4]]

# calculate ndvi using r[1] and nir[4]
ndvicalc <- (nir_brick - r_brick) / (nir_brick + r_brick)

# export ndvi
writeRaster(x = ndvicalc,
            filename="Data/SantaRita20170708NDVI.tif", format = "GTiff", datatype='INT2S',
            overwrite = TRUE)