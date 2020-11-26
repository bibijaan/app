lines() { 
    echo "*************************"
    echo "$1"
    echo "-------------------------"
    echo ""
}

lines "checking packages (curl, unzip, sqlite3, libsqlite3-dev)"

package() {
	if ! [ -x "$(command -v $1)" ]; then
		lines "$1 isn't installed, installing $1"
		sudo apt install -y $1
	fi
}

package curl
package unzip
package sqlite3
package libsqlite3-dev

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