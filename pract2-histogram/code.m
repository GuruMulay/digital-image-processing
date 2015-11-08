%Program to calculate the Mean,Variance,Standard deviation and to plot the
%Histogram and Profile of any desired row or column of any image
clc;
clear all;
%Image read and RGB2GRAY conversion
a=imread('Blue hills.jpg');
imshow(a);
title('Original RGB image');
figure(2);
b=rgb2gray(a);
imshow(b);
title('Gray Scale image');
[m n]=size(b);
p=m*n;

%Calculating Mean
s=0;
for i=1:m
    for j=1:n
        bb=double(b(i,j));
        s=s+bb;
    end
end
mean=s/p

%Calculating Varince
s=0;
for i=1:m
    for j=1:n
        bb=double(b(i,j));
        s=s+(bb-mean)^2;
    end
end
variance=s/p

%Calculating Standard deviation
stddev=sqrt(double(variance))

%Calculating the Histogram matrix and plotting the Histogram
h=zeros(1,256);
for i=1:m
    for j=1:n
        h(1,(b(i,j)+1))=h(1,(b(i,j)+1))+1;
    end
end

g=1:1:256;
figure(3);
stem(g,h);
xlabel('Gray Scale levels');
ylabel('Number of Pixels');
title('Histogram of image');
grid on;

%Calculating and plotting the Profile for any column
r=input('Enter column no.:');
for i=1:m
    z(1,i)=b(i,r);
end
g=1:1:m;
figure(4);
stem(g,z);
xlabel('Pixel number in a column');
ylabel('Intensity of Pixel');
title('Profile of Column');


%Calculating and plotting the Profile for any row
r=input('Enter row no.:');
for i=1:n
    z(1,i)=b(r,i);
end
g=1:1:n;
figure(5);
stem(g,z);
xlabel('Pixel number in a row');
ylabel('Intensity of Pixel');
title('Profile of row');    




Output:

mean =

  119.9179


variance =

  5.1669e+003


stddev =

   71.8814

Enter column no.:100
Enter row no.:100
        
        

