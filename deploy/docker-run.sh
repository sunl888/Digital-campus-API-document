#! /bin/sh

set -e

BASE_URL=${BASE_URL:-/}
NGINX_ROOT=/usr/share/nginx/html
UI_FILE=$NGINX_ROOT/index.html

replace_in_index () {
  if [ "$1" != "**None**" ]; then
    sed -i "s|/\*||g" $UI_FILE
    sed -i "s|\*/||g" $UI_FILE
    sed -i "s|$1|$2|g" $UI_FILE
  fi
}

replace_or_delete_in_index () {
  if [ -z "$2" ]; then
    sed -i "/$1/d" $UI_FILE
  else
    replace_in_index $1 $2
  fi
}

if [ "${BASE_API_URL}" ]; then
# sed -i 's/原字符串/新字符串/' /home/1.txt
# /起定界符作用,可以用|等任何字符代替
  sed -i "s|localhost:3000|${BASE_API_URL}|" $UI_FILE
fi

exec nginx -g 'daemon off;'
