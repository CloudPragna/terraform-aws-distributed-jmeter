locals {
  master_user_data = <<EOF
#!/bin/bash
sudo yum install unzip -y
sudo amazon-linux-extras install java-openjdk11
sudo amazon-linux-extras install nginx1
wget https://mirrors.estointernet.in/apache//jmeter/binaries/apache-jmeter-5.3.zip
unzip apache-jmeter-5.3.zip
rm -rf apache-jmeter-5.3.zip
mv apache-jmeter-5.3 /var/lib/apache-jmeter-5.3
EOF
  slave_user_data  = <<EOF
#!/bin/bash
sudo yum install unzip -y
sudo amazon-linux-extras install java-openjdk11
wget https://mirrors.estointernet.in/apache//jmeter/binaries/apache-jmeter-5.3.zip
unzip apache-jmeter-5.3.zip
rm -rf apache-jmeter-5.3.zip
mv apache-jmeter-5.3 /var/lib/apache-jmeter-5.3
x=$(hostname -I | awk '{print $1}')
/var/lib/apache-jmeter-5.3/bin/jmeter-server -Dserver.rmi.localport=50000  -Dserver_port=1099 -Dserver.rmi.ssl.disable=true -Djava.rmi.server.hostname=$x
EOF
}
