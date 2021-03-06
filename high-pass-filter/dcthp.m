clc;
clear all;
close all;

im=imread('C:\Documents and Settings\All Users\Documents\My Pictures\Sample Pictures\Sunset.jpg');
imgray=rgb2gray(im);
figure;imshow(imgray);
[m,n]=size(imgray); %size of image matrix 

%%computation of dct matrix

N=4;  %input('Enter the length of DCT matrix: ');
const=sqrt(2/N); 
for u=1:N
    for v=1:N
        if(u+v<=10)
            if u==1
            c(u,v)=1/sqrt(N); %forming 1st row of matrix C=1/sqrt(N)
            else
            a=2*(v-1);
            c(u,v)=const*cos((pi*(a+1)*(u-1))/(2*N)); %forming remaining rows of matrix C=sqrt(2/N)cos(pi(2v+1)u/2N)
            end
        elseif(u+v>10)
            c(u,v)=0;
        end
    end
end

%%calculating DCT by matrix multiplication method

nx=m/N;
ny=n/N;
imdct=zeros(m,n); %initialising dct transformed and idct matrix
imrev=zeros(m,n);
for i=1:nx
    for j=1:ny
        isx=(i-1)*N+1;  iex=i*N; %for i=1 & N=8 isx:iex=1:8 for i=2 isx:iex=9:16
        isy=(j-1)*N+1;  iey=j*N;
        immat=double(imgray(isx:iex, isy:iey)); %taking a N-by-N part of original iamge matrix
        immat=immat-128;
        iidct=c*immat*c'; %taking DCT transform F=CfC'
        iirev=c'*iidct*c; %taking IDCT f=C'FC
        iirev=iirev+128;
        imdct(isx:iex, isy:iey)=iidct; %allocating the calculated dct F matrix to form final image
        imrev(isx:iex, isy:iey)=iirev;
    end
end
figure;imshow(imdct);title('DCT of the image');
figure;imshow(uint8(imrev));title('image after IDCT');