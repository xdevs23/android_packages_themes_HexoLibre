#!/bin/bash

MYPWD="$LOCAL_PATH_HexoLibreOms"

if [ "$1" == "c" ]; then
  rm -rf ${MYPWD}/assets/overlays/
  rm -rf ${MYPWD}/cmtheme/resolved
  rm -rf ${MYPWD}/cmtheme/intermediates
  echo "makeResolvedOverlays: symlinking overlays-cm..."
  ln -sf ../../cmtheme/overlays/ ${MYPWD}/assets/overlays-cm
  return 0
fi


echo "Making resolved overlays..."

java -jar ${MYPWD}/cmtheme/DTT.jar nogui direct transform to=oms id=${MYPWD}/cmtheme/overlays/ od=${MYPWD}/cmtheme/intermediates/
mv ${MYPWD}/cmtheme/intermediates/assets/overlays ${MYPWD}/cmtheme/resolved

echo "Copying resolved overlays..."

cp -R ${MYPWD}/cmtheme/resolved ${MYPWD}/assets/overlays

echo "Removing overlays-cm temporarily..."

rm ${MYPWD}/assets/overlays-cm

echo "2-in-1 package is ready."
