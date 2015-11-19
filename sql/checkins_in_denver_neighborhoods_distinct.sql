SELECT
  nbhd_name, name, count as visits, foursquare.wkb_geometry
FROM
  (select name, count(*), ST_Centroid(ST_Collect(wkb_geometry)) as wkb_geometry FROM foursquare group by name) foursquare JOIN denver_neighborhoods ON
    ST_Contains(denver_neighborhoods.wkb_geometry, foursquare.wkb_geometry)
WHERE
  foursquare.name ilike '%brew%' or name ilike '%beer%'
order by visits desc;
