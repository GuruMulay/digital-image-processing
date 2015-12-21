clc;
clear all;
 
a=imread('sample.jpg');
G=rgb2gray(a);
imshow(a);
[m n]=size(G);
w1=1;
w2=[1 1;1 1];
w3=[1 1 1;1 1 1;1 1 1];
a1=G;
a2=G;
a3=G;
for i=2:m-1
    for j=2:n-1
        S1=w1*G(i,j);
        S2=[w2(1)*G(i,j) w2(2)*G(i,j+1) w2(3)*G(i+1,j) w2(4)*G(i+1,j+1)];
        S3=[w3(1)*G(i-1,j-1) w3(2)*G(i-1,j) w3(3)*G(i-1,j+1) w3(4)*G(i,j-1) w3(5)*G(i,j) w3(6)*G(i,j+1) w3(7)*G(i+1,j-1) w3(8)*G(i+1,j) w3(9)*G(i+1,j+1)];
        
a1(i,j)=min(S1);
a2(i,j)=min(S2);
a3(i,j)=min(S3);
    end
end
 a4=a1;
 a5=a2;
 a6=a3;
for i=2:m-1
    for j=2:n-1
        S1=w1*a1(i,j);
        S2=[w2(1)*a2(i,j) w2(2)*a2(i,j+1) w2(3)*a2(i+1,j) w2(4)*a2(i+1,j+1)];
        S3=[w3(1)*a3(i-1,j-1) w3(2)*a3(i-1,j) w3(3)*a3(i-1,j+1) w3(4)*a3(i,j-1) w3(5)*a3(i,j) w3(6)*a3(i,j+1) w3(7)*a3(i+1,j-1) w3(8)*a3(i+1,j) w3(9)*a3(i+1,j+1)];
a4(i,j)=min(S1);
a5(i,j)=min(S2);
a6(i,j)=min(S3);
    end
end
 
 a7=a4;
 a8=a5;
 a9=a6;
for i=2:m-1
    for j=2:n-1
        S1=w1*a4(i,j);
        S2=[w2(1)*a5(i,j) w2(2)*a5(i,j+1) w2(3)*a5(i+1,j) w2(4)*a5(i+1,j+1)];
        S3=[w3(1)*a6(i-1,j-1) w3(2)*a6(i-1,j) w3(3)*a6(i-1,j+1) w3(4)*a6(i,j-1) w3(5)*a6(i,j) w3(6)*a6(i,j+1) w3(7)*a6(i+1,j-1) w3(8)*a6(i+1,j) w3(9)*a6(i+1,j+1)];
a7(i,j)=max(S1);
a8(i,j)=max(S2);
a9(i,j)=max(S3);
    end
end
 
 
a10=a1-a7;
a11=a2-a8;
a12=a3-a9;
for i=2:m-2
    for j=2:n-2
        temp=[a10(i,j) a11(i,j) a12(i,j)];
        a13(i,j)=max(temp);
    end
end
figure(2);
imshow(a13);
title('skeleton of Original image');

