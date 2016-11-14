#!/bin/bash

echo "Cleaning up..."

for word in $(ls $LOCAL_PATH_HexoLibreOms/makescripts/); do
  if [ "$word" != "99cleanup.sh" ]; then
    source $word c
  fi
done

echo "Done!"
