install.packages("raster")
install.packages("ncdf4")
library(doParallel)  #Foreach Parallel Adaptor 
library(foreach)     #Provides foreach looping construct
library(raster)
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

setwd("C:\\Users\\abuba\\Dropbox\\Smog-Crime\\Data\\Wind")


#####   Importing the tehsil shapefile      #####

tehsilPak <- readOGR(dsn=(paste0("C:\\Users\\abuba\\Dropbox\\Smog- air pollution\\Data\\Air Quality\\Pak_SHP")), 
                     layer="pak_admbnda_adm2_ocha_pco_gaul_20181218")

#### Making a border shapefile from the district level shapefile
Pakborder <- aggregate(tehsilPak, dissolve=TRUE)


#####   Importing the u-wind at 10m data   #####
GRIB <- brick("windu850_nc.nc") 



#GRIB_array<-as.array(GRIB) 

#GRIB[] <- 1:length(GRIB)

rstprj <- proj4string(GRIB)      
tehsilPak <- spTransform(tehsilPak, rstprj)
Pakborder <- spTransform(Pakborder, rstprj)

cropwindu850 <- crop(GRIB, extent(Pakborder), snap="out")       #crop to restrict to polygon area

#maskwindu10 <- mask(cropwindu10, tehsilPak)   #copy the relevant values from original raster to the new cropped raster

#plot(cropwindu10, 100) # plot layer 1 
#plot(Pakborder, add=TRUE)

#### write this raster brick
writeRaster(cropwindu850, filename=paste0("C:\\Users\\abuba\\Dropbox\\Smog- air pollution\\Data\\Wind\\windu850"), 
            format='GTiff', overwrite=TRUE)

#### Bring the raster back to extract polygons
windu_850 <- brick("C:\\Users\\abuba\\Dropbox\\Smog- air pollution\\Data\\Wind\\windu850.tif")



for(i in 1:228) {
  nam <- paste("windu850_",i,sep="")
  nam <- extract(windu_850[[i]],tehsilPak, fun=mean, na.rm=TRUE)
  tehsilPak[[paste("windu850_",i,sep="")]] <- nam[,1] 
}




#### Now save shapefile with tehsil level u-wind at 10m variable added 
writeOGR(tehsilPak, dsn=paste0("C:\\Users\\abuba\\Dropbox\\Smog-Crime\\Data\\Wind"), layer="windu850", driver="ESRI Shapefile", overwrite_layer = TRUE)

#### Bring in newly written shapefile 
#DistPak_precip <- readOGR(dsn=(paste0("C:\\Users\\abuba\\Dropbox\\Smog-Crime\\Data\\Wind")), layer="windu850")
tehsilPak_sp_data <- tehsilPak@data      #stores shapefile data in tabular form


# define data frame #
tehsilPak_sp_df <- data.frame(tehsilPak)

# Write stata file #
write.dta(tehsilPak_sp_df, paste0("C:\\Users\\abuba\\Dropbox\\Smog-Crime\\Data\\Wind\\windu_850.dta"))

