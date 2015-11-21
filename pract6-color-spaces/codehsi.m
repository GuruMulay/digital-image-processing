   clc;
   clear all;
   a=imread('sample.jpg');
   a=double(a);
   [m n k]=size(a);
   
   R=a(:,:,1);
   G=a(:,:,2);
   B=a(:,:,3);
   
   N=0.5*((R-G)+(R-B));
   D=sqrt((R-G).^2+(R-B).*(G-B));
   theta=acos(N./(D+eps));
   
   %Finding of hue
   for i=1:m
       for j=1:n
           if G(i,j)<B(i,j)
               H(i,j)=(2*pi)-theta(i,j);
           else
               H(i,j)=theta(i,j);
           end
       end
   end
   
   %Finding Saturation and Intensity
   N=min(min(R,G),B);
   D=R+G+B;
   D(D==0)=eps;
   S=1-(3.*N./D);
   I=(R+G+B)/3;
   
   figure(1);
   imshow(uint8(a));
   title('original image');
   figure(2);
   imagesc(H);
   title('Hue component');
   figure(3);
   imagesc(S);
   title('Saturation component');
   figure(4);
   imagesc(I);
   title('Intensity component');
