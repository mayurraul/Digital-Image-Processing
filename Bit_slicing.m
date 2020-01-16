%Bit Plane Slicing 
%created on: 09/01/2020
%created By: Mayur Raul

clc;
clear;
close all;

A= imread('Lenna_test_image.png');
I = rgb2gray(A);

[rows,columns] = size(I);

bit = zeros(rows, columns , 8);

for i=1:rows
    for j=1:columns
        k=0;
        num = I(i,j);
        while (num>0)
            k=k+1;
            bit(i,j,k) = uint8(num/2) - uint8((num-1)/2);
            num = uint8((num-1)/2);
        end
    end
end

out = 255*bit;
out = uint8(out);

figure;
set(gcf,'Position',get(0,'Screensize'));
subplot(2,4,1);
imshow(out(:,:,1));
title('bit plane 0');

subplot(2,4,2);
imshow(out(:,:,2));
title('bit plane 1');

subplot(2,4,3);
imshow(out(:,:,3));
title('bit plane 2');

subplot(2,4,4);
imshow(out(:,:,4));
title('bit plane 3');

subplot(2,4,5);
imshow(out(:,:,5));
title('bit plane 4');

subplot(2,4,6);
imshow(out(:,:,6));
title('bit plane 5');

subplot(2,4,7);
imshow(out(:,:,7));
title('bit plane 6');

subplot(2,4,8);
imshow(out(:,:,8));
title('bit plane 7');


figure(2);
imshow(I);
title('Original image');


recon = zeros(rows, columns);
for q=1:rows 
    for r=1:columns
        recon(q,r)= (2^7*bit(q,r,8)) + (2^6*bit(q,r,7)) + (2^5*bit(q,r,6)) + (2^4*bit(q,r,5));
    end
end

figure(3);
imshow(recon);
title('Compressed Image')