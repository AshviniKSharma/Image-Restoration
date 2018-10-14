function [final]= wienerFilter(img,kernel,K)

%%apply wiener filtering on image
%%Inputs:
%img : image in matrix form
%kernel : kernel in matrix form
%K :approximated constant ratio of 
%power spectral density of noise and original image
%Output: final filtered image

%imgFFT1: calculate DFT of given image
%inverseFFT1: calculate inverseDFT of given image
%make sure to load kernel before applying this technique

%convert image in double form to handle decimal values
img=im2double(img);
%seperation of R,G,B channels.
img1=img(:,:,1);
img2=img(:,:,2);
img3=img(:,:,3);
%calculate # of rows and columns in the image
[r,c]=size(img1);
%convert kernel to double form to handle decimal values
kernel=im2double(kernel);
%nroamlize kernel to make it intensity invariant
kernel_norm=kernel/sum(sum(kernel));
%calculate # of rows and columns of kernel
[a,b]=size(kernel_norm);
%padding of kernel by zeros to make image and kernel size equal
kernel_norm=padarray(kernel_norm,[800-a,800-b],0,'post');
%calculate DFT of kernel
fft_kernel=imgFFT1(kernel_norm);

%calculate DFT of R,G,B channel
fft_img1=imgFFT1(img1);
fft_img2=imgFFT1(img2);
fft_img3=imgFFT1(img3);
M=abs(fft_kernel).^2;

%apply wiener filtering to each channel DFTs
%for formula refer documentation
fft_inv1=(fft_img1.*conj(fft_kernel))./(M+K);
fft_inv2=(fft_img2.*conj(fft_kernel))./(M+K);
fft_inv3=(fft_img3.*conj(fft_kernel))./(M+K);

%the inverse DFT is calulated and
%absolute value is taken to visualize the result
inv1=inverseFFT1(fft_inv1);
inv1=abs(inv1);
inv2=inverseFFT1(fft_inv2);
inv2=abs(inv2);
inv3=inverseFFT1(fft_inv3);
inv3=abs(inv3);

%combining the filtered channels into single image
final=zeros(r,c,3);
final(:,:,1)=inv1;
final(:,:,2)=inv2;
final(:,:,3)=inv3;


