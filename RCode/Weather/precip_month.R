install.packages("raster")
install.packages("ncdf4")
library(doParallel)  #Foreach Parallel Adaptor 
library(foreach)     #Provides foreach looping construct
library(raster)
library(base)
library(lubridate)
library(rgdal)
library(lattice)
library(latticeExtra)
library(RColorBrewer) # can go to this website
library(rasterVis)
library(foreign)
library(rgeos)
library(maptools)
library(maps)
library(rbenchmark)
library(data.table)
library(zoom)
library(readstata13)
library(spdep) 
library(classInt)
library(tmap)
library(sf)
library(dplyr)
library(spData)
library(spDataLarge)
library(leaflet) # for interactive maps
library(mapview) # for interactive maps
library(ggplot2) # tidyverse vis package
library(shiny)   # for web applications
library(shinyjs)
library(prioritizr)
library(exactextractr)
library(sp)
install.packages("snow")
memory.limit(size=100000000)

setwd("...\\Data\\Raw\\Rainfall and Temp\\")


#####   Importing the shapefile      #####

tehsilPak <- readOGR(dsn=(paste0("...\\Data\\Raw\\Shapefile")), 
                     layer="pak_admbnda_adm2_ocha_pco_gaul_20181218")

#### Making a border shapefile from the district level shapefile
Pakborder <- aggregate(tehsilPak, dissolve=TRUE)


#####   Importing the precipitation data   #####
GRIB <- brick("precip_nc.nc") 


rstprj <- proj4string(GRIB)      
tehsilPak <- spTransform(tehsilPak, rstprj)
Pakborder <- spTransform(Pakborder, rstprj)

cropprecip <- crop(GRIB, extent(Pakborder), snap="out")       #crop to restrict to polygon area
cropprecip = cropprecip * 1000

#### write this raster brick
writeRaster(cropprecip, filename=paste0("...\\Data\\Raw\\Rainfall and Temp\\cropprecip"), 
                                      format='GTiff', overwrite=TRUE)

#### Bring the raster back to extract polygons
precip_month <- brick("...\\Data\\Raw\\Rainfall and Temp\\cropprecip.tif")



for(i in 1:252) {
  nam <- paste("precip_month_",i,sep="")
  nam <- extract(precip_month[[i]],tehsilPak, fun=mean, na.rm=TRUE)
  tehsilPak[[paste("precip_month_",i,sep="")]] <- nam[,1] 
}


tehsilPak_sp_data <- tehsilPak@data      #stores shapefile data in tabular form


# define data frame #
tehsilPak_sp_df <- data.frame(tehsilPak)

# Write stata file #
write.dta(tehsilPak_sp_df, paste0("...\\Data\\Raw\\Rainfall and Temp\\precip_m.dta"))

