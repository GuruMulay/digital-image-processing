clc;
clear all;
I=imread('sample.jpg');
imshow(I);
G=rgb2gray(I);
imshow(G);
[m n]=size(G);

z=G(70,500);
g=1:1:256;

h=zeros(1,256);
for i=1:m
    for j=1:n
        h(1,(G(i,j)+1))=h(1,(G(i,j)+1))+1;
    end
end
figure(2);
stem(g,h);
xlabel('Gray Scale levels');
ylabel('Number of Pixels');
title('Histogram of image');
grid on;

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
            if((G(i,j)+1)==k)
                Gn(i,j)=gn(k);
            end
        end
    end
end

figure(3);
imshow(Gn);

he=zeros(1,256);
for i=1:m
    for j=1:n
        he(1,(Gn(i,j)+1))=he(1,(Gn(i,j)+1))+1;
    end
end

figure(4);
stem(g,he);
xlabel('Gray Scale levels');
ylabel('Number of Pixels');
title('Equalized Histogram of image');
grid on;

