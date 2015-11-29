 clc;
clear;
close all;
 
for i=0:7
    for j =0:7
        if(i==0)
            C(i+1,j+1) = 1/sqrt(8);
        else
            C(i+1,j+1) = sqrt(2/8) * cos(pi*(2*j+1)*i/16);
        end
    end
end
 
img = imread('ori.jpg');
img = rgb2gray(img);
figure(1);
imshow(img);
title('original Image');
img = double(img);
[m n] = size(img);
 
for i=1:8:m-7
    for j=1:8:n-7
        temp = img(i:i+7 , j:j+7);
        temp = (C * temp) * C';
        dctt(i:i+7 , j:j+7) = temp;
    end
end
figure(2);
imshow(dctt);
title('DCT of original image');
 
for i=1:8:m-7
    for j=1:8:n-7
        temp = dctt(i:i+7 , j:j+7);
        temp = (C' * temp) * C;
        img2(i:i+7 , j:j+7) = temp;
    end
end
figure(3);
imshow(img2,[]);
title('Reconstructed Image');
 
 

