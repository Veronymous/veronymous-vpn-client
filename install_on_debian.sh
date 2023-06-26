#!/bin/bash

get_cpu_type() {
	echo $(uname -m)
}

install_wireguard() {
	sudo apt-get install wireguard -y
}

install_vpn_client() {
	local CPU_TYPE=$(get_cpu_type)
	local PACKAGE_URL="https://github.com/Veronymous/veronymous-vpn-client/releases/download/v0.1/veronymous-client-cli-linux-${CPU_TYPE}.zip"

	echo "Downloading package from ${PACKAGE_URL}"

	local TEMP_DIR=$(mktemp -d)

	wget "${PACKAGE_URL}" -P "$TEMP_DIR"

	sudo unzip "$TEMP_DIR/veronymous-client-cli-linux-${CPU_TYPE}.zip" -d /usr/local/bin/

	rm -rf "$TEMP_DIR"
}

install() {
	echo "Install Wireguard..."
	install_wireguard

	echo "Install VPN client"
	install_vpn_client
}

install
