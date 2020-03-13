% Watermarking of Image
% Created By : Mayur Raul


clc;
clear;
close all;


test_image = imread('Lenna_test_image.png');

test_image = imresize(test_image,[256 256]);

% Converting test image to grayscale
gray_test_image = rgb2gray(test_image);
figure('Name','Result')
subplot(131);
imshow(gray_test_image);
title('Original Image');

% Plotting MSB Bit Plane Image

% sign image
sign = imread('amb_sign.jpg');
sign_resize = imresize(sign,[256 256]);
gray_sign = rgb2gray(sign_resize);

% Getting MSB bit of each pixel of sign
msb_bit_sign = bitget(gray_sign, 8);

% Plotting image of sign
subplot(132);
imshow(logical(msb_bit_sign));
title('Sign');

% Image of 7 bits except LSB of Original Image

[rows cols] = size(gray_test_image);
watermark_image = zeros(rows,cols);

for ii = 1:rows
    for jj = 1:cols
        % Getting seven bits except lsb
        temp = bitget(gray_test_image(ii,jj), 2:1:8);
        
        pixel_value_bin = zeros(1,8);
        
        % MSB bit as the pixel value of Sign
        pixel_value_bin(8) = msb_bit_sign(ii,jj);
        
        % Next 7 bits as the pixel values of Image whose 7 bits are taken
        for ll = 2:8
            pixel_value_bin(ll-1) = temp(ll-1);
        end
        
        % Converting final pixel value to decimal value
        pixel_value_dec = bi2de(pixel_value_bin);
        % Storing these values
        watermark_image(ii,jj) = pixel_value_dec;
    end
end

subplot(133);
imshow(uint8(watermark_image));
title('Watermarked Image');