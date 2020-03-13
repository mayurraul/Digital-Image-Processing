#Created By- Mayur Raul
#enrollment Number- BT17ECE067

import numpy as np
import matplotlib.pyplot as plt
from scipy import signal
import cv2
 
original_image = cv2.imread('H:\\MATLAB 2019b\\MATLAB_ALL_Programs\\DIP Programs\\Lenna_test_image.png')

# Converting Original Image to Gray Scale Image
gray_image = cv2.cvtColor(original_image,cv2.COLOR_BGR2GRAY)

# Defining Kernel to be used for convolution 
# We choose a 5x5 matrix with each element value 1/(5x5) = -1/25 and middle element value 24/25 
kernel = (np.array([[1,1,1,1,1], [1,1,1,1,1], [1,1,1,1,1], [1,1,1,1,1], [1,1,1,1,1]]))/25
print('\nKernel :\n',kernel)

# Convolution of Image and the Kernel
lpf = signal.convolve2d(gray_image,kernel)

# Converting values obtained after convolution to integer values
lpf = np.array(lpf,dtype = np.uint8)

# Printing Size of original image and image after convolution
print('\nSize of Gray Scale Image : ',gray_image.shape)
print('Size of Image after Convolution : ',lpf.shape)

# Saving Low pass filtered image which is result of convolution
cv2.imwrite('lpf.png', hpf)
# Displaying LPF Image
cv2.imshow("lpf", lpf);

# Displaying Gray Scale Image
cv2.imwrite('gray_image.png',gray_image)
cv2.imshow('gray_image',gray_image)
cv2.waitKey();