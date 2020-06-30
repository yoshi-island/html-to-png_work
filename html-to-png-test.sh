#!/bin/zsh

# set html code file path
html_codes=`cat ./html-to-png-test.html`

# set css code file path
css_codes=``

# include passwords
. ./passwords.sh

# get image url path
png_url=`curl -X POST https://hcti.io/v1/image \
  -u $UserId:$APIKey \
  -d html="$html_codes" \
  -d css="$css_codes" \
  | jq ".url" \
  | sed "s/\"//g"`

# download image from url path to local
curl $png_url  > ./html-to-png-test.png
