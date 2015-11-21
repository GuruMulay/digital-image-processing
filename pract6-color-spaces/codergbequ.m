   clc;
   clear all;
   a=imread('Water lilies.jpg');
   imshow(a);
   [m n]=size(a);
   n=n/3;
   
   R=a(:,:,1);
   G=a(:,:,2);
   B=a(:,:,3);

hr=zeros(1,256);
hg=zeros(1,256);
hb=zeros(1,256);
for i=1:m
    for j=1:n
        hr(1,(R(i,j)+1))=hr(1,(R(i,j)+1))+1;
        hg(1,(G(i,j)+1))=hg(1,(G(i,j)+1))+1;
        hb(1,(B(i,j)+1))=hb(1,(B(i,j)+1))+1;
    end
end

sr(1)=hr(1,1);
sg(1)=hg(1,1);
sb(1)=hb(1,1);
for i=2:256
    sr(i)=sr(i-1)+hr(1,i);
    sg(i)=sg(i-1)+hg(1,i);
    sb(i)=sb(i-1)+hb(1,i);
end

for i=1:256
    fr(i)=(sr(i)*255)/(m*n);
    gnr(i)=floor(fr(i));
    fg(i)=(sg(i)*255)/(m*n);
    gng(i)=floor(fg(i));
    fb(i)=(sb(i)*255)/(m*n);
    gnb(i)=floor(fb(i));
end

Gr=zeros(m,n);
Gg=zeros(m,n);
Gb=zeros(m,n);
for i=1:m
    for j=1:n
        for k=1:256
            if((R(i,j)+1)==k)
                Gr(i,j)=gnr(k);
            end
            if((G(i,j)+1)==k)
                Gg(i,j)=gng(k);
            end
            if((B(i,j)+1)==k)
                Gb(i,j)=gnb(k);
            end
        end
    end
end
Gr=uint8(Gr);
Gg=uint8(Gg);
Gb=uint8(Gb);
Gn=cat(3,Gr,Gg,Gb);
figure(2);
imshow(Gn);

