% kambiz.rahbar@gmail.com, 31 Jan 2020
%
% A New Directional Weighted Median Filter for Removal of Random-Valued Impulse Noise
% Yiqiu Dong, Shufang Xu
% Published in: IEEE Signal Processing Letters ( Volume: 14 , Issue: 3 , March 2007 )
% Page(s): 193 - 196
% Date of Publication: 20 February 2007 
% DOI: 10.1109/LSP.2006.884014

function [r,m] = detect_impulse_in_window(Window)
    Window = double(Window);
    % Window = [1  6 11 16 21
    %           2  7 12 17 22
    %           3  8 13 18 23
    %           4  9 14 19 24
    %           5 10 15 20 25];

    S(1,:) = Window([1 7 13 19 25]);     % eq(1)
    S(2,:) = Window([3 8 13 18 23]);     % eq(1)
    S(3,:) = Window([5 9 13 17 21]);     % eq(1)
    S(4,:) = Window([11 12 13 14 15]);   % eq(1)

    WindowCenter = Window(13);

    S0 = S.\WindowCenter;

    % Weight = [1 1 1 1 1
    %           1 2 2 2 2
    %           1 2 2 2 2
    %           1 2 2 2 2
    %           1 2 2 2 2];
    % 
    % W(1,:) = Weight([1 7 13 19 25]);
    % W(2,:) = Weight([3 8 13 18 23]);
    % W(3,:) = Weight([5 9 13 17 21]);
    % W(4,:) = Weight([11 12 13 14 15]);

    W = [1 2 2 2 2;
         1 2 2 2 2;
         1 2 2 2 1;
         1 2 2 2 2];                     % eq(3 & 4)

    dk = sum(W.*abs(S0-1),2);            % eq(2)
    [r, ~] = min(dk);                    % eq(5)
    [~, d] = min(std(S,0,2));            % eq(7)
    m = median(S(d,:).*S(d));            % eq(8)
end