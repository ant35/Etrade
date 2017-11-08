function [ Value ] = BlackScholes( option,vol,r)
%BLACKSCHOLES Returns Black-Scholes option value
import Probability.cdfn;
%Calculate T and grab option strike price
T= option.maturity/252;
K = option.strike;
Prem = option.premium;
%Calculate d1 and d2
d1 = (log(Prem/K)+(r+vol/2)*T)/(sqrt(vol*T));
d2 = d1-sqrt(vol*T);

%Make function handle for standard normal distribution
N = @(x) cdfn(x,0,1);

%Return BS value based on option type
if class(option) == "Option.CallOption"
    Value = Prem*N(d1) - K*exp(-1*r*T)*N(d2);
elseif class(option) == "Option.PutOption"
    Value = K*exp(-1*r*T)*N(-1*d2) - Prem*N(-1*d1);
else
    %Throw error if option arg is invalid
    error(['invalid input arg : ' class(option) ' please use CallOption or PutOption']);
end

end

