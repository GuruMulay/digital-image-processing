     clc;
   clear all;
   a=imread('Original.jpg');
   a=double(a);
   [m n k]=size(a);
   
   R=a(:,:,1);
   G=a(:,:,2);
   B=a(:,:,3);
   
   Y=0.299.*R+0.587.*G+0.114.*B;
   I=0.596.*R-0.287.*G-0.321.*B;
   Q=0.212.*R-0.523.*G+0.311.*B;
   
   figure(1);
   imshow(uint8(a));
   title('original RGB image');
   figure(2);
   imagesc(Y);
   title('Luminance component');
   figure(3);
   imagesc(I);
   title('In-phase component');
   figure(4);
   imagesc(Q);
   title('Quadrature component');

[m n]=size(Y);
g=1:1:256;

h=zeros(1,256);
for i=1:m
    for j=1:n
        h(1,(Y(i,j)+1))=h(1,(Y(i,j)+1))+1;
    end
end

s(1)=h(1,1);
for i=2:256
    s(i)=s(i-1)+h(1,i);
end

for i=1:256
    f(i)=(s(i)*255)/(m*n);
    gn(i)=floor(f(i));
end

Gn=zeros(m,n);
for i=1:m
    for j=1:n
        for k=1:256
            if((Y(i,j)+1)==k)
                Yn(i,j)=gn(k);
            end
        end
    end
end


 
red=Yn*1+I*0.956+Q*0.621;
green=Yn*1+I*(-0.272)+Q*(-0.647);
blue=Yn*1+I*(-0.106)+Q*1.703;
G=cat(3,red,green,blue);
figure(5);
imshow(uint8(G));
title('Recovered RGB image');

