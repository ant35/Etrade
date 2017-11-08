function [ prices ] = grabPrices( ticker, days)
%UNTITLED Grabs historical closing prices as far back as you specify.
%   max range one year, only takes stocks traded in NASDAQ
import Stock.googleprices;
start = 'Sep+25,2017'; %filler dates, do not function correctly
stop = 'Oct+25,2017';
DS = googleprices(['NASDAQ:' ticker],start,stop);

prices = zeros(days,1);
for i=0:days-1
    prices(days - i,1) = DS(i+1,5); %5th column is closing prices
end



end

