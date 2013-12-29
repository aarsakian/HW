#!/bin/bash
mkdir Downloads
cd /home/vagrant/Downloads

wget http://luarocks.org/releases/luarocks-2.1.1.tar.gz
#luarocks
tar -zxf luarocks-2.1.1.tar.gz
cd luarocks-2.1.1
./configure
make build
sudo make install

cd /home/vagrant/Downloads

#OpenResty
wget http://openresty.org/download/ngx_openresty-1.4.3.6.tar.gz
tar -zxf ngx_openresty-1.4.3.6.tar.gz
cd ngx_openresty-1.4.3.6
./configure --with-luajit
gmake
sudo gmake install

cd /home/vagrant

sudo ln -s /usr/local/bin/luarocks /usr/bin/luarocks

luarocks --local install vert

/home/vagrant/.luarocks/bin/vert init HW

cd HW
source bin/activate
luarocks install lapis
#luarocks install luasql-mysql
mkdir HWApp
cd HWApp
lapis new

#sudo /etc/init.d/mysqld start
#sudo /etc/init.d/nginx start
#set runlevels
sudo chkconfig --level 35  nginx on
sudo chkconfig --level 35  mysqld on

