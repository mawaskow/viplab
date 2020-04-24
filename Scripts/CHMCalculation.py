'''
Author: Ales Waskow
Affiliation: VIP Lab
Date: 23 April 2020
Topic: Feasibility of using python for CHM calculation
Description:
This program is a means of determining the script necessary to calculate 
CHM from DSM and DTM/DEM.
'''

# import libraries
import matplotlib.pyplot as plotter
from osgeo import gdal
import numpy
import geopandas
from skimage import io
import skimage.external.tifffile

# function definitions

def use_matplot(filetiff):
    image = plotter.imread(filetiff)
    
    plotter.imsave(filetiff, ar)

def use_matplot_and_skimage(filetiff, outfiletiff):
    image = io.imread(filetiff)
    plotter.imshow(image, cmap = black)
    plotter.axis("off")
    plotter.savefig(outfiletiff, transparent = True, dpi = 300, bbox_inches = "tight", pad_inches= 0.0)

def use_gdal(filetiff):
    tiffdata = gdal.Open(filetiff, 'r')
    n = tiffdata.
    for i in range(1, )

####################################
def main():
    use_matplot("C:\Users\MAWaskow\Documents\Research\Spring20\Coding\SantaRita20170708DSM.tif")

main()