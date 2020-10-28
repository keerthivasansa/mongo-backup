#!/bin/bash
timep=$(date +”%d-%b-%Y-%H-%M-%S”) # Folder name will be in the Format : "DD-MM-YYYY-HH-MM-SS" | Example : ”28-Oct-2020-19-12-03” 
url='' # Input your MongoDB URL here
mongodump --uri=$url --out=$timep/ 
cd $timep/
cat << EOF > restore.sh
 mongorestore --uri=$url ./
EOF
chmod +x ./restore.sh
echo
echo "Backup complete, to restore use ./restore.sh at the directory you want to restore from!"
