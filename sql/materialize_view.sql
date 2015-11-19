CREATE MATERIALIZED VIEW foursquare_beer AS
SELECT
  foursquare.wkb_geometry
FROM
  foursquare
WHERE
  name ilike '%brew%' or name ilike '%beer%';

CREATE INDEX idx_foursquare_beer_geom ON foursquare_beer USING GIST(wkb_geometry);

REFRESH MATERIALIZED VIEW foursquare_beer WITH DATA;
