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

#if [[ -f $SWAGGER_JSON ]]; then
#  #cp -s $SWAGGER_JSON $NGINX_ROOT
#  REL_PATH="./$(basename $SWAGGER_JSON)"
#  sed -i "s|http://petstore.swagger.io/v2/swagger.json|$REL_PATH|g" $INDEX_FILE
#  sed -i "s|http://example.com/api|$REL_PATH|g" $INDEX_FILE
#else
#  sed -i "s|http://petstore.swagger.io/v2/swagger.json|$API_URL|g" $INDEX_FILE
#  sed -i "s|http://example.com/api|$API_URL|g" $INDEX_FILE
#fi

#if [[ -n "$VALIDATOR_URL" ]]; then
#  sed -i "s|.*validatorUrl:.*$||g" $INDEX_FILE
#  TMP_VU="$VALIDATOR_URL"
#  [[ "$VALIDATOR_URL" != "null" && "$VALIDATOR_URL" != "undefined" ]] && TMP_VU="\"${VALIDATOR_URL}\""
#  sed -i "s|\(url: .*,\)|\1\n    validatorUrl: ${TMP_VU},|g" $INDEX_FILE
#  unset TMP_VU
#fi

# replace `url` with `urls` option if API_URLS is set
#if [[ -n "$API_URLS" ]]; then
#    sed -i "s|url: .*,|urls: $API_URLS,|g" $INDEX_FILE
#fi


exec nginx -g 'daemon off;'
