import Option.* Option.ETF.Strategy.*;
import Option.ETF.Strategy.Straddle.*;
import Stock.grabPrices Stock.plotStock;
warning('off','stats:dataset:ModifiedVarnames'); %supress warning

opt = PutOption(258,.47,10,'APRN');

initial = 258;
S0 = 258.67;
[v,vol,mytree,myoptiontree] = V0(opt,S0);
iv = getImpliedVolatility(opt,initial,0.0235);
disp(['Implied volatiliy: ' num2str(iv)]);
[~,iv,myimptree,myimpoptiontree] = V0(opt,S0,iv);
plotStock(opt.underlying,opt.maturity);