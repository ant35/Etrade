function [ p ] = cdfn( X, m, sig2 )
%UNTITLED2 Returns cumulative distribution of X~N(m,sig2)
%   Detailed explanation goes here
pd = makedist('Normal',m, sig2);
p = cdf(pd,X);
end

