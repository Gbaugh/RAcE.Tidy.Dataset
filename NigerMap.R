

# Purpose is to analyse the distribution of sites and CHWs in a geographical area
#  to understand the geographic balance of implementation 

# install.packages("measurements")
# install.packages("rgdal")
# library(rgdal)
NERadm <-   readOGR(dsn = "data", layer = "NER_adm3")
CODadm <-  readOGR(dsn = "data", layer = "COD_adm3")
CODadm <- fortify(CODadm)
# create a blank ggplot theme




sel <- CODadm$ID_1 == 3
plot(CODadm[sel, ])
plot(CODadm, col = "grey")


# plot(newmap, xlim = c(20, 35), ylim = c(-15, 0), asp = 1)


# Library
library(ggmap)

# For google map, you have to give the center of the window you are looking at.
# Possibility for the map type argument: terrain / satellite / roadmap / hybrid

# get the map info
# map <- get_googlemap("Kalemie, DRC", zoom = 8, maptype = "satellite")
map <- get_map(location = c(c(left = 27.8558349609375, bottom = -8.200616482608327, right = 29.915771484375004, top = -4.800890838853971)), maptype = "nps")

# Plot it
ggmap(map) + 
  theme_void() + 
  ggtitle("satellite") + 
  theme(
    plot.title = element_text(colour = "orange"), 
    panel.border = element_rect(colour = "grey", fill=NA, size=2)
  )




# doing it with qmplot is even easier
# qmplot(Long, Lat, data = DRCaires, maptype = "toner-lite",color = Distance.de.BCZ.à.CS, size = Nombre.de.sites, legend = "topleft")
qmplot(Long, Lat, data = DRCaires, color = Distance.de.BCZ.à.CS, size = Nombre.de.sites, xlim = c(-8.429, -4.932), ylim = c(25.928, 30.756))


