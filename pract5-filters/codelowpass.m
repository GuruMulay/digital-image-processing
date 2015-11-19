clc;
clear all;
I=imread('test.jpg');
imshow(I);
G=rgb2gray(I);
[m n]=size(G);
imshow(G);
title('O');
S=double(G);
a=input('Enter the size of the averaging filter a*a:');
  x=zeros(m,n);
  for i=(1+floor(a/2)):(m-floor(a/2))
      for j=(1+floor(a/2)):(n-floor(a/2))
        for f=i-floor(a/2):1:i+floor(a/2)
            for g=(j-floor(a/2)):1:(j+floor(a/2))
                x(i,j)=x(i,j)+G(f,g);
            end
        end
        x(i,j)=(x(i,j)/(a*a));
        S(i,j)=x(i,j);
      end
  end
  
  figure(2);
  imshow(S,[0 255]);