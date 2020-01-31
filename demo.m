% kambiz.rahbar@gmail.com, 31 Jan 2020
%
% A New Directional Weighted Median Filter for Removal of Random-Valued Impulse Noise
% Yiqiu Dong, Shufang Xu
% Published in: IEEE Signal Processing Letters ( Volume: 14 , Issue: 3 , March 2007 )
% Page(s): 193 - 196
% Date of Publication: 20 February 2007 
% DOI: 10.1109/LSP.2006.884014

clc
clear
close all

img = imread('cameraman.tif');
if size(img,3)>1
    img = rgb2gray(img);
end

img = imnoise(img,'salt & pepper',0.01);

T = 80;
N_max = 5;
[denoised_img] = DWM(img, T, N_max);

figure(1);
subplot(1,3,1); imshow(img); title('image with impulse noise');
subplot(1,3,2); imshow(denoised_img); title('filtered image');
subplot(1,3,3); imshow(abs(img-denoised_img),[]); title('diff image');

% EOF
   