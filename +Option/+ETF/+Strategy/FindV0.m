format short g;
format compact;

monthly = 12;
weekly = monthly*4; %set to adjust interest rate
daily = weekly*5.25;
t = 14; %days until maturity
%Grab stock prices
Sn = AAPL(:,5);
%Get volatility
vol = getVolatility(Sn,t);

S0 = 166.89;
deltaT = 1 / weekly; %set this #_intervals/interval_length
u = exp(sqrt(vol*deltaT));
d = exp(-1*sqrt(vol*deltaT));
r = 0.0235; %10-year treasury rate
K = 167.5; %strike price
%u and d are based on the derivations from Cox, Ross, and Rubinstein (1979)
premium = 4.35;
c = CallOption(K,premium,t);
iterations = 2; %weeks
market = r*deltaT;
interest = exp(market);
optionType = 'call';

disp(strcat("d:",num2str(d),",e^(1+r)/freq:",num2str(interest),", u:",num2str(u)));
if d<interest && interest<u
    tree = makeTree(iterations,u,d,S0);
    optiontree = makeOptionTree(iterations,tree,d,interest,u,K,optionType,weekly);
    %display trees
    disp('Projected stock path: ');disp(transpose(tree));disp("------");
    disp(["Binomial Option Model: S0: " S0 "Strike: " K ]);disp(transpose(optiontree));
else
    error("arbitrage exists");
end

