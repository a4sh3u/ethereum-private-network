#!/bin/sh
set -e
command_exists() {
	command -v "$@" > /dev/null 2>&1
}
user="$(id -un 2>/dev/null || true)"
sh_c='sh -c'
if [ "$user" != 'root' ]; then
  if command_exists sudo; then
    sh_c='sudo -E sh -c'
  elif command_exists su; then
    sh_c='su -c'
  else
    cat >&2 <<-'EOF'
    Error: this installer needs the ability to run commands as root.
    We are unable to find either "sudo" or "su" available to make this happen.
    EOF
    exit 1
  fi
fi

export myip="$(dig +short myip.opendns.com @resolver1.opendns.com)"
docker-compose up -d bootnode
export enode_hash="$(cat $(docker inspect bootnode | grep json.log | awk -F '"' '{print $4}') | grep enode | awk -F // '{print $2}' | awk -F @ '{print $1}')"
sed -i "s|enode.*|enode://$enode_hash@$myip:30301\"|" chain-spec.json
sed -i "s|enode.*|enode://$enode_hash@$myip:30301\"|" client/chain-spec.json
docker-compose up -d parity_genesis parity_client
