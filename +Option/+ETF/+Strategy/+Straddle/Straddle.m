function Straddle(call,put,stockPrice)
%This function tells you the initial capital required to buy a call
%and put. Displays graph of risk/reward structure, as well as current value
%of the option, based on historical volatility.

import Option.ETF.Strategy.Straddle.*;

%Get stats
[initCap,mySpread, currValue] = spread(call,put,stockPrice);

%Display stats
disp(['initial capital: ' num2str(initCap)]);
disp(['Out of money interval: (' num2str(mySpread(1,1)) ',' num2str(mySpread(1,2)) ')']);
disp(['Current value is ' num2str(currValue)]);

%Create x axis
xaxis = linspace(mySpread(1,1)-2,mySpread(1,2)+2,100);

%Create y axis for call and put value, then add them minus the initial
%capital.
yput = value(put,xaxis);
ycall = value(call,xaxis);
y = yput + ycall - initCap*100;

%Get point with current value
ycurr = value(put,stockPrice)+ value(call,stockPrice)-100*initCap;


hold on
%fix x-axis at origin
ax = gca;
ax.XAxisLocation = 'origin';

%plot graph
plot(stockPrice,ycurr,'*')
plot(xaxis,y);
hold off
end

