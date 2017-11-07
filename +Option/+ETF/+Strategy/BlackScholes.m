function [ Value ] = BlackScholes( option,S0,vol,r)
%BLACKSCHOLES Returns Black-Scholes option value

%Calculate T and grab option strike price
T= option.t/252;
K = option.strike;

%Calculate d1 and d2
d1 = (log(S0/K)+(r+vol/2)*T)/(sqrt(vol*T));
d2 = d1-sqrt(vol*T);

%Make function handle for standard normal distribution
pd = makeDist('Normal',0,1);
N = @(x) cdf(pd,x);

%Return BS value based on option type
if class(option) == 'CallOption'
    Value = S0*N(d1) - K*exp(-1*r*T)*N(d2);
elseif class(option) == 'PutOption'
    Value = K*exp(-1*r*T)*N(-1*d2) - S0*N(-1*d1);
else
    %Throw error if option arg is invalid
    error(['invalid input arg : ' class(option) ' please use CallOption or PutOption']);
end

end

