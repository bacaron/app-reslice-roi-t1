#!/bin/bash

rois=`jq -r '.rois' config.json`
anat=`jq -r '.anat' config.json`
affine=`jq -r '.affine' config.json`
inverse=`jq -r 'inverse' config.json`

set -x

# copy over ROIs
[ ! -d ./rois ] && mkdir -p ./rois ./output ./output/rois

[ -z "$(ls -A ./rois/)" ] && echo "copying rois" && cp -R ${rois} ./rois/

# compute inverse affine
if [[ ${inverse} == 'true' ]]; then
	echo "computing inverse affine"
	convert_xfm -omat inverse-affine.txt -inverse affine.txt
	affine='inverse-affine.txt'
fi

# apply affine to all ROIs to get back to subject space
echo "moving ROIs to anatomy space"
for i in `ls ./rois/rois`
do
	flirt -in ./rois/rois/${i} --ref ${anat} --applyxfm -init inverse-affine.txt -interp nearestneighbour --out ./output/rois/${i}
done