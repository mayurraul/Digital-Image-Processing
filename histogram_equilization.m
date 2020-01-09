%Histogram equilization 
%created on: 03/01/2020
%created By: Mayur Raul
clc;
close all;
clear;

len=256;
% reading the image & displaying the image that is to be processed
A= imread('Lenna_test_image.png');
subplot(4,2,1);
imshow(A);
title('Original Image')

% Converting the RGB image to Grayscale image & displaying the image
I= rgb2gray(A);
I=double(I);
subplot(4,2,3);
imshow(uint8(I));
title('Grayscale Image')
J= rgb2gray(A);

% taking the size of the image 
[rows, columns , no_Of_color_channel]=size(I);

% PLotting histogram of the image to be processed
hist_gray= zeros(1,len);

for i=1:rows
    for j=1:columns
        for k=0:255
          if I(i,j)==k
              hist_gray(k+1)= (hist_gray(k+1)+1);
          end
        end
    end
end

subplot(4,2,4);
plot(hist_gray);
title('Histogram of Grayscale image ')
 

% Equalization of image using inbuild functions

en=histeq(J);
subplot(4,2,5);
imshow(en);
title('Equalized Image using inbuild Function')

% Plotting Histogram of Equalized Image(using inbuild Function)

subplot(4,2,6);
imhist(en);
title('Histogram of Equalized Image(using inbuild Function)')


%calcuting the cumulative distribution function

cdf=zeros(1,len);
pdf=(1/(rows*columns))*hist_gray;
pdf(1)=cdf(1);

for i=2:len
    cdf(i)=cdf(i-1)+pdf(i);
end
cdf=round(cdf*(len-1));

% Equalization of the image without inbuild Function 

equi= zeros(size(I));
for i=1:rows
    for j= 1:columns
        t=(I(i,j)+1);
        equi(i,j)=cdf(t);
    end
end

subplot(4,2,7);
imshow(uint8(equi));
title('Equalized Image(without inbuild function)')


% Plotting the histogram of the Equalized image

hist_equi= zeros(1,len);
for i=1:rows
    for j=1:columns
        for k=0:255
            if equi(i,j) == k
                hist_equi(k+1)=hist_equi(k+1)+1;
            end 
        end
    end
end

subplot(4,2,8);
plot(hist_equi);
title('histogram of Equalized Image')
