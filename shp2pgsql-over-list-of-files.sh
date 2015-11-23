for f in *.shp
do
  echo "$f"
  shp2pgsql -s 4326 -I $f > $f.sql
done