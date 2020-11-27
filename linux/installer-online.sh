lines() { 
    echo "*************************"
    echo "$1"
    echo "-------------------------"
    echo ""
}

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

lines "Removing downloaded files"

rm -rf bibijaan_temp
rm bibijaan_temp.zip