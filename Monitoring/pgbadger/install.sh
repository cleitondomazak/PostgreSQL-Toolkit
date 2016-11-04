#Download package
#For RPM packages, you can find the pgBadger package at the PostgreSQL yum repository (http://yum.postgresql.org/packages.php)
yum install pgbadger

#Packages for Debian and Ubuntu are available in the PostgreSQL apt repository(https://wiki.postgresql.org/wiki/Apt).

#If your log_destination was set to 'csvlog' execute this procedure.

sudo perl -MCPAN -e "shell"

#CPAN Shell
install Text::CSV_XS
install CPAN
