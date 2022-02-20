#!/bin/sh

set -euo pipefail

# tsconfig.json作成
npx tsc --init

# https://typescript-eslint.io/docs/linting/
npm install --save-dev eslint typescript @typescript-eslint/parser @typescript-eslint/eslint-plugin prettier eslint-config-prettier

merged=$(cat package.json | jq '. |= . +
{
  "scripts": {
    "start": "tsc main.ts",
    "lint": "eslint --ext .ts '{,src/**/}*.ts' && npm run prtr",
    "prtr": "prettier --check '{,src/**/}*.ts'",
    "fprtr": "prettier --write '{,src/**/}*.ts'"
  }
}')
echo "$merged" > package.json


SCRIPT_DIR=$(cd $(dirname "$0"); pwd)
BO_DIR="$SCRIPT_DIR"/boilerplates/ts

# TODO: boilerplates中のコメントアウトを削除してコピーしたい
cp -i -r "$BO_DIR/." .
