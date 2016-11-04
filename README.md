# Image-Decomposition
Implementation of Image Decomposition
## Table of Contents
0. [Introduction](#introduction)
0. [Models](#Models)
0. [Results](#Results)
##Introduction
Image decomposition is to split an image into two or more component images. An image f can be regarded as the sum of the structural image u (being piecewise smooth and with sharp edge along the contour) and the textural image v (only containing fine-scale details, usually with some oscillatory nature), i.e., f = u +v. Decomposition is important for many image-processing applications, e.g., image coding, texture discrimination, image denoising, image inpainting, and image registration. 
##Models
The TV-based method has been widely used in image structure-texture decomposition models. Different TV-based image decomposition models are considered and the model of minimizing TV with an L1-norm fidelity term is shown to achieve better results.
##Results
**Original Image**

![image](https://github.com/FanYang-PKU/Image-Decomposition/raw/master/image-folder/original.png)

**Structure Image**

![image](https://github.com/FanYang-PKU/Image-Decomposition/raw/master/image-folder/structure.png)

**Texture Image**

![image](https://github.com/FanYang-PKU/Image-Decomposition/raw/master/image-folder/texture.png)