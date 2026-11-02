#!/usr/bin/env bash
# Stitches _src/*.body.html between the shared header/footer into root HTML files.
# Run: ./build.sh
set -euo pipefail
cd "$(dirname "$0")"

build() {
  local name="$1" title="$2" desc="$3" path="$4"
  local cur_services="" cur_about="" cur_contact=""
  case "$name" in
    services) cur_services='aria-current="page"';;
    about)    cur_about='aria-current="page"';;
    contact)  cur_contact='aria-current="page"';;
  esac
  TITLE="$title" DESC="$desc" PATH_="$path" CS="$cur_services" CA="$cur_about" CC="$cur_contact" \
  python3 -I -c '
import os
h=open("_src/head.html").read()
for k,v in {"{{TITLE}}":"TITLE","{{DESC}}":"DESC","{{PATH}}":"PATH_","{{CUR_SERVICES}}":"CS","{{CUR_ABOUT}}":"CA","{{CUR_CONTACT}}":"CC"}.items():
    h=h.replace(k,os.environ[v])
print(h,end="")' > "$name.html"
  cat "_src/$name.body.html" _src/foot.html >> "$name.html"
  echo "built $name.html"
}

build index    "Nautica Lee Consulting | Social Media, Email, Brand and Client Management" \
  "Nautica Lee Consulting handles social media, inbox and email, media kits, brand building, marketing and client management for creators, talent and small businesses." ""
build services "Services | Nautica Lee Consulting" \
  "Social media management, email and inbox management, media kits, brand building, marketing, client and inquiry management, admin and talent support." "services.html"
build about    "About Nautica | Nautica Lee Consulting" \
  "Meet Nautica, the organized, creative partner behind Nautica Lee Consulting. Behind-the-scenes support for creators, talent and small businesses." "about.html"
build contact  "Contact | Nautica Lee Consulting" \
  "Book a free discovery call with Nautica Lee Consulting. Tell me about your business and what you need help with." "contact.html"
