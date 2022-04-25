# Mount packages
library(rgdal)
library(sp)
library(sf)
library(gridExtra)
library(latticeExtra)

# Plot 1
# Import Data
Constits <- readOGR(dsn=path.expand("Data/Practical"), layer="Constituencies")

plot(Constits, col="brown", border="black", lwd=1, main="UK Constituencies", bg='grey')

# Plot 2
# Change CRS
st_crs(Constits)
Constits <- spTransform(Constits, "+proj=longlat +datum=WGS84")

spplot(Constits, "frst_pr")

# Set up Colours
parties_col <-c('#013056', '#304e52', '#00cd00', '#808080', '#cd1500', '#ec9e0a', '#299220', '#002600', '#7fff7f', '#eaec08', '#ec08b4', '#63145f', '#00e5e5')
partiesGB_col <-c('#013056', '#00cd00', '#cd1500', '#ec9e0a', '#299220', '#eaec08', '#ec08b4', '#63145f')

spplot(Constits, "frst_pr", col.regions=parties_col, main='UK General Election 2015', scales=list(draw=TRUE),xlab='Longitude',ylab='Latitude')

# Plot 3
spplot(Constits, "turnout", col.regions=rev(terrain.colors(50)), main='UK General Election Turnout', scales=list(draw=TRUE),xlab='Longitude',ylab='Latitude', colorkey = list(labels = list( labels = c("50%", "55%","60%","65%","70%","75%","80%"))))

library(gridExtra)

grid.arrange(spplot(Constits, "frst_pr", col.regions=parties_col, main='UK General Election 2015', scales=list(draw=TRUE),xlab='Longitude',ylab='Latitude'),spplot(Constits, "turnout", col.regions=rev(terrain.colors(50)), main='UK General Election Turnout', scales=list(draw=TRUE),xlab='Longitude',ylab='Latitude', colorkey = list(labels = list( labels = c("50%", "55%","60%","65%","70%","75%","80%")))),ncol=2)

# Plot 4
# Import and transform GB Data
ConstitsGB <- readOGR(dsn = path.expand("Data/Practical"), layer = 'ConstituenciesGB')
ConstitsGB <- spTransform(ConstitsGB, "+proj=longlat +datum=WGS84")

grid.arrange(spplot(ConstitsGB, "urbn_pr", col.regions=rev(terrain.colors(50)),main='GB Constituency Urban Population', scales=list(draw=TRUE),xlab='Longitude',ylab='Latitude', colorkey = list(labels = list( labels = c("0%", "20%","40%","60%","80%","100%")))), spplot(ConstitsGB, "frst_pr", col.regions=partiesGB_col, main='GB 2015 Election Results', scales=list(draw=TRUE),xlab='Longitude',ylab='Latitude'),ncol=2)

# Plot 5
# Import SIMD Data
Scot_Dep <- readOGR(dsn = path.expand("Data/Practical"), layer = 'Scot_Dep')

spplot(Scot_Dep, "SIMD202", col.regions=heat.colors(100), main='Scottish Index of Multiple Deprivation',scales=list(draw=TRUE),xlab='Longitude',ylab='Latitude')

grid.arrange(spplot(ConstitsGB, "frst_pr", col.regions=partiesGB_col, main='Scotland 2015 Election Results', scales=list(draw=TRUE),xlab='Longitude',ylab='Latitude', xlim=c(-8,1), ylim=c(54,61)),spplot(Scot_Dep, "SIMD202", col.regions=heat.colors(100), main='Scottish Index of Multiple Deprivation',scales=list(draw=TRUE),xlab='Longitude',ylab='Latitude'),ncol=2)


# Plot 6
Cities <- readOGR(dsn=path.expand("Data/Practical"), layer="Cities")

grid.arrange(spplot(Constits, "frst_pr", col.regions=parties_col, main='UK Election Results', scales=list(draw=TRUE),xlab='Longitude') + layer(panel.points(x=Cities$lng,y=Cities$lat, col="black",fill="white", pch=21), data=Cities),spplot(ConstitsGB, "urbn_pr", col.regions=rev(terrain.colors(50)),main='GB Constituency Urban Population', scales=list(draw=TRUE),xlab='Longitude',ylab='Latitude', colorkey = list(labels = list( labels = c("0%", "20%","40%","60%","80%","100%"))))+ layer(panel.points(x=Cities$lng,y=Cities$lat, col="black",fill="red", pch=21, alpha=0.5), data=Cities),ncol=2)
