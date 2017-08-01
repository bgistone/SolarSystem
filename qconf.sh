sudo apt-get install oracle-java8-installer
sudo apt-get install gridengine-*
sudo service gridengine-master restart
echo "gridengine-common       shared/gridenginemaster string  $MASTER_HOSTNAME" | sudo debconf-set-selections
echo "gridengine-common       shared/gridenginecell   string  default" | sudo debconf-set-selections
echo "gridengine-common       shared/gridengineconfig boolean false" | sudo debconf-set-selections
echo "gridengine-client       shared/gridenginemaster string  $MASTER_HOSTNAME" | sudo debconf-set-selections
echo "gridengine-client       shared/gridenginecell   string  default" | sudo debconf-set-selections
echo "gridengine-client       shared/gridengineconfig boolean false" | sudo debconf-set-selections
echo "postfix postfix/main_mailer_type        select  No configuration" | sudo debconf-set-selections
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y gridengine-exec gridengine-client
sudo service postfix stop
sudo update-rc.d postfix disable
sudo qconf -am lxf
sudo qconf -ao lxf
sudo qconf -au lxf RRgrid
sudo qconf -Msconf grid.configuration.qconf
sudo vi /etc/hosts
sudo vi /etc/hosts
sudo qconf -Aq grid.queue.qconf
sudo qconf -Aq grid.queue.qconf 
sudo qconf -as master
sudo qconf -as rrgene-xf
sudo qconf -as rr3
sudo qconf -ah master
sudo qconf -ah rrgene-xf
sudo qconf -ah rr3
sudo sh ./sge-worker-add.sh all.q master 4
sudo sh ./sge-worker-add.sh all.q rrgene-xf 4
sudo sh ./sge-worker-add.sh all.q rr3 4
