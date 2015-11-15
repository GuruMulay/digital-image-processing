clc;
clear all;
I=imread('Blue hills.jpg');
imshow(I);
title('Original image');
G=rgb2gray(I);
imshow(G);
[m n]=size(G);

Gn=255-G;
figure(2);
imshow(Gn);
title('Negative image');

r1=input('Enter start of gray level');
r2=input('Enter end of gray level');
s1=input('Enter start of gray level');
s2=input('Enter end of gray level');

for i=1:m
    for j=1:n
        if(G(i,j)<=r1)
            Gs(i,j)=(s1/r1)*G(i,j);
        elseif (r1<G(i,j)<r2)
            Gs(i,j)=((s2-s1)/(r2-r1))*G(i,j)+s1;
        else
            Gs(i,j)=((255-s2)/(255-r2))*G(i,j)+s2;
        end
    end
end
figure(3);
imshow(Gs);
title('Contrast stretched image');

