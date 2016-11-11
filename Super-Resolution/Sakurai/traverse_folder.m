clear all;
src_dir = '..\data\src';
dst_dir='..\data\result';
image_num=26;
up_scale=3;
for i = 11 : image_num
    imagepath=sprintf('%03d.bmp',i);
    imagepath = fullfile( src_dir,imagepath);
    
    %% read ground truth image
    im  = imread(imagepath);
    result=SR_Pulse_filter(im,up_scale);
    imagepath=sprintf('%03d-Sakurai-x3.png',i);
    imagepath = fullfile( dst_dir,imagepath);
    imwrite(uint8(result),imagepath);
   
    clear im;
    clear result;
    %clear bicubic_image;
end