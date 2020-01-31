% kambiz.rahbar@gmail.com, 31 Jan 2020
%
% A New Directional Weighted Median Filter for Removal of Random-Valued Impulse Noise
% Yiqiu Dong, Shufang Xu
% Published in: IEEE Signal Processing Letters ( Volume: 14 , Issue: 3 , March 2007 )
% Page(s): 193 - 196
% Date of Publication: 20 February 2007 
% DOI: 10.1109/LSP.2006.884014

function [alpha,m] = detect_impulse_in_img(img,T)
    pad = 2;
    pad_img = padding(img, pad, 'extend');

    r = zeros(size(img));
    m = zeros(size(img));
    for x = 1+pad:size(pad_img,1)-pad
        for y = 1+pad:size(pad_img,2)-pad
            Window = pad_img(x-2:x+2,y-2:y+2);
            [r(x-pad,y-pad),m(x-pad,y-pad)] = detect_impulse_in_window(Window);
        end
    end

    % T = max(50, std(double(img(:))));
    
    alpha = r>T;                         % eq(6 & 10)
end

