function Ig=gauss(I,ks,sigma2)

% Ig=gauss(I,ks,sigma2)
% ks - kernel size (odd number)
% sigma2 - variance of Gaussian

[Ny,Nx]=size(I);
hks=(ks-1)/2;  % half kernel size
if (Ny<ks)   % 1d convolutin
	x=(-hks:hks); 
	flt=exp(-(x.^2)/(2*sigma2));  % 1D gaussian
	flt=flt/sum(sum(flt));  % normalize
   % expand
   x0=mean(I(:,1:hks)); xn=mean(I(:,Nx-hks+1:Nx));
	eI=[x0*ones(Ny,ks) I xn*ones(Ny,ks)];
	Ig=conv(eI,flt);
	Ig=Ig(:,ks+hks+1:Nx+ks+hks);  % truncate tails of convolution   
else
   %% 2-d convolution
	x=ones(ks,1)*(-hks:hks); y=x'; 
	flt=exp(-(x.^2+y.^2)/(2*sigma2));  % 2D gaussian
	flt=flt/sum(sum(flt));  % normalize
   % expand
   if (hks>1)
      xL=mean(I(:,1:hks)')'; xR=mean(I(:,Nx-hks+1:Nx)')';
   else
      xL=I(:,1); xR=I(:,Nx);
   end
   eI=[xL*ones(1,hks) I xR*ones(1,hks)];
   if (hks>1)
      xU=mean(eI(1:hks,:)); xD=mean(eI(Ny-hks+1:Ny,:));  
   else
   	xU=eI(1,:); xD=eI(Ny,:);   
   end
	eI=[ones(hks,1)*xU; eI; ones(hks,1)*xD];
	Ig=conv2(eI,flt,'valid');
end


