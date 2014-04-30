cd /home/vagrant/
/bin/tar xvf DBIx-DataStore-0.94.tar
rm DBIx-DataStore-0.94.tar
cd /home/vagrant/DBIx-DataStore-0.94
/usr/bin/perl Makefile.PL
sudo make
sudo make test
sudo make install
