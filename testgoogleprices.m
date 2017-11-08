start = 'Sep+25,2017';
stop = 'Oct+25,2017';
DS = googleprices('NASDAQ:SPY',start,stop);
disp(DS);
