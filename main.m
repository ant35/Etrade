import Option.*;
import Option.ETF.Strategy.Straddle.*;

c = CallOption(10,.5,7);
p = PutOption(10,.5,7);
s0 = 10;
Straddle(c,p,s0);
