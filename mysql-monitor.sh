#Checks if MySQL service is running, if not, restarts it
UP=$(pgrep mysql | wc -l);
if [ "$UP" -ne 1 ];
then
        echo "MySQL is down.";
        sudo service mysql start
 
else
        echo "All is well.";
fi
