# MoVi-Toolbox
Data Preparation, Processing, and Visualization for MoVi Data, https://www.biomotionlab.ca/movi/
<img src="C.gif" align="middle">

[MoVi](https://www.biomotionlab.ca/movi/) is a large multipurpose dataset of human motion and video

Here we provide tools and tutorials to use MoVi in your research projects. More specifically:

## Table of Contents
  * [Installation](#installation)
  * [Tutorials](#tutorials)
  * [Citation](#citation)
  * [License](#license)
  * [Contact](#contact)

## Installation
**Requirements**
- Python 3.7


Install from this repository for the latest developments:
```bash
pip install git+https://github.com/saeed1262/MoVi-Toolbox
```

## Tutorials
We release tools for MATLAB and Python ...

Please refer to [tutorials](/notebooks) for further details.

## Citation
Please cite the following paper if you use this code directly or indirectly in your research/projects:
```
@inproceedings{MoVi:2019,
  title={MoVi: A Multipurpose Human Motion and Video Dataset},
  author={Ghorbani, Saeed},
  booktitle = {Plos1},
  year={2019},
  month = {Oct},
  url = {https://www.biomotionlab.ca},
  month_numeric = {10}
}
```
## License
License goes here
 
 ## Contact
The code in this repository is developed by [Saeed Ghorbani](https://www.biomotionlab.ca/saeed-ghorbani/).

If you have any questions you can contact us at [saeed62@yorku.ca](mailto:saeed62@yorku.ca).

For commercial licensing, contact ...
```
Subject_35_F:  [1x1] struct
  |--generator:  [1x1] string
  |--id:  [1x10] char
  |--markers_ini:  [1x56] char
  |--segments_ini:  [1x57] char
  |--visual3d_mdh:  [1x61] char
  |--subject:  [1x1] cell
  |--static:  [1x1] struct
  |  |--c3d:  [1x85] char
  |  |--c3d_status:  [1x18] char
  |  |--description:  [1x7] char
  |  |--gaps:  [120x87] double
  |  |--AnalogSignals:  [0x0] double
  |  |--AnalogFrameRate:  [1x1] double
  |  |--c3dStart:  [1x1] double
  |  |--c3dEnd:  [1x1] double
  |  |--trimStart:  [1x1] double
  |  |--trimEnd:  [1x1] double
  |  |--firstFrame:  [1x87] double
  |  |--lastFrame:  [1x87] double
  |  |--markerName:  [1x87] cell
  |  |--markerType:  [1x87] cell
  |  |--markerDescription:  [1x87] cell
  |  |--markerSide:  [1x87] double
  |  |--markerMatch:  [1x87] double
  |  |--markerParent:  [1x87] double
  |  |--markerSubject:  [1x87] double
  |  |--mdData:  [120x87] double
  |  |--segmentName:  [1x15] cell
  |  |--segmentType:  [1x15] cell
  |  |--segmentDescription:  [1x15] cell
  |  |--segmentSide:  [1x15] double
  |  |--segmentMatch:  [1x15] double
  |  |--segmentParent:  [1x15] double
  |  |--physicalMarkers:  [1x87] double
  |  '--virtualMarkers:  [1x20] double
  '--move:  [1x1] cell
  ```
