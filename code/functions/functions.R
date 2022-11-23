############ DATA PROCESSING FUNCTIONS ############

# Function to add year, month, and day to dataset from lubridate function
add_date_info = function(dat){
  dat$year     = lubridate::year(dat$closest_date)
  dat$month    = lubridate::month(dat$closest_date)
  dat$day      = lubridate::day(dat$closest_date)
  
  dat = dat[
    with(dat, order(year,month,day)),
  ]
  
  return(dat)
}

############ hurricaneexposure REPLACEMENT FUNCTIONS (TO ENABLE TO GO TO FURTHER YEARS) ############

county_distance = function (counties, start_year, end_year, dist_limit) 
{
  distance_df = filter_storm_data(counties = counties, year_range = c(start_year, 
                                                                      end_year), distance_limit = dist_limit, output_vars = c("storm_id", 
                                                                                                                              "fips", "closest_date", "storm_dist", "local_time", "closest_time_utc"))
  return(distance_df)
}

filter_storm_data = function (counties = NULL, storm = NULL, year_range = NULL, distance_limit = NULL, 
                              rain_limit = NULL, include_rain = FALSE, days_included = NULL, 
                              output_vars = c("fips")) 
{
  #hasData()
  # closest_dist = data.table::data.table(hurricaneexposuredata::closest_dist)
  closest_dist = data.table::data.table(closest_dist)
  if (!is.null(counties)) {
    closest_dist = closest_dist[get("fips") %in% counties]
  }
  if (!is.null(storm)) {
    closest_dist = closest_dist[get("storm_id") == storm]
  }
  if (!is.null(year_range)) {
    closest_dist = closest_dist[, .(storm_id, fips, closest_date, 
                                    storm_dist, local_time, closest_time_utc, year = substring(get("closest_date"), 
                                                                                               1, 4)), ][get("year") %in% year_range[1]:year_range[2]]
  }
  if (!is.null(distance_limit)) {
    closest_dist = closest_dist[get("storm_dist") <= distance_limit]
  }
  if (include_rain) {
    rain = data.table::data.table(hurricaneexposuredata::rain)
    rain = rain[get("lag") %in% days_included]
    rain = rain[, .(tot_precip = sum(get("precip"))), by = .(fips, 
                                                             storm_id)]
    closest_dist = merge(closest_dist, rain, all.x = TRUE, 
                         by = c("storm_id", "fips"))
    if (!is.null(rain_limit)) {
      closest_dist = closest_dist[get("tot_precip") >= 
                                    rain_limit]
    }
  }
  closest_dist = closest_dist[, .SD, , .SDcols = output_vars]
  return(closest_dist)
}

county_wind = function (counties, start_year, end_year, wind_limit, wind_var = "vmax_sust", 
                        wind_source = "modeled") 
{
  # hasData()
  output_vars = c("storm_id", "fips", "vmax_sust", "vmax_gust", 
                  "sust_dur")
  if (wind_source == "modeled") {
    output_vars = c(output_vars, "gust_dur")
  }
  wind_df = filter_wind_data(counties = counties, wind_var = wind_var, 
                             year_range = c(start_year, end_year), wind_limit = wind_limit, 
                             wind_source = wind_source, output_vars = output_vars) %>% 
    dplyr::left_join(closest_dist, 
                     by = c("storm_id", "fips"))
  return(wind_df)
}

filter_wind_data = function (counties = NULL, storm = NULL, year_range = NULL, wind_limit = NULL, 
                             output_vars = "fips", wind_var = "vmax_sust", wind_source = "modeled") 
{
  # hasData()
  if (wind_source == "ext_tracks" & wind_var == "gust_dur") {
    stop("When using Extended Best Tracks for the wind data source, ", 
         "you cannot use the\ngust duration as the wind variable.")
  }
  if (wind_source == "modeled") {
    storm_winds = data.table::data.table(storm_winds)
  }
  else if (wind_source == "ext_tracks") {
    storm_winds = data.table::data.table(ext_tracks_wind)
  }
  if (!is.null(counties)) {
    storm_winds = storm_winds[get("fips") %in% counties]
  }
  if (!is.null(storm)) {
    storm_winds = storm_winds[get("storm_id") == storm]
  }
  if (!is.null(year_range)) {
    if (wind_source == "modeled") {
      storm_winds = storm_winds[, .(storm_id, fips, vmax_gust = get("vmax_gust"), 
                                    vmax_sust = get("vmax_sust"), gust_dur = get("gust_dur"), 
                                    sust_dur = get("sust_dur"), year = gsub("*.+-", 
                                                                            "", get("storm_id"))), ][get("year") %in% year_range[1]:year_range[2]]
    }
    else if (wind_source == "ext_tracks") {
      storm_winds = storm_winds[, .(storm_id, fips, vmax_gust = get("vmax_gust"), 
                                    vmax_sust = get("vmax_sust"), sust_dur = get("sust_dur"), 
                                    year = gsub("*.+-", "", get("storm_id"))), ][get("year") %in% 
                                                                                   year_range[1]:year_range[2]]
    }
  }
  if (!is.null(wind_limit)) {
    if (wind_var == "vmax_sust") {
      storm_winds = storm_winds[get("vmax_sust") >= wind_limit]
    }
    else if (wind_var == "vmax_gust") {
      storm_winds = storm_winds[get("vmax_gust") >= wind_limit]
    }
    else if (wind_var == "sust_dur") {
      storm_winds = storm_winds[get("sust_dur") >= wind_limit]
    }
    else if (wind_var == "gust_dur") {
      storm_winds = storm_winds[get("gust_dur") >= wind_limit]
    }
  }
  storm_winds = storm_winds[, .SD, , .SDcols = output_vars]
  return(storm_winds)
}


