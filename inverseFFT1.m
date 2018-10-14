function [img]= inverseFFT1(fftImg)  
%calcualate inverseDFT of given data/image

%calculate size of given image 
[r,c]=size(fftImg);
%M,N for inverseDFT
M=r;
N=c;

%twiddle factor calculation
wM=exp(-2*pi*1i/M);
wN=exp(-2*pi*1i/N);
%formuation of twiddle matrix
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

%calculate inverseDFT
img=(TM'*fftImg*TN')/(M*N);
