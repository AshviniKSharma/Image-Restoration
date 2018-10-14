function imgfft = imgFFT1(img)
%calculate DFT of given image and output it

%conversion of image to double to handle decimal values
img=im2double(img);
%calculate # of rows and columns of image
[r c]=size(img);
%M,N for DFT of image
M=r;
N=c;
%calculate twiddle factor for M,N respectively
wM=exp(-2*pi*1i/M);
wN=exp(-2*pi*1i/N);
%formulating twiddle matrix for DFT calcluation
TM=zeros(M);
TN=zeros(N);
TM(1,:)=1;
TN(1,:)=1;
TN(:,1)=1;
TM(:,1)=1;
for r=2:M
TM(r,2:M)=wM.^(r-1:r-1:(M-1)*(r-1));
end
for r=2:N
TN(r,2:N)=wN.^(r-1:r-1:(N-1)*(r-1));
end

%calculate DFT
imgfft=TM*img*TN;
