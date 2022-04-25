# Feel free to try out the code below as we go through the presentation, if there are any issues/questions, shout out!

# Income disparity example
set.seed(0)
xy <- cbind(x=runif(1000, 0, 100), y=runif(1000, 0, 100))
income <- (runif(1000) * abs((xy[,1] - 50) * (xy[,2] - 50))) / 500
par(mfrow=c(1,3), las=1)
plot(sort(income), col=rev(terrain.colors(1000)), pch=20, cex=.75, ylab='income')
hist(income, main='', col=rev(terrain.colors(10)),  xlim=c(0,5), breaks=seq(0,5,0.5))
plot(xy, xlim=c(0,100), ylim=c(0,100), cex=income, col=rev(terrain.colors(50))[10*(income+1)])
par(mfrow=c(1,1))

# Importing Spatial Data
install.packages("rgdal")
library(rgdal)
Points_Shape <- readOGR(dsn=path.expand("Data/Class"), layer="Points")
Lines_Shape <- readOGR(dsn=path.expand("Data/Class"), layer="Lines")
Polygons_Shape <- readOGR(dsn=path.expand("Data/Class"), layer="Polygons")

install.packages('sf')
library(sf)
read_sf("Data/Class/Points.shp")

install.packages("raster")
library(raster)
Swiss_alt <- raster("Data/Class/Raster/Swiss_Altitude.tif")

install.packages("terra")
library(terra)
rast("Data/Class/Raster/Swiss_Altitude.tif")

# Plotting using plot()
plot(Points_Shape)

plot(Swiss_alt)

## Overlaying and different parameters in plot()
par(mfrow=c(1,3), las=1)
plot(Points_Shape, pch=21, col='black', bg='red', cex=1.75, lwd=2)
plot(Lines_Shape, col='yellow', lwd=2) 
plot(Polygons_Shape, col='green', lwd=1.9)

par(mfrow=c(1,1))
plot(Polygons_Shape, col='green', lwd=1.9)
points(Points_Shape, pch=21, col='black', bg='red', cex=1.75, lwd=2)
lines(Lines_Shape, col='yellow', lwd=2)
legend("topright", c("Lines", "Polygons", "Points"), col = c('yellow', 'green', 'red'),fill=c('yellow','green','red'))

plot(Polygons_Shape, col='green', lwd=1.9)
plot(Points_Shape, pch=21, col='black', bg='red', cex=1.75, lwd=2, add=TRUE)
plot(Lines_Shape, col='yellow', lwd=2, add=TRUE) 

# Real geospatial data, CRS and extents
Africa <- readOGR(dsn=path.expand("Data/Class"), layer="Africa")
plot(Africa)
plot(Polygons_Shape, col='green', lwd=1, add=TRUE)
plot(Points_Shape, pch=21, col='black', bg='red', cex=0.75, lwd=1, add=TRUE)
plot(Lines_Shape, col='yellow', lwd=1, add=TRUE)

st_crs(Africa)
extent(Africa)

# Increase Extent
World_NoAfr <- readOGR(dsn=path.expand("Data/Class"), layer="World_NoAfr")

plot(Africa)
plot(World_NoAfr, add=TRUE)

plot(Africa, xlim=c(-180,180), ylim=c(-84,84))
plot(World_NoAfr, add=TRUE)

# Spplot
World <- readOGR(dsn=path.expand("Data/Class"), layer="World")
plot(World, col="brown", bg="grey")


install.packages("sp")
library(sp)
World_Plot <- spplot(World, zcol='Continent', col.regions=c("green","red","brown","yellow","blue","orange"), scales=list(draw = TRUE), xlab='Longitude', ylab='Latitude', colorkey =list(labels=list(labels=c('Africa', 'Antarctica', 'Eurasia', 'N.America', 'Oceania', 'S.America'))))

World_Plot

install.packages("latticeExtra")
library(latticeExtra)
World_Cities <- readOGR(dsn=path.expand("Data/Class"), layer="World_Cities")

World_Plot+layer(panel.points(x=World_Cities$lng,y=World_Cities$lat, col="black", pch=21, cex=0.3))

# Visualising the attributes
World_Cities$Pop
World_Cities$Pop_Rank
World_Cities@data

World_Plot_shrink <- spplot(World, zcol='Continent', col.regions=c("green","red","brown","yellow","blue","orange"), scales=list(draw = TRUE), xlab='Longitude', ylab='Latitude', xlim=c(-8,7), ylim=c(50,59), colorkey =list(labels=list(labels=c('Africa', 'Antarctica', 'Eurasia', 'N.America', 'Oceania', 'S.America'))))

World_Plot_shrink+layer(panel.points(x=World_Cities$lng,y=World_Cities$lat, col="black", fill='white', pch=21, cex=as.numeric(World_Cities$Pop_Rank)/10, data=World_Cities))

# Multiple Plots with grid.arrange()
grid.arrange(World_Plot+layer(panel.points(x=World_Cities$lng,y=World_Cities$lat, col="black", pch=21, cex=0.3)),World_Plot_shrink+layer(panel.points(x=World_Cities$lng,y=World_Cities$lat, col="black", fill='white', pch=21, cex=as.numeric(World_Cities$Pop_Rank)/10, data=World_Cities)),ncol=2)
