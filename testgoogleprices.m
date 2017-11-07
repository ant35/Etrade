start = 'Sep+25,2017';
stop = 'Oct+25,2017';
DS = dataset2cell(googleprices('NASDAQ:AAPL',start,stop));
disp(DS);
