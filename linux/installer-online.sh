lines() { 
    echo "*************************"
    echo "$1"
    echo "-------------------------"
    echo ""
}

if ! [ -x "$(command -v curl)" ]; then
	lines "Curl ins't installed, installing curl"
	sudo apt install -y curl
fi

if ! [ -x "$(command -v unzip)" ]; then
    lines "unzip ins't installed, installing unzip"
    sudo apt install -y unzip
fi

lines "Downloading zip bundle"

curl -L https://bibijaan.com/latest/linux.zip -o bibijaan_temp.zip

echo ""
lines "unzipping zip bundle"

unzip bibijaan_temp.zip -d bibijaan_temp

dirVer=$(echo -n $(ls bibijaan_temp))

echo ""
lines "running install.sh"

bibijaan_temp/$dirVer/install.sh

echo ""

lines "BiBiJAAN Desktop app should be installed!"
lines "Version: $(cat $HOME/.local/share/applications/bibijaan.desktop | grep 'Version' | cut -d '=' -f 2)"

lines "Removing downloaded files"

rm -rf bibijaan_temp
rm bibijaan_temp.zip