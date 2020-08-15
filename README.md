# MoVi-Toolbox
Data Preparation, Processing, and Visualization for MoVi Data, https://www.biomotionlab.ca/movi/

<img src="demo.gif" align="middle">

[MoVi](https://www.biomotionlab.ca/movi/) is a large multipurpose dataset of human motion and video.

Here we provide tools and tutorials to use MoVi in your research projects. More specifically:

## Table of Contents
  * [Installation](#installation)
  * [Tutorials](#tutorials)
  * [Important Notes](#important-notes)
  * [Citation](#citation)
  * [License](#license)
  * [Contact](#contact)

## Installation
**Requirements**
- Python 3.*
- MATLAB v>2017

In case you are interested in using body shape data (or also AMASS/MoVi original data) follow the instructions on [AMASS Github page](https://github.com/nghorbani/amass).

## Tutorials
- We have provided very brief tutorials on how to use the dataset in [MoCap](/MoCap). Some of the functions are only provided in **MATLAB** or **Python** so please take a look at both tutorial files [`tutorial_MATLAB.mlx`](MoCap/tutorial_MATLAB.mlx) and [`tutorial_python.ipynb`](MoCap/tutorial_python.ipynb).

- The tutorial on how to have access to the dataset is given [here](https://www.biomotionlab.ca/Data/Tutorials/DataverseTutorialBMLmovi.pdf).

## Important Notes
- The video data for each round are provided as a single sequence (and not individual motions). In case you are interested in having synchronized video and AMASS (joint and body) data, you should trim F_PGx_Subject_x_L.avi files into single motion video files using [`single_videos.m`](MoCap/single_videos.m) function.
- The timestamps (which separate motions) are provided by the name of “flags” in V3D files (only for f and s rounds). Please notice that “flags30” can be used for video data and “flags120” can be used for mocap data. The reason for having two types of flags is that video data were recorded in 30 fps and mocap data were recorded in 120 fps.
- The body mesh is not provided in AMASS files by default. Please use [`amass_fk`](/MoCap/utils.py) function to augment AMASS data with the corresponding body mesh (vertices). (the details are explained in the [`tutorial_python.ipynb`](MoCap/tutorial_python.ipynb))

## Citation
Please cite the following paper if you use this code directly or indirectly in your research/projects:
```
@misc{ghorbani2020movi,
    title={MoVi: A Large Multipurpose Motion and Video Dataset},
    author={Saeed Ghorbani and Kimia Mahdaviani and Anne Thaler and Konrad Kording and Douglas James Cook and Gunnar Blohm and Nikolaus F. Troje},
    year={2020},
    eprint={2003.01888},
    archivePrefix={arXiv},
    primaryClass={cs.CV}
}
```
## License
Software Copyright License for non-commercial scientific research purposes. Before you download and/or use the Motion and Video (MoVi) dataset, please carefully read the terms and conditions stated on our [website](https://www.biomotionlab.ca/movi/) and in any accompanying documentation. If you are using the part of the dataset that was post-processed as part of [AMASS](https://amass.is.tue.mpg.de/en), you must follow all their [terms and conditions](https://amass.is.tue.mpg.de/license) as well. By downloading and/or using the data or the code (including downloading, cloning, installing, and any other use of this GitHub repository), you acknowledge that you have read these terms and conditions, understand them, and agree to be bound by them. If you do not agree with these terms and conditions, you must not download and/or use the MoVi dataset and any associated code and software. Any infringement of the terms of this agreement will automatically terminate your rights under this License.
 
 ## Contact
The code in this repository is developed by [Saeed Ghorbani](https://www.biomotionlab.ca/saeed-ghorbani/).

If you have any questions you can contact us at [saeed62@yorku.ca](mailto:saeed62@yorku.ca).
