#! /bin/sh
#
# entrypoint.sh

set -e

[[ "$DEBUG" == "true" ]] && set -x

mkdir -p /data/.config/qBittorrent

[[ ! -f /data/.config/qBittorrent/qBittorrent.conf ]] && cp /etc/qBittorrent.conf /data/.config/qBittorrent/

sed -i "s|Connection\\\PortRangeMin=.*|Connection\\\PortRangeMin=${PEER_PORT}|i" /data/.config/qBittorrent/qBittorrent.conf
sed -i "s|WebUI\\\Port=.*|WebUI\\\Port=${WEB_PORT}|i" /data/.config/qBittorrent/qBittorrent.conf

exec "$@"
