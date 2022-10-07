cd /tmp
mkdir memods
cd memods
curl -L https://github.com/aprets/ubuntumods/archive/refs/heads/main.zip -o main.zip
unzip main.zip -d main
cd main/*/
./installMods.sh
cd /tmp
rm -rf memods
echo "🤖"
