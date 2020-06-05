%program to hide an image in another image,retrive it and displaying it using a plain image.

%image to be inserted
pic=imread('D:/space.png');
[row col pan]=size(pic);
r=pic(:,:,1);
a=zeros(8,8);
size(r)
for i=1:1:8
    for j=1:1:8
      a(i,j)= r(i,j);
    end
end
a%taking pixel values.The image has been trimmed here
B=zeros(8*8,8);
for i=1:1:8
for j=1:1:8
 for k=8:-1:1
     if i>1
          B(j+8*(i-1),k)=mod(a(i,j),2);
        a(i,j)=(a(i,j)-B(j+8*(i-1),k))/2; 
     elseif i==1
         B(j,k)=mod(a(i,j),2);
        a(i,j)=(a(i,j)-B(j,k))/2;
        
     end
 end
end
end
B;%binary of pixels


%carrier image
pic1=imread('D:/red.png');
r1=pic1(:,:,1);
a1=zeros(64,8);% here 64 is the no.of pixels in the image(row1*col1)
for i=1:1:64
    for j=1:1:8
      a1(i,j)= r1(i,j);
    end
end
a1 ;%taking pixel values of a small region of carrier
B1=zeros(64,8);
for i=1:1:64
for j=1:1:8
 for k=8:-1:1
     if i>1
          B1(j+8*(i-1),k)=mod(a1(i,j),2);
        a1(i,j)=(a1(i,j)-B1(j+8*(i-1),k))/2; 
     else
         B1(j,k)=mod(a1(i,j),2);
        a1(i,j)=(a1(i,j)-B1(j,k))/2;
        
     end
 end
end
end
B1;%their binary

%lsb changing begins
 for i=1:1:64
  for j=1:1:8
       if i>1
     B1((j+8*(i-1)),8)=B(i,j);
       else
     B1(j,8)=B(i,j);
       end
  end
  end
  D=zeros(64*8,8);
  D=B1;
  D ;%lsb changing
  
   d=zeros(1,64*8);
  temp=zeros(1,64*8);
  add=0;
   for i=1:1:64*8
  for j=8:-1:1
  add=add+(D(i,j)*2^(8-j));
  end
 temp(1,i)=add;
 add=0;
   end
    temp ;%convert back to decimal
    dummy=zeros(64,8);
    for i=1:1:64
        for j=1:1:8
            if i==1
            dummy(i,j)=temp(1,j);
            elseif i>1
             dummy(i,j)=temp(1,j+8*(i-1));
            end
        end
    end
    dummy %fitting into array of leng*8 size
    for j=1:1:64
    for i=1:1:8
         pic1(j,i,1)=dummy(j,i);
    end
    end
    subplot(3,1,2);
    imshow(pic1); %modified pic
    
    
    
    
    %retrieving begins
     r2=pic1(:,:,1);
a2=zeros(64,8);
for i=1:1:64
    for j=1:1:8
      a2(i,j)= r2(i,j);
    end
end
a2; %pixel values
B2=zeros(64*8,8);
for i=1:1:64
for j=1:1:8
 for k=8:-1:1
     if i==1
         B2(j,k)=mod(a2(i,j),2);
        a2(i,j)=(a2(i,j)-B2(j,k))/2;
     elseif i>1
          B2(8*(i-1)+j,k)=mod(a2(i,j),2);
        a2(i,j)=(a2(i,j)-B2(8*(i-1)+j,k))/2; 
     end
 end
end
end
B2;%binary values of pixels
d2=zeros(1,64*8);
for i=1:1:64*8
   
    d2(1,i)=B2(i,8);
    
end
d2;%ordering
 dummy1=zeros(64,8);
    for i=1:1:64
        for j=1:1:8
            if i==1
            dummy1(i,j)=d2(1,j);
            elseif i>1
             dummy1(i,j)=d2(1,j+8*(i-1));
            end
        end
    end
    dummy1;%fitting
    var=zeros(64,1);
    sum=0;
    for i=1:1:64
        for k=8:-1:1
            sum=sum+(dummy1(i,k)*2^(8-k));
        end
        var(i,1)=sum;
        sum=0;
    end
    var %convert back to decimal
    
    %displaying image
  pic3=imread('D:/white.png');
[row col pan]=size(pic3);
value=pic3(:,:,1);
    for i=1:1:8
for j=1:1:8
    if i==1
    pic3(i,j,1)=var(j,1);
    elseif i>1
        pic3(i,j,1)=var(8*(i-1)+j,1);
    end
end
    end
imshow(pic3);
