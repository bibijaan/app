lines() { 
    echo "*************************"
    echo "$1"
    echo "-------------------------"
    echo ""
}

package() {
    dpkg -s $1 &> /dev/null
    if [ $? -gt 0 ]; then
        lines "$1 isn't installed, installing $1"
		sudo apt install -y $1
    fi
}

package curl
package unzip

lines "Downloading zip bundle"

curl -L https://bibijaan.com/latest/linux.zip -o bibijaan_temp.zip
echo ""

if [ ! -f "bibijaan_temp.zip" ]; then
	lines "Couldn't download remote zip file as bibijaan_temp.zip, exiting!"
	exit 1 || return 1
fi

lines "unzipping zip bundle"

unzip bibijaan_temp.zip -d bibijaan_temp

dirVer=$(echo -n $(ls bibijaan_temp))

echo ""
lines "running install.sh"

bibijaan_temp/$dirVer/install.sh

echo ""

lines "Removing downloaded files"

rm -rf bibijaan_temp
rm bibijaan_temp.zip