clear all;
clc;
x=imread('cameraman.tif');
figure(1)
imshow(x);
n=input('Enter the masking size:-');
[a b]=size(x);
for i=((n-1)/2)+1:b-(n-1)/2
    for j=1+(n-1)/2:a-(n-1)/2
        new=[i-(n-1)/2:i+(n-1)/2;j-(n-1)/2:j+(n-1)/2];
        avg=sum(sum(new));
        new_smooth(i,j)=avg;
    end
end
figure(2)
imshow(new_smoothim);