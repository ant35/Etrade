function [ tau ,volatility ] = getVolatility( Sn,daysTrading )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

M = size(Sn,1);
Sn_1 = Sn(2:M,1);

%Create log returns
logret = log(Sn(1:M-1)./Sn_1);     
M=M-1;

%Calculate sample variance as estimate for volatility
sumU = sum(logret);
mu = (1/M)*sumU;
sumU2 = sum(logret.^2);

%Equivalent of sample variance (1/N-1)*sum((u-mu)^2)
s2 = (1/(M-1))*sumU2 - (1/(M*(M-1)))*mu^2;

tau = daysTrading/252;


%volatility is now calculated
volatility = s2/tau;
end

