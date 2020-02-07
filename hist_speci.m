%Bit Plane Slicing 
%created on: 09/01/2020
%created By: Mayur Raul

%A is the input image matrix
%T is the target image matrix to which A is to be mapped
%equilized_input is the histogram equalization of the input image 
%equilized_output is the histogram equalization of the output image

clc;
clear all;
close all;

A=[1 3 5 ; 4 4 3 ; 5 2 2 ];
len=9;

level=[0 1 2 3 4 5 6 7];

T = [0 0 0 0 2 2 4 1];
[rows,columns]=size(A);

J=zeros(1,len);

for ii = 1:7
    for jj = 1:9
        if A(jj) == level(ii)
            J(ii) = J(ii) + 1;
        end
    end
end
J = J(1:8);

cdf = zeros(1,8);
cdf(1) = J(1);
for ii = 2:8
    cdf(ii) = cdf(ii-1) + J(ii);
end

equalized_input = round(cdf*7./9);


cdft = zeros(1,8);
cdft(1) = T(1);
for ii = 2:8
    cdft(ii) = cdft(ii-1) + T(ii);
end

equilized_output = round(cdft*7./9);

map = zeros(1,8);
jj = 1;
for ii = 1:8
    for jj = 1:8
        if equalized_input(ii) <= equilized_output(jj)
            map(ii) = level(jj);
            break;
        end
	end
end

