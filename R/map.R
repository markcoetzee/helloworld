

library(raster)

plot_region = function(region = "Manawatu-Wanganui"){
# http://geoscripting-wur.github.io/IntroToRaster/
datdir <- 'data'
dir.create(datdir, showWarnings = FALSE)
adm <- raster::getData("GADM", country = "New Zealand",
                       level = 2, path = datdir)
plot(adm[adm$NAME_1 == region,])


mar <- adm[adm$NAME_1 == region,]

# All NZ
plot(mar, bg = "steelblue", axes=TRUE)
plot(adm, lwd = 10, border = "steelblue3", add=TRUE)
plot(adm, col = "lightsteelblue4", border = "lightsteelblue4", add =TRUE)

# Region
plot(mar, col = "olivedrab3", add = TRUE)


grid()
box()
invisible(text(getSpPPolygonsLabptSlots(mar),labels = as.character(mar$NAME_2), cex = 1.1, col = "white", font = 2))

mtext(side = 3, line = 1, "Manawatu-Wanganui", cex = 2)
mtext(side = 1, "Longitude", line = 2.5, cex=1.1)
mtext(side = 2, "Latitude", line = 2.5, cex=1.1)
mtext(side = 1, line = -2,
      "Projection: Geographic\n
Coordinate System: WGS 1984    \n
Data Source: GADM.org    ", adj = 1, cex = 0.5, col = "grey20")


}

plot_region()
