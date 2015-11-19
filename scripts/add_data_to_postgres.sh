host=localhost
user=postgres
password=postgres
dbname=postgis_day
connection_string="host=$host user=$user dbname=$dbname password=$password"

ogr2ogr -f "PostgreSQL" PG:"$connection_string" "../data/states.geojson" -nln "states" -overwrite
ogr2ogr -f "PostgreSQL" PG:"$connection_string" "../data/foursquare.geojson" -nln "foursquare" -overwrite
ogr2ogr -f "PostgreSQL" PG:"$connection_string" "../data/denver_neighborhoods.geojson" -nln "denver_neighborhoods" -overwrite

export PGPASSWORD=$password
psql -U $user -h $host -d $dbname -c 'CREATE INDEX idx_states_geom ON states USING GIST (wkb_geometry);'
psql -U $user -h $host -d $dbname -c 'CREATE INDEX idx_foursquare_geom ON foursquare USING GIST (wkb_geometry);'
psql -U $user -h $host -d $dbname -c 'CREATE INDEX idx_denver_neighborhoods_geom ON denver_neighborhoods USING GIST (wkb_geometry);'
