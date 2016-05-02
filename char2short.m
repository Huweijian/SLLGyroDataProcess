function [ out ] = char2short( l, h )
%CHAR2SHORT Summary of this function goes here
%   Detailed explanation goes here
   
	mid = 32768;
    out = l + h * (2^8);
    if(out > mid)
        out = - (2*mid - out);
    end  

end

