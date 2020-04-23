'
mawaskow
23 Apr 2020
This program is an example of how to use R
to take a DEM/DTM and a DSM GeoTiff file 
and generate a CHM from the datasets.
'

##### install packages #####
#install.packages("raster")
#install.packages("rgdal")

##### import libraries #####
library(raster)
library(rgdal)

##### DEM #####
### open DEM data ###
dem_raster <- raster("Data/SantaRita20170708DTM.tif")
### plot DEM data ###
#plot(dem_raster, main = "DTM")

##### DSM #####
### open DSM data ###
dsm_raster <- raster("Data/SantaRita20170708DSM.tif")
### plot DSM data ###
#plot(dsm_raster, main = "DSM")

##### CHM #####
### construct CHM data ###
chm_raster = dsm_raster - dem_raster
plot(chm_raster, main = "CHM")

##### save/export the data #####
writeRaster(chm_raster, "Data/SantaRita20170708CHM.tiff",
            format= "GTiff")