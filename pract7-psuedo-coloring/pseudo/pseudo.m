%To perform pseudo colouring of gray scale image
clc;
clear all;

%	Open the gray scale image file.
img=imread('gra.tiff');
[row col]=size(img);
 
%.	Set the gray scale.
%.	Display the original image.
figure(1);
imshow(img,[0 255]);

    
 
%	As per the gray levels, set the colours. Gray level to colour assignments are made   
%      according to the relation.F (x ,y) = Ck if F (x , y) belongs to Vk
%red=zeros(row,col);
%green=zeros(row,col);
%blue=zeros(row,col);
for i=1:row
    for j=1:col
        val=img(i,j);
        if(val<=50)
            red(i,j)=255;
            green(i,j)=0;
            blue(i,j)=0;
        elseif(val>50&&val<=100)
            red(i,j)=150;
            green(i,j)=150;
            blue(i,j)=0;
        elseif(val>100&&val<=150)
            red(i,j)=0;
            green(i,j)=255;
            blue(i,j)=0;
        elseif(val>150&&val<=200)
            red(i,j)=0;
            green(i,j)=0;
            blue(i,j)=255;
        elseif(val>200)
            red(i,j)=0;
            green(i,j)=0;
            blue(i,j)=0;
        end
    end
end

%	Display the pseudo coloured image.
img2=cat(3,red,blue,green);
figure(2);
imshow(img2);

%	One can also change the RGB values of the palette and obtain a coloured image.
