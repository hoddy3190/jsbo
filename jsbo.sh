#!/bin/sh

set -euo pipefail

echo "[y or else] Do you expand the boilerplates at $(pwd) ?"
read yn

if [[ "$yn" != "y" ]]; then
    exit 0
fi

SCRIPT_DIR=$(cd $(dirname "$0"); pwd)

input_str="es or ts"
echo "[$input_str] What boilerplates?"
read tp

if [[ "$tp" = "es" ]]; then
  "$SCRIPT_DIR"/esbo.sh
elif [[ "$tp" = "ts" ]]; then
  "$SCRIPT_DIR"/tsbo.sh
else
  echo "[Error] please input ${input_str}."
  exit 1
fi
