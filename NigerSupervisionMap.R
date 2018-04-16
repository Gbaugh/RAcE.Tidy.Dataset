#
#
#
# Niger Dataset
# Sites, CHWs, Facilities, 
#
#  NIGcsi <- NIGchw %>% add_count(CSI)
#  names(NIGcsi)[names(NIGcsi) == 'nn'] <- 'Sites'
#  unite(NIGcsi, geoloc, CSI, District_Sanitaire, Country, sep = ", ", remove = FALSE)
#
#


load("NIGsites.Rdata")
load("NIGfac.Rdata")
load("NIGchw.Rdata")











save(NIGsites, file="NIGsites.Rdata")
