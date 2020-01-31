% kambiz.rahbar@gmail.com, 31 Jan 2020

function [pad_a] = padding(a, pad_size, pad_type)

if strcmp(pad_type,'zero')
    pad_a = zeros(size(a)+2*pad_size);
    pad_a(1+pad_size:size(a,1)+pad_size,1+pad_size:size(a,2)+pad_size) = a;
elseif strcmp(pad_type,'extend')
 
    pad_a = a;
    for k = 1:4
        pad_a = [pad_a; repmat(pad_a(end,:),[pad_size,1])];
        pad_a = imrotate(pad_a, 90);
    end
end

