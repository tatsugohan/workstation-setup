set -e
set -x

echo "**********************************************************************************"
URL_EXT=$(curl http://keepass.info/plugins.html | grep -i kpscript\- | grep -i -v "\-source" | cut -d\" -f2)
URL="https://keepass.info/"$(echo $URL_EXT)

WORKING_DIR=/tmp/KPScript

mkdir -p $WORKING_DIR
cd $WORKING_DIR

echo "INSTALL Keepass KPScript : $URL"
wget --no-check-certificate $URL -Okpscript.zip
unzip kpscript -d KS
cd KS
for i in * ; do 
   install -D -m644 $i "/usr/lib/keepass/"$i
done

cd ..
echo '/usr/bin/mono /usr/lib/keepass/KPScript.exe "$@"' > ./kpscript
sudo install -D -m755 ./kpscript "/usr/bin/kpscript"
