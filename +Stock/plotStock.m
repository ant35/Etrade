function plotStock( ticker, days )
%plotStock plots historical prices of ticker in NASDAQ

import Stock.grabPrices;

ax = gca;
ax.XAxisLocation = 'origin';

y = grabPrices(ticker,days);
plot(y);
title([ticker ' over last ' num2str(days) ' days']);
xlabel('Day'); ylabel('Price');

end

