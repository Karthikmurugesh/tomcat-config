#!/bin/bash
ver=`curl --silent http://mirror.vorboss.net/apache/tomcat/tomcat-10/ | grep v9 | awk '{split($5,c,">v") ; split(c[2],d,"/") ; print d[1]}'`
sudo yum install -y java wget git
cd /opt
rm -rf apache*
sudo wgethttps://dlcdn.apache.org/tomcat/tomcat-10/v10.0.27/bin/apache-tomcat-10.0.27.tar.gz 
sudo tar xvzf apache-tomcat-10.*
sudo rm -rf apache*.gz
sudo git clone https://github.com/adhig93/tomcat-config
sudo cp ./tomcat-config/context.xml /opt/apache-tomcat-10.*/webapps/manager/META-INF/context.xml
sudo cp ./tomcat-config/context.xml /opt/apache-tomcat-10.*/webapps/host-manager/META-INF/context.xml
sudo cp ./tomcat-config/tomcat-users.xml /opt/apache-tomcat-10.*/conf/tomcat-users.xml
sudo rm -rf tomcat-config
cd /opt/apache-tomcat-10.*
sudo sh bin/startup.sh
