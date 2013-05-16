# Install Apache Tomcat

yum install java-1.6.0-openjdk-devel -y

sh -c 'echo export JAVA_HOME=/usr/lib/jvm/java-1.6.0-openjdk-1.6.0.0.x86_64 > /etc/profile.d/java.sh'

chmod +x /etc/profile.d/java.sh

source /etc/profile.d/java.sh 

wget http://apache.mesi.com.ar/tomcat/tomcat-7/v7.0.40/bin/apache-tomcat-7.0.40.tar.gz

tar xvzf apache-tomcat-7.0.40.tar.gz -C /opt 

sh -c 'echo export CATALINA_HOME=/opt/apache-tomcat-7.0.40 > /etc/profile.d/tomcat.sh'

chmod +x /etc/profile.d/tomcat.sh

source /etc/profile.d/tomcat.sh 

$CATALINA_HOME /bin/startup.sh 

service iptables stop

chkconfig iptables off 

/opt/apache-tomcat-7.0.40/bin/catalina.sh start

cp /vagrant/sample.war $CATALINA_HOME/webapps/

