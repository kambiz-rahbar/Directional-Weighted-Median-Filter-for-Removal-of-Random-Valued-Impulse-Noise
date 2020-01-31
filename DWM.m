% kambiz.rahbar@gmail.com, 31 Jan 2020
%
% A New Directional Weighted Median Filter for Removal of Random-Valued Impulse Noise
% Yiqiu Dong, Shufang Xu
% Published in: IEEE Signal Processing Letters ( Volume: 14 , Issue: 3 , March 2007 )
% Page(s): 193 - 196
% Date of Publication: 20 February 2007 
% DOI: 10.1109/LSP.2006.884014

function [denoised_img] = DWM(img, T, N_max)
    denoised_img = img;
    for itr = 1:N_max
        [alpha,m] = detect_impulse_in_img(denoised_img,T);
        fprintf('iteration: %2d. number of impulsed noise detected (for T = %3.2f): %d\n', itr, T, sum(alpha(:)==1));
        denoised_img = alpha.*m + (1-alpha).*double(denoised_img); % eq(9)
        denoised_img = uint8(denoised_img);
        T = T * 0.8;                    % eq(11)
    end
end

