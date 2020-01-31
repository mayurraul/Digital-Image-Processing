%Neighbourhood Operation 
%Created By:Mayur Raul
%Enroll.no:BT17ECE067
clc;
clear;
close all;
%Reading Original Image
A = imread('Lenna_test_image.png');
I = rgb2gray(A); 
[height,width]=size(I);%size of the image

%Padding Zeros
Pad = [zeros(height,1),I,zeros(height,1)];
Pad = [zeros(1,width+2);Pad;zeros(1,width+2)];

img_Neighbour = zeros(height,width);

for rows = 1:height
    for columns = 1:width
        c_rows = rows+1;
        c_columns = columns+1;
        c_pixel = Pad(c_rows,c_columns);
                
        n_pixel = 1*(c_pixel<Pad(c_rows,c_columns+1))+2*(c_pixel<Pad(c_rows-1,c_columns+1))+4*(c_pixel<Pad(c_rows-1,c_columns))+...
            8*(c_pixel<Pad(c_rows-1,c_columns-1))+16*(c_pixel<Pad(c_rows,c_columns-1))+32*(c_pixel<Pad(c_rows+1,c_columns-1))+...
            64*(c_pixel<Pad(c_rows+1,c_columns))+128*(c_pixel<Pad(c_rows+1,c_columns+1)); 
        img_Neighbour(rows,columns) = n_pixel;
    end
end
figure;
subplot(2,1,1);
imshow(A);
title('Original Image');
subplot(2,1,2);
imshow(uint8(img_Neighbour));
title('Neighbourhood Operation Image');