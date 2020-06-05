import cv2
from PIL import Image
import array
import numpy as np
from numpy import *

leng=5
imag = cv2.imread("earth.jpg")
cv2.imshow("earth whwn it began",imag)
grap=cv2.cvtColor(imag, cv2.COLOR_BGR2GRAY)#converting the image to grayscale
cv2.imshow("earth after hiding",grap)#displaying the image
b= [ [ 0 for i in range(8) ] for j in range(leng) ]
j=0
i=0
while(j<leng*8):
    while(i<8):
       b[j][i]=grap[j,i]
       i+=1
    j+=1
    i=0
print("pixel values are:")
print(b) #pixel values of image selected
Bi= [ [ 0 for i in range(8) ] for j in range(leng*8) ]
j=0
i=7
k=0
while(j<leng):
   while(k<8):
       while(i>-1):
          if j>0:
              Bi[k+(8*j)][i]=b[j][k]%2
              b[j][k]=(b[j][k]-  Bi[k+(8*j)][i])//2
          else:
              Bi[k][i]=b[j][k]%2
              b[j][k]=(b[j][k]-  Bi[k][i])//2
          i-=1
       k+=1
       i=7
   j+=1
   k=0
#binary of pixel values
print(Bi)
