%% Initialize
src=imread('test.bmp');%test input image
lambda=0.8;
[m,n,c]=size(src);
if c>1
    src=rgb2ycbcr(src);
    I=src(:,:,1);
else
    I=src;
end
I=double(I);
%% Image decomposition
I_s = decomposition_function(uint8(I),lambda,4,2);
I_s=double(I_s);
I_t=double(I)-double(I_s);%textural component
imwrite(uint8(I_s),'structure.png','png');