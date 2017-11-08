function [ implied_volatility ] = getImpliedVolatility( option, current_price, r)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
import Option.ETF.Strategy.BlackScholes;
implied_volatility = 0;
tol = 0.01;
error = 1;
while(abs(error) > tol)
    implied_volatility = implied_volatility + 10;
    test = BlackScholes(option,implied_volatility, r);
    error = (current_price - test)/current_price;
%     disp(['test: ' num2str(test) ' s0: ' num2str(current_price) 'error: ' num2str(error)]);;
end

implied_volatility = implied_volatility/100;

