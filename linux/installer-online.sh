if ! [ -x "$(command -v curl)" ]; then
	echo "Curl ins't installed, installing curl"
	sudo apt install -y curl
fi

if ! [ -x "$(command -v unzip)" ]; then
         echo "unzip ins't installed, installing unzip"
         sudo apt install -y unzip
fi



dir=$(mktemp -d)
curl -L https://bibijaan.com/latest/linux -o $dir/bibijaan.zip
unzip bibijaan.zip -d $dir/unzipped
dirVer=$(echo -n $(ls unzipped))
$dir/unzipped/$dirVer/install.sh
rm -rf $dir
