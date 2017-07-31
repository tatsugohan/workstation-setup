set -e
cd /tmp
echo "**********************************************************************************"
URL=$(curl -s https://www.vagrantup.com/downloads.html | grep x86_64.rpm | cut -d\" -f 2)
TOOL_VERSION=$(echo $URL | cut -d_ -f2)
echo "INSTALL VAGRANT VERSION $TOOL_VERSION"
wget $URL -Ovagrant.rpm

rpm -i vagrant.rpm

echo "**********************************************************************************"
URL=$(curl -s https://www.terraform.io/downloads.html | grep linux_amd64.zip | cut -d\" -f2)
TOOL_VERSION=$(echo $URL | cut -d_ -f2)
echo "INSTALL TERRAFORM VERSION $TOOL_VERSION"
wget $URL -Oterraform.zip
unzip terraform.zip -d /usr/bin

echo "**********************************************************************************"
URL=$(curl -s https://www.packer.io/downloads.html | grep linux_amd64.zip | cut -d\" -f2)
TOOL_VERSION=$(echo $URL | cut -d_ -f2)
echo "INSTALL PACKER VERSION $TOOL_VERSION as packer.io (another tool named packer already exists on RHEL)"
wget $URL -Opacker.zip
unzip packer.zip
mv packer /usr/bin/packer.io
