CREATE VIEW
  "foursquare_description" AS
  SELECT 
    "name",
    SUBSTRING("description" FROM '.+?</a>- (.+$)') AS "description",
    "wkb_geometry"
  FROM
    foursquare;
