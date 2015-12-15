%Edge Detection using Sobel operator
clc;
clear all;
I=imread('sample3.jpg');
imshow(I);
G=rgb2gray(I);
[m n]=size(G);
imshow(G);
title('Original image');
G=double(G);
S=double(G);
  for i=2:m-1
      for j=2:n-1
        S(i,j)=0*G(i,j)-2*(G(i-1,j)-2*G(i-1,j-1)-2*G(i,j-1)+2*G(i+1,j)+2*G(i+1,j+1)+2*G(i,j+1)+0*G(i-1,j+1)+0*G(i+1,j-1));
            end
  end
  
  figure(2);
  imshow(S,[0 255]);
  title('Edge detection of image using sobel operator');

