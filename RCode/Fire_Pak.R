library(doParallel)  #Foreach Parallel Adaptor 
library(foreach)     #Provides foreach looping construct
library(sp)
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
install.packages("snow")
memory.limit(size=100000000)


Fire_path <- "user defined path for picking up AOD tif files downloaded from NASA"
#Fire_rnd <- stack(paste0(Fire_path,"\\Pak_Fire\\PakPunjab\\2002001.tif"))

Fire <- list.files(path=paste0(Fire_path,"\\Pak_Fire\\PakPunjab"), 
                  pattern =".tif" , full.names=TRUE)
#Note: the above command picks up all tiff files from one of the many folders in which NASA data was downloaded (the download automatically created these folders)

Fire <- stack(Fire)

#Reading in shapefile
DistPunjab <- st_read(dsn=(paste0("...\\Data\\Raw\\Shapefile\\")), 
                      layer="pak_admbnda_adm3_ocha_pco_gaul_20181218")

rstprj <- proj4string(Fire)      
DistPunjab <- st_transform(DistPunjab, rstprj)


for(i in seq(1, nlayers(Fire), 3)) {
  dir=names(Fire[[i]])     #name of the first band of each tif file saved here
  fire_sum <- exact_extract(Fire[[i]], DistPunjab,'sum')   #sums the values of each tif file's first band, for each district
  fire_count <- exact_extract(Fire[[i]], DistPunjab,'count')   #counts the values of each tif file's first band, for each district
  DistPunjab[[paste(dir, "_sum", sep = "")]] <- fire_sum   #pastes the sum calculated in previous line on the shape file
  DistPunjab[[paste(dir, "_count", sep = "")]] <- fire_count   #pastes the count calculated in previous line on the shape file
}


DistPunjab_sp <- as(DistPunjab, "Spatial")    #shapefile converted into sp from st
DistPunjab_sp_data <- DistPunjab_sp@data      #stores shapefile data in tabular form

# define data frame #
DistPunjab_sp_df <- data.frame(DistPunjab_sp)

# Write stata file #
write.dta(DistPunjab_sp_df, paste0("...\\Data\\Raw\\aod_fire\\pak_fire.dta"))



