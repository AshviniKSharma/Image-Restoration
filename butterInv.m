function [final] =butterInv(img,kernel,D0,n)
%%apply truncated inverse filtering on image
%%Inputs:
%img : image in matrix form
%kernel : kernel in matrix form
%D0: radius in double form
%order: order in double form
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
%calculate # of rows and columns of kernel
[a,b]=size(kernel);
%padding of kernel by zeros to make image and kernel size equal
kernel=padarray(kernel,[r-a,c-b],0,'post');
%nroamlize kernel to make it intensity invariant
kernel_norm=kernel/sum(sum(kernel));
%calculate DFT of kernel
fft_kernel=imgFFT1(kernel_norm);

%calculate DFT of R,G,B channel
fft_img1=imgFFT1(img1);
fft_img2=imgFFT1(img2);
fft_img3=imgFFT1(img3);

%apply inverse filtering to each channel
%then the inverse DFT is calulated and
%absolute value is taken to visualize the result
fft_inv1=fft_img1./fft_kernel;
inv1=inverseFFT1(fft_inv1);
inv1=abs(inv1);

fft_inv2=fft_img2./fft_kernel;
inv2=inverseFFT1(fft_inv2);
inv2=abs(inv2);

fft_inv3=fft_img3./fft_kernel;
inv3=inverseFFT1(fft_inv3);
inv3=abs(inv3);

%combining the filtered channels into single image
final=zeros(r,c,3);
%applying Butterworth filtering on each channel
final(:,:,1)=butter2D(inv1,D0,n);
final(:,:,2)=butter2D(inv2,D0,n);
final(:,:,3)=butter2D(inv3,D0,n);

