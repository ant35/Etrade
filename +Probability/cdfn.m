function [ p ] = cdfn( X, m, sig2 )
%cdfn Returns cumulative distribution of X~N(m,sig2)
%   Detailed explanation goes here
pd = makedist('Normal',m, sig2);
p = cdf(pd,X);
end

