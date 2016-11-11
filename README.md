# Image-Decomposition
Implementation of Image Decomposition
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

#Super-Resolution Based on Image Decomposition
In ICIP 2013, Sakurai et. al. published a paper called Super-Resolution Through Non-Linear Enhancement Filters. Here we re-implement their method and compare with our results. Our source code will be coming soon.

**Sakurai**

![image](https://github.com/FanYang-PKU/Image-Decomposition/raw/master/image-folder/figure4c.jpg)
![image](https://github.com/FanYang-PKU/Image-Decomposition/raw/master/image-folder/figure5c.jpg)

**Proposed**

![image](https://github.com/FanYang-PKU/Image-Decomposition/raw/master/image-folder/figure4f.jpg)
![image](https://github.com/FanYang-PKU/Image-Decomposition/raw/master/image-folder/figure5f.jpg)
