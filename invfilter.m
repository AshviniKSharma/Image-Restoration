%%function to perform inverse filtering on image.
function [final] =invfilter(img,kernel)
%%require two inputs
%img : image in matrix form
%kernel: kernel in matrix form
% output: final inverse filtered image

%imgFFT1: calculate DFT of given image
%inverseFFT1: calculate inverseDFT of given image
%make sure to load kernel as .mat file before running the code.

%conversion of image to double to handle decimal value
img=im2double(img);
%seperating channels of image
img1=img(:,:,1);
img2=img(:,:,2);
img3=img(:,:,3);
%finding # of rows and columns in image
[r,c]=size(img1);
%conversion of kernel to double to handle decimal values
kernel=im2double(kernel);
%finding number of rows and columns of kernel
[a,b]=size(kernel);
%padding of kernel by zeros to make image and kernel size equal
%this is done for DFT computation
kernel=padarray(kernel,[r-a,r-b],0,'post');
%normalizing kernel to make it intensity invariant
kernel_norm=kernel/sum(sum(kernel));
%calculating DFT of kernel
fft_kernel=imgFFT1(kernel_norm);
%calculate DFT of RED channel
fft_img1=imgFFT1(img1);
%applying inverse filtering
fft_inv1=fft_img1./fft_kernel;
%calculating inverseDFT of fitered output
inv1=inverseFFT1(fft_inv1);
inv1=abs(inv1);
%calculating DFT of GREEN channel
fft_img2=imgFFT1(img2);
%applying inverse filtering technique
fft_inv2=fft_img2./fft_kernel;
%calcuating inverseDFT of filtered output
inv2=inverseFFT1(fft_inv2);
inv2=abs(inv2);
%calculate DFT of Blue channel
fft_img3=imgFFT1(img3);
%applying inverse filtering
fft_inv3=fft_img3./fft_kernel;
%taking inversDFT of flitered output
inv3=inverseFFT1(fft_inv3);
inv3=abs(inv3);
%combining the filtered R,G,B channel into single image.
final=zeros(r,c,3);
final(:,:,1)=inv1;
final(:,:,2)=inv2;
final(:,:,3)=inv3;