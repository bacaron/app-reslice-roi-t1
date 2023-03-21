#!/bin/bash

parcellation=`jq -r '.parcellation' config.json`
label=`jq -r '.label' config.json`
anat=`jq -r '.anat' config.json`

set -x

# copy over parcellation
[ ! -d ./parcellation ] && mkdir -p ./parcellation ./output

[ ! -f ./parcellation/parc.nii.gz ] && echo "copying parcellation" && cp ${parcellation} ./parcellation/
[ ! -f ./parcellation/label.json ] && echo "copying label" && cp ${label} ./output/

# reslice rois
echo "reslicing rois"
mri_vol2vol --mov ./parcellation/parc.nii.gz --targ ${anat} --regheader --interp nearest --o ./output/parc.nii.gz
