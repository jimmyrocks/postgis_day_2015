SELECT
  nbhd_name, count(*)
FROM
  foursquare JOIN denver_neighborhoods ON
    ST_Contains(denver_neighborhoods.wkb_geometry, foursquare.wkb_geometry)
WHERE
  foursquare.name ilike '%brew%' or name ilike '%beer%'
GROUP BY
  nbhd_name
ORDER BY count DESC;
