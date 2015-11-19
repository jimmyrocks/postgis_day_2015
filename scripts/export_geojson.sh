host=localhost
user=postgres
password=postgres
dbname=postgis_day
connection_string="host=$host user=$user dbname=$dbname password=$password"
sql=`cat ../sql/checkins_in_denver_neighborhoods_distinct.sql`
sql=${sql::-1}

ogr2ogr -f "GeoJSON" ../data/my_checkins.geojson PG:"$connection_string" -sql "$sql"
