function [output] = butter2D(img,D0,n)
%apply Butterworth filtering on given image 
%Inputs:
%img: image in matrix form
%D0: radius in double form
%n: order in double form
%Output: butterworth filtered image

%for algrithms refer section 4.7.3 Digital image processing
%Gonzalez and Woods, 3rd edition.
%calculate # of columns and rows of image
[r,c]=size(img);
%pad image to make image appear in one corner 
padImg=img;
padImg(r:2*r,c:2*c)=zeros(r+1,c+1);
%convert padded image to double to handle decimal values
padImg=im2double(padImg);

%center image by multiplying it with (-1)^(x+y)
centerImg=zeros(2*r,2*c);
for i=1:2*r
    for j=1:2*r
        centerImg(i,j)=padImg(i,j)*(-1)^(i+j);
    end
end

%calculate DFT of centered image 
FcenterImg=imgFFT1(centerImg);

%formulation of Butterworth filter
D=zeros(2*r,2*c);
H=zeros(2*r,2*c);
for u=1:2*r
    for v=1:2*c
        D(u,v)=((u-r)^2+(v-c)^2)^0.5;
        H(u,v)=1/(1+(D(u,v)/D0)^(2*n));
    end
end

%applying Butterworth filter on transformed image
G=FcenterImg.*H;
%calculate inverseDFT of transformed image
g=inverseFFT1(G);
%recenter by multiplying again with (-1)^(x+y)
recenterImg=zeros(2*r,2*c);
for i=1:2*r
    for j=1:2*c
        recenterImg(i,j)=g(i,j)*(-1)^(i+j);
    end
end
%output absolute value(for visulaization)
output= abs(recenterImg(1:r,1:c));
