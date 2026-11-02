#!/usr/bin/env bash
# Stitches _src/*.body.html between the shared letterhead and footer. Run: ./build.sh
set -euo pipefail
cd "$(dirname "$0")"
CSSV=$(cat assets/styles.css assets/script.js | md5sum | cut -c1-8)
build() {
  local name="$1" title="$2" desc="$3" path="$4" ch="" cc="" robots=""
  [ "$name" = exclude-me ] && robots='<meta name="robots" content="noindex, nofollow">'
  [ "$name" = index ] && ch='aria-current="page"'
  [ "$name" = contact ] && cc='aria-current="page"'
  TITLE="$title" DESC="$desc" PATH_="$path" CH="$ch" CC="$cc" CSSV="$CSSV" ROBOTS="$robots" python3 -I -c '
import os
h=open("_src/head.html").read()
for k,v in {"{{TITLE}}":"TITLE","{{DESC}}":"DESC","{{PATH}}":"PATH_","{{CUR_HOME}}":"CH","{{CUR_CONTACT}}":"CC","{{CSSV}}":"CSSV","{{ROBOTS}}":"ROBOTS"}.items():
    h=h.replace(k,os.environ[v])
print(h,end="")' > "$name.html"
  cat "_src/$name.body.html" >> "$name.html"
  sed "s/{{CSSV}}/$CSSV/" _src/foot.html >> "$name.html"
  echo "built $name.html"
}
build index "Nautica Lee Consulting" \
  "Social media, email, websites, marketing and client management for small businesses. One person behind the scenes, est. 2024." ""
build exclude-me "Exclude this device | Nautica Lee Consulting" \
  "Turns off visitor counting for this browser." "exclude-me.html"
build contact "Contact | Nautica Lee Consulting" \
  "Tell Nautica Lee Consulting about your business and what you want help with. Replies within one business day." "contact.html"
