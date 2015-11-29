   clc;
   clear all;
   
   a=imread('sample.jpg');
   a=rgb2gray(a);
   [m n]=size(a);
   
   for i=1:m
       for j=1:n
           if 0<=a(i,j)&&a(i,j)<=50
               R(i,j)=0;
               G(i,j)=0;
               B(i,j)=0;
           else if 51<=a(i,j)&&a(i,j)<=100
               R(i,j)=255;
               G(i,j)=0;
               B(i,j)=0;
           else if 101<=a(i,j)&&a(i,j)<=150
               R(i,j)=0;
               G(i,j)=255;
               B(i,j)=0;
           else if 151<=a(i,j)&&a(i,j)<=200
               R(i,j)=0;
               G(i,j)=0;
               B(i,j)=255;
           else
               R(i,j)=255;
               G(i,j)=255;
               B(i,j)=255;
               end
               end
               end
           end
       end
   end
   b=cat(3,R,G,B);
   
   figure(1);
   imshow(a);
   title('original Gray image');
   figure(2);
   imshow(b);
   title('psuedo colored image');

