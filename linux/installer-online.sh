if ! [ -x "$(command -v curl)" ]; then
	echo "Curl ins't installed, installing curl"
	sudo apt install -y curl
fi

if ! [ -x "$(command -v unzip)" ]; then
    echo "unzip ins't installed, installing unzip"
    sudo apt install -y unzip
fi

curl -L https://bibijaan.com/latest/linux.zip -o bibijaan.zip

unzip bibijaan.zip -d bibjaan

dirVer=$(echo -n $(ls bibjaan))

$dir/bibjaan/$dirVer/install.sh

rm -rf bibjaan