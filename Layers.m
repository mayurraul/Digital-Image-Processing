%RGB Layers seperation from the image 
%created on: 09/01/2020
%created By: Mayur Raul


clc;
clear;
close all;


I= imread('Lenna_test_image.png');
subplot(2,2,1);
imshow(uint8(I));
title('Original Image')

R=I;
R(:,:,[2 3])= 0;
subplot(2,2,2);
imshow(uint8(R));
title('RED layer Removed Image')

G=I;
G(:,:,[1 3])= 0;
subplot(2,2,3);
imshow(uint8(G));
title('GREEN layer Removed Image')

B=I;
B(:,:,[1 2]) = 0;
subplot(2,2,4);
imshow(uint8(B));

title('BLUE layer Removed Image')
