%bicubic after the image decomposition
function [ result ] = SR_Pulse_filter( img,up_scale)
%% Initialize
    lambda=0.8;
    [m,n,c]=size(img);
    if c>1
        img=rgb2ycbcr(img);
        I=img(:,:,1);
    else
        I=img;
    end
    result=imresize(img,[m*up_scale n*up_scale],'bicubic');
    I=double(I);
%% Image decomposition
    T_start=clock;
    I_s = decomposition_function(uint8(I),lambda,4,2);
    T_cost=etime(clock,T_start);
    fprintf('Image decomposition cost time: %.3f s\n', T_cost);
    I_s=double(I_s);% structural component
    I_t=double(I)-double(I_s);%textural component
    SR_I_s=imresize(I_s,[m*up_scale n*up_scale],'bicubic');
%% shock filter
    T_start=clock;
    dt=0.1; h=8;
    iter=50;
    sig2=20;  % sigma^2 of Gaussian conv. of second derivative 
    C=0.2;  % diffusion in level-sets direction
    SR_I_s=shock(SR_I_s,iter,dt,h,'alv',[C,sig2]);
    T_cost=etime(clock,T_start);
    fprintf('shock filter cost time: %.3f s\n', T_cost);
    SR_I_s=double(uint8(SR_I_s));
%% pulse filter
    T_start=clock;
    SR_I_t=pulse_filter(I_t,up_scale);
    T_cost=etime(clock,T_start);
    fprintf('texture filter cost time: %.3f s\n', T_cost);
    SR_I=SR_I_s+SR_I_t;
    result(:,:,1)=SR_I;
    if c>1
        result=ycbcr2rgb(result);
    end
end

