SELECT
  nbhd_name, count(*)
FROM
  foursquare_beer JOIN denver_neighborhoods ON
    ST_Contains(denver_neighborhoods.wkb_geometry, foursquare_beer.wkb_geometry)
GROUP BY
  nbhd_name
ORDER BY count DESC;
