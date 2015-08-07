# Transform all the spreadsheets in a folder from one format [XLS|XLSX|CSV] to the other two

# It depends on Gnumeric package being installed in your system
  # http://www.gnumeric.org/

# It receives one parameter:
  # folder
FOLDER=$1

cd "$FOLDER"

for f in *.*
do
  filename=$(basename "$f")
  extension="${filename##*.}"
  filename="${filename%.*}"

  if [ $extension = "xlsx" ]; then
    # Transform to CSV
    ssconvert $f $filename".csv"

    # Transform to XLS
    ssconvert $f $filename".xls"
  fi

  if [ $extension = "xls" ]; then
    # Transform to CSV
    ssconvert $f $filename".csv"

    # Transform to XLSX
    ssconvert $f $filename".xlsx"
  fi

  if [ $extension = "csv" ]; then
    # Transform to XLSX
    ssconvert $f $filename".xlsx"

    # Transform to XLS
    ssconvert $f $filename".xls"
  fi
done