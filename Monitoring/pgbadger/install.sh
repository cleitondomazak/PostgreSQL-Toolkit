#Download package
wget http://downloads.sourceforge.net/project/pgbadger/7.0/pgbadger-7.0.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fpgbadger%2F&ts=1436528468&use_mirror=ufpr -O pgbadger-7.0.tar.gz
tar -zxvf pgbadger-7.0.tar.gz
cd pgbadger-7.0
perl Makefile.PL
make && sudo make install

#If your log_destination was set to 'csvlog' execute this procedure

sudo perl -MCPAN -e "shell"

#CPAN Shell
install Text::CSV_XS
install CPAN
