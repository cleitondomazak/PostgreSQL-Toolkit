#Download package
#You can find the pgBadger package at the PostgreSQL 
#For RPM packages are available in the PostgreSQL repository (http://yum.postgresql.org/packages.php)
yum install pgbadger

#For Debian and Ubuntu are available in the PostgreSQL repository(https://wiki.postgresql.org/wiki/Apt).
apt-get install pgbadger


#If your log_destination was set to 'csvlog' execute this procedure.
sudo perl -MCPAN -e "shell"

#CPAN Shell
install Text::CSV_XS
install CPAN
