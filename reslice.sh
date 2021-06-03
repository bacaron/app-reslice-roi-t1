#!/bin/bash

rois=`jq -r '.rois' config.json`
anat=`jq -r '.anat' config.json`

set -x

# copy over ROIs
[ ! -d ./rois ] && mkdir -p ./rois

[ -z "$(ls -A ./rois/)" ] && echo "copying rois" && cp -R ${rois} ./rois/

# reslice rois
echo "reslicing rois"
for i in `ls ./rois/rois/`
do
	mri_vol2vol --mov ./rois/rois/${i} --targ ${anat} --regheader --interp nearest --o ./rois/rois/${i}
done
