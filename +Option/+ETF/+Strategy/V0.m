function [v0,vol,tree,optiontree] = V0(option,S0,impliedVol)
%V0 Returns fair price for option based on daily historic volatility.
%Optional argument implied volatility
%% Data range chosen based off maturity length of contract
format short g;
format compact;
import Stock.*;
import Option.* Option.ETF.Strategy.makeOptionTree;

daily = 252; %scaling factor for interest rate
t = option.maturity; %days until maturity
underlying = option.underlying;
%Grab stock prices from underlying
Sn = grabPrices(underlying,t);
%Get volatility (or use implied volatility if entered in args)
if nargin == 2
    vol = getVolatility(Sn,t);
else
    vol = impliedVol;
end

deltaT = 1 / daily; %set this #_intervals/interval_length
u = exp(sqrt(vol*deltaT));
d = exp(-1*sqrt(vol*deltaT));
r = 0.0235; %10-year treasury rate
K = option.strike; %strike price
%u and d are based on the derivations from Cox, Ross, and Rubinstein (1979)

market = r*deltaT;
interest = exp(market);

if d<interest && interest<u %no arbitrage conditions
    tree = makeTree(t,u,d,S0);
    optiontree = makeOptionTree(tree,d,interest,u,option);
    v0 = optiontree(1,t+1);
else
    error('arbitrage exists');
end
end

