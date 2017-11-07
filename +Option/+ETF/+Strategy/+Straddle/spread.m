function [ initialCapital, mySpread, currentValue ] = spread( c, p , S0)
%UNTITLED4 Returns interval between which a bought call and put make money.
%   c is CallOption and p is PutOption
%import Option.*;
%Breakeven lies on bounds
UB = c.strike + (c.premium + p.premium);
LB = p.strike - (c.premium + p.premium);

initialCapital = c.premium + p.premium;

mySpread = [LB, UB];
currentValue = value(c,S0) + value(p,S0) - 100*initialCapital;
end

