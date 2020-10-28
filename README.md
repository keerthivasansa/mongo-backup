# mongo-backup
Mongo-Backup is a bash script that can be used to take backups with the time, date as name of MongoDB Databases, using their URL. It also creates a handy restore.sh script that can be used to automatically restore them to given url!

## Core

What you can use this Script for
* Creating Backups with the timestamp as the folder name
* Restoring those backups with a script

## How to:

First, clone this repository using
`git clone https://github.com/Nectres/mongo-backup.git`

After that, change the variable `url` to the url of the database 
Valid URLs start with `mongo+srv://` or `mongo://` 

If you don't want to clone you can just create a script file `backup.sh` with contents:

```bash
#!/bin/bash
timep=$(date +”%d-%b-%Y-%H-%M-%S”)
url='' # Input your MongoDB URL here
mongodump --uri=$url --out=$timep/ 
cd $timep/
cat << EOF > restore.sh
 mongorestore --uri=$url ./
EOF
chmod +x ./restore.sh
echo
echo "Backup complete, to restore use ./restore.sh at the directory you want to restore from!"
```
then `cd` to the directory and use:

`chmod +x ./backup.sh`

Finally, anytime you want to take the backup of the database use 
`./backup.sh`
This will automatically backup everything accessible from the URL given and create a restore script
When you need to restore to a certain point, use:
`./restore.sh` in the directory you want to restore
