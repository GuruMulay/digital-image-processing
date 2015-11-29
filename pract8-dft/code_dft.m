clc;
clear all;
 
a=imread('ori.jpg');
a=rgb2gray(a);
[m n]=size(a);
b=zeros(m,n);
for x=1:8:m
    for y=1:8:m
        for p=0:7
            for q=0:7
                sum1=0;
                sum2=0;
                for u=0:7
                    for v=0:7
                        sum1=sum1+a(x+p,y+q)*cos(2*pi*(u*p+v*q)/64);
                        sum2=sum2+a(x+p,y+q)*cos(2*pi*(u*p+v*q)/64);
                    end
                end
                sum1=double(sum1);
                sum2=double(sum2);
                b(x+p,y+q)=sqrt(sum1*sum1+sum2*sum2)/(64);
            end
        end
    end
end
imshow(b);

