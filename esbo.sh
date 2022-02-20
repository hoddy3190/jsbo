#!/bin/sh

set -euo pipefail

# --save-exactするとversion固定でpackage.jsonに記述される
npm i --save-dev --save-exact eslint prettier eslint-config-prettier

merged=$(cat package.json | jq '. |= . +
{
  "scripts": {
    "lint": "eslint .",
    "prtr": "prettier --check .",
    "fprtr": "prettier --write ."
  }
}')
echo "$merged" > package.json


SCRIPT_DIR=$(cd $(dirname "$0"); pwd)
BO_DIR="$SCRIPT_DIR"/boilerplates/es

# TODO: boilerplates中のコメントアウトを削除してコピーしたい
cp -i -r "$BO_DIR/." .