map_tracks = function (storms, plot_object = NULL, padding = 2, plot_points = FALSE,
                       alpha = 1, color = "blue")
{
  # hasData()
  if (is.null(plot_object)) {
    plot_object = default_map()
  }
  map_dim = apply(matrix(c(-106.65037, 25.12993, -67.00742,
                           47.48101), byrow = TRUE, ncol = 2), MARGIN = 2, function(x) range(x) +
                    c(-1, 1) * padding)
  tracks = hurr_tracks %>% dplyr::select(latitude,
                                         longitude, storm_id, date) %>% dplyr::filter(as.character(storm_id) %in%
                                                                                        storms & longitude > !!map_dim[1, 1] & longitude <
                                                                                        !!map_dim[2, 1] & latitude > !!map_dim[1, 2] &
                                                                                        latitude < !!map_dim[2, 2]) %>% dplyr::mutate(date = lubridate::ymd_hm(date))
  splt_tracks = split(tracks, tracks$storm_id)
  full_tracks = lapply(splt_tracks, interp_track)
  full_tracks = do.call("rbind", full_tracks)
  out = plot_object + ggplot2::geom_path(data = full_tracks,
                                         ggplot2::aes(x = longitude, y = latitude,
                                                      group = storm_id), alpha = alpha, color = color)
  if (plot_points) {
    out = out + ggplot2::geom_point(data = tracks, ggplot2::aes(x = longitude,
                                                                y = latitude, group = storm_id), alpha = alpha)
  }
  if (!("CoordMap" %in% class(out$coordinates))) {
    out = out + ggplot2::coord_map()
  }
  return(out)
}

interp_track = function(track){
  
  if(nrow(track) < 3){
    return(track)
  } else {
    interp_date = seq(from = min(track$date),
                      to = max(track$date),
                      by = 900) # interpolate to every 15 minutes
    
    interp_lat = stats::spline(x = track$date,
                               y = track$latitude,
                               xout = interp_date,
                               method = "natural")$y
    interp_lon = stats::spline(x = track$date,
                               y = track$longitude,
                               xout = interp_date,
                               method = "natural")$y
    
    full_track = data.frame(storm_id = track$storm_id[1],
                            date = interp_date,
                            latitude = interp_lat,
                            longitude = interp_lon)
  }
  return(full_track)
}

default_map = function () {
  map_data = get_eastern_map("state")
  out = ggplot2::ggplot(map_data, ggplot2::aes(x = long,
                                               y = lat, group = group)) + ggplot2::geom_polygon(fill = "lightgray",
                                                                                                color = "white") + ggmap::theme_nothing(legend = TRUE) +
    ggplot2::coord_map()
  return(out)
}

get_eastern_map = function(map  = "county"){
  
  eastern_states = c("alabama", "arkansas", "connecticut", "delaware",
                     "district of columbia", "florida", "georgia", "illinois",
                     "indiana", "iowa", "kansas", "kentucky", "louisiana",
                     "maine", "maryland", "massachusetts", "michigan",
                     "mississippi", "missouri", "new hampshire", "new jersey",
                     "new york", "north carolina", "ohio", "oklahoma",
                     "pennsylvania", "rhode island", "south carolina",
                     "tennessee", "texas", "vermont", "virginia",
                     "west virginia", "wisconsin")
  
  map_data = ggplot2::map_data(map = map) %>%
    dplyr::filter(region %in% eastern_states)
  
  if(map == "county"){
    county.fips = maps::county.fips %>%
      dplyr::mutate(polyname = as.character(polyname)) %>%
      dplyr::mutate(polyname = stringr::str_replace(polyname,
                                                    ":.+", ""))
    map_data = map_data %>%
      tidyr::unite(col = "polyname", region:subregion,
                   sep = ",") %>%
      dplyr::left_join(county.fips, by = "polyname") %>%
      dplyr::mutate(fips = stringr::str_pad(fips, 5,
                                            side = "left", pad = "0"))
  }
  
  return(map_data)
}

############ PLOTTING FUNCTIONS ############