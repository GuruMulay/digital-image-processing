clc;
clear all;
I=imread('test.jpg');
imshow(I);
G=rgb2gray(I);
[m n]=size(G);
imshow(G);
title('Original image');
G=double(G);
S=double(G);
  for i=2:m-1
      for j=2:n-1
        S(i,j)=8.6*G(i,j)-(G(i-1,j)+G(i-1,j-1)+G(i,j-1)+G(i+1,j)+G(i+1,j+1)+G(i,j+1)+G(i-1,j+1)+G(i+1,j-1));
            end
        end
  S
  
  figure(2);
  imshow(S,[0 255]);
  title('High boost filtered image for 3*3 frame');
