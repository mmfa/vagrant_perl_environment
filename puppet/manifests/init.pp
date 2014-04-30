package { "build-essential": ensure=>latest }
package { "make": ensure=>latest }
package { "starman": ensure=>latest }
package { "postgresql-server-dev-8.4": ensure=>latest, require  => Exec['apt-get update'] }
include perl
perl::cpan{'File::Basename': ensure => installed}
perl::cpan{'JSON': ensure => installed}
perl::cpan{'Data::Dumper': ensure => installed}
perl::cpan{'URI::Escape': ensure => installed}
perl::cpan{'Cache::Memcached::Fast': ensure => installed}
perl::cpan{'Plack::Builder': ensure => installed}
perl::cpan{'Plack::App::File': ensure => installed}
perl::cpan{'Sys::Hostname': ensure => installed}
perl::cpan{'HTML::Strip': ensure => installed}
perl::cpan{'YAML::Syck': ensure => installed}
perl::cpan{'File::HomeDir': ensure => installed}
#perl::cpan{'': ensure => installed}
perl::cpan{'Mason': ensure => installed}
perl::cpan{'Test::More': ensure => installed}
perl::cpan{'DBI': ensure => installed}
perl::cpan{'MooseX::Params::Validate': ensure => installed}
perl::cpan{'DateTime::Format::Flexible': ensure => installed}
perl::cpan{'DateTime::Format::Pg': ensure => installed}
perl::cpan{'Data::Page': ensure => installed}
perl::cpan{'Sphinx::Search': ensure => installed}
perl::cpan{'Mason::Plugin::HTMLFilters': ensure => installed}
perl::cpan{'Mason::Plugin::PSGIHandler': ensure => installed}
perl::cpan{'Mason::Plugin::Cache': ensure => installed}
perl::cpan{'DBD::Pg': ensure => installed}
perl::cpan{'CHI::Driver::Memcached::Fast.pm': ensure => installed}
perl::cpan{'Net::LDAPS': ensure => installed}
perl::cpan{'Plack::Middleware::Session::Cookie': ensure => installed}
perl::cpan{'Plack::Middleware::Auth::Form': ensure => installed}
#perl::cpan{'Mason::Plugin::PSGIHandler': ensure => installed}
#perl::cpan{'DBI': ensure => installed}


exec { "apt-get update":
    command => "/usr/bin/apt-get update"
}



$home="/home/vagrant"
#ensure you have datastore.yml
file{
  "/etc/datastore.yml":
  source => "puppet:///modules/datastore/datastore.yml",
  ensure => present
}

#ensure you ahve dbix-datastore custom 
file {
  "$home/DBIx-DataStore-0.94.tar":
  source => "puppet:///modules/datastore/DBIx-DataStore-0.94.tar",
  ensure => present
}

file {
  "$home/install_datastore.sh":
  source => "puppet:///modules/datastore/install_datastore.sh",
  ensure => present
}


# untar the tarball at the desired location and install package
/*
 exec { "untar and isntall DBIx-DataStore":
  command => "/bin/tar xvf $home/DBIx-DataStore-0.94.tar -C $home/;rm $home/DBIx-DataStore-0.94.tar;
#              /usr/bin/perl $home/DBIx-DataStore-0.94/Makefile.PL",
#  ensure => presence
#  refreshonly => true,
  returns => [0,2], 
  require => File["$home/DBIx-DataStore-0.94.tar"]
}
*/

exec {"untar and install ":
  command => "/bin/sh $home/install_datastore.sh"
}
