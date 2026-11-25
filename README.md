<h1 align="center">reslice roi t1</h1>

<p align="center">
  Reslices a volumetric parcellation onto the voxel grid of a T1-weighted image with FreeSurfer mri_vol2vol (header registration, nearest-neighbour interpolation), keeping its label file.
</p>

<p align="center">
  <a href="https://github.com/brainlife/abcd-spec"><img src="https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg" alt="ABCD Spec v1.1"></a>
  <a href="https://doi.org/10.25663/brainlife.app.749"><img src="https://img.shields.io/badge/Brainlife-brainlife.app.749-blue.svg" alt="Run on brainlife.io"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-see_LICENSE-lightgrey.svg" alt="License"></a>
</p>

## At a glance

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Reslices a volumetric parcellation onto the voxel grid of a T1-weighted image with FreeSurfer mri_vol2vol (header registration, nearest-neighbour interpolation), keeping its label file.**

Resamples parc.nii.gz to the voxel size and spacing of the T1w image with mri_vol2vol --regheader and nearest-neighbour interpolation, and copies label.json unchanged. Use it when a parcellation is already in the same space as the T1w image but on a different voxel grid; it does not perform registration.

| | |
|---|---|
| **Inputs** | `neuro/anat/t1w` · `neuro/parcellation/volume` |
| **Outputs** | `neuro/parcellation/volume` |
| **Container** | `brainlife/freesurfer:6.0.0` |
| **Resources** | 1 CPUs · 1 h walltime |
| **Requires** | `FREESURFER_LICENSE` |
| **Run it** | [doi.org/10.25663/brainlife.app.749](https://doi.org/10.25663/brainlife.app.749) |

#### Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `anat` | `neuro/anat/t1w` | yes | T1-weighted image whose voxel grid is the reslicing target. Must already be aligned with the parcellation; only header geometry is used. |
| `parcellation` | `neuro/parcellation/volume` | yes | Volumetric parcellation (parc.nii.gz) with its label.json. |

#### Outputs

| Output | Datatype | Description |
|---|---|---|
| `output` | `neuro/parcellation/volume` | Parcellation resliced to the T1w voxel grid, with the original label.json. |

<!-- brainlife-app:end -->

## Versions on brainlife.io

This repository hosts several Apps, each built from its own branch.

| App | Branch | Run it | Status |
|---|---|---|---|
| Reslice parcellation to match input anatomy | [`parcellation-v1.0`](https://github.com/bacaron/app-reslice-roi-t1/tree/parcellation-v1.0) | [doi:10.25663/brainlife.app.749](https://doi.org/10.25663/brainlife.app.749) | current |
| Reslice ROIs to match input anatomy (with affine) | [`affine-v1.0`](https://github.com/bacaron/app-reslice-roi-t1/tree/affine-v1.0) | [doi:10.25663/brainlife.app.539](https://doi.org/10.25663/brainlife.app.539) | available |
| Reslice ROIs to match input anatomy | [`v1.0`](https://github.com/bacaron/app-reslice-roi-t1/tree/v1.0) | [doi:10.25663/brainlife.app.522](https://doi.org/10.25663/brainlife.app.522) | available |

## Running the App

### On brainlife.io

Open the App at [doi.org/10.25663/brainlife.app.749](https://doi.org/10.25663/brainlife.app.749), choose `neuro/anat/t1w`, `neuro/parcellation/volume` from your project and press **Execute**. The results are saved to your project as `neuro/parcellation/volume`.

### Locally

You need [Singularity/Apptainer](https://apptainer.org/) (the App runs in `brainlife/freesurfer:6.0.0`), [`jq`](https://jqlang.github.io/jq/), `FREESURFER_LICENSE`.

1. Clone this repository and check out the App's branch (`git checkout parcellation-v1.0`).
2. Create `config.json` with the paths to your inputs and the parameters:

   ```json
   {
       "anat": "/path/to/anat/anat",
       "parcellation": "/path/to/parcellation/parcellation",
       "label": "/path/to/parcellation/label"
   }
   ```

3. Run `./main`.

## Citing

If you use this App, please cite it, the software it builds on and brainlife.io:

- Reslice parcellation to match input anatomy. brainlife.io App. [doi:10.25663/brainlife.app.749](https://doi.org/10.25663/brainlife.app.749)
- Dale AM, Fischl B, Sereno MI. Cortical surface-based analysis. I. Segmentation and surface reconstruction. NeuroImage 9:179-194 (1999).
- Dale, A.M., Fischl, B., Sereno, M.I., 1999. Cortical surface-based analysis. I. Segmentation and surface reconstruction. Neuroimage 9, 179-194.
- Fischl. FreeSurfer. *NeuroImage* 62:774-781 (2012). [doi:10.1016/j.neuroimage.2012.01.021](https://doi.org/10.1016/j.neuroimage.2012.01.021)
- Jenkinson et al. FSL. *NeuroImage* 62:782-790 (2012). [doi:10.1016/j.neuroimage.2011.09.015](https://doi.org/10.1016/j.neuroimage.2011.09.015)
- Hayashi S, Caron BA, Heinsfeld AS, et al. brainlife.io: a decentralized and open-source cloud platform to support neuroscience research. *Nature Methods* 21:809–813 (2024). [doi:10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)
- Avesani P, McPherson B, Hayashi S, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. *Scientific Data* 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

## Authors

- Brad Caron

**Contributors**

- Soichi Hayashi

## Funding

[![Wellcome-226486/Z/22/Z](https://img.shields.io/badge/Wellcome-226486%2FZ%2F22%2FZ-purple.svg)](https://wellcome.org/)
[![NIH-NINDS-U24NS140384](https://img.shields.io/badge/NIH_NINDS-U24NS140384-green.svg)](https://reporter.nih.gov/project-details/11261037)
[![NIH-NINDS-UM1NS132207](https://img.shields.io/badge/NIH_NINDS-UM1NS132207-green.svg)](https://reporter.nih.gov/project-details/11411328)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://reporter.nih.gov/project-details/10262925)
[![NIH-NIBIB-R01EB030896](https://img.shields.io/badge/NIH_NIBIB-R01EB030896-green.svg)](https://reporter.nih.gov/project-details/10428625)
[![NIH-NIMH-R01MH126699](https://img.shields.io/badge/NIH_NIMH-R01MH126699-green.svg)](https://reporter.nih.gov/project-details/10460628)
[![NIH-NIDCD-R01DC020088](https://img.shields.io/badge/NIH_NIDCD-R01DC020088-green.svg)](https://reporter.nih.gov/project-details/11140284)
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-2203524](https://img.shields.io/badge/NSF_BCS-2203524-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2203524)
[![NSF-IIS-1636893](https://img.shields.io/badge/NSF_IIS-1636893-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-OAC-2148729](https://img.shields.io/badge/NSF_OAC-2148729-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148729)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NSF-IIS-2148700](https://img.shields.io/badge/NSF_IIS-2148700-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148700)
[![NSF-OAC-1916518](https://img.shields.io/badge/NSF_OAC-1916518-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1916518)

<sub>brainlife.io, which runs this App, is publicly funded by Wellcome, the U.S. National Institutes of Health and the U.S. National Science Foundation; acknowledging that support helps keep it running.</sub>

## License

See [LICENSE](LICENSE).
