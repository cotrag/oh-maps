census_api_key("fae6a4d11b5d79c9d0914bb8078572e255183425", install = TRUE)


readRenviron("~/.Renviron")

median_inc_oh <- get_acs(geography = "tract",
                         variables = "B19013_001",
                         state = "OH",
                         geometry = TRUE)


data_nonall <-get_acs(geography = "county",
                      variables = "B99151_003",
                      state = "OH",
                      geometry = TRUE)

st_join(data_tot, data_nonall, by= "geometry")


ggplot(median_inc_oh, aes(fill= estimate, color = estimate)) +
  geom_sf() + scale_fill_viridis_c(labels=scales::number_format()) +
  scale_color_viridis_c(guide=FALSE) +
  theme_minimal() +
  coord_sf( datum = NA)

?scales


ggplot(data_tot, aes(fill= estimate, color = estimate)) +
  geom_sf() + scale_fill_viridis_c(labels=scales::dollar) +
  scale_color_viridis_c(guide=FALSE) +
  theme_minimal() +
  coord_sf( datum = NA)

var <- load_variables(2018, dataset = "acs5")



cd116 <- congressional_districts(cb = TRUE, resolution = '20m')

leaflet(oh) %>%
  addProviderTiles("CartoDB.Positron") %>%
  addPolygons(stroke = TRUE, color = "black", weight = 1, 
              fillColor = "white",
              fillOpacity = 0.1)

oh <- state_legislative_districts(state = "Ohio", house = "lower",
                                  cb= TRUE)



?state_legislative_districts

?addProviderTiles

leaflet(median_inc_oh) %>%
  addProviderTiles("CartoDB.Positron") %>%
  addPolygons(stroke = TRUE, fillOpacity = 0.5, smoothFactor = 0.5,
              color = "black", weight = 1, opacity = 1,
              fillColor = ~colorNumeric("YlOrRd", estimate)(estimate),
              label = mytext)




?addPolygons


addLegend(colors =  ~colorQuantile("YlOrRd", estimate)(estimate),
          opacity=0.9, title = "Population (M)", position = "bottomleft")


mytext <- paste(
  "County: ", median_inc_oh$NAME,"<br/>", 
  "Median Income: ", median_inc_oh$estimate,
  sep="") %>%
  lapply(htmltools::HTML)







?addLegend

?pal
mypalette <- colorNumeric( palette="viridis", 
                           domain=data_tot$estimate, na.color="transparent")



?leaflet



?addPolygons



### FINAL COPY

leaflet() %>%
  addProviderTiles("CartoDB.Positron") %>%
  addPolygons(data = oh, stroke = TRUE, color = "black", weight = 1, fillOpacity = 0.01) %>%
  addPolygons(data = median_inc_oh,stroke = FALSE, fillOpacity = 0.5, smoothFactor = 0.5,
              color = "white", weight = 1, opacity = 1,
              fillColor = ~colorNumeric("YlOrRd", estimate)(estimate),
              label = mytext) 





library(magrittr)
library(tigris)
library(tidyverse)
library(tidycensus)
library(leaflet)










get_acs(geography = "tract",
        table = "S2801",
        )





