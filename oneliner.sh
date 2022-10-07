cd /tmp
echo "🪄 making temp memods directory"
mkdir memods
cd memods
echo "📥 downloading the stuff"
curl -L https://github.com/aprets/ubuntumods/archive/refs/heads/main.zip -o main.zip
echo "📦 unboxing the stuff"
unzip main.zip -d main
cd main/*/
echo "💿 starting the installer"
./installMods.sh
cd /tmp
echo "💥 removing the temp dir"
rm -rf memods
echo "🤖 donezo"
