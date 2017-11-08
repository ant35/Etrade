classdef PutOption < Option.Option
    %Class PutOption: Defines a put option with strike k and premium p.
    
    properties
    end
    
    methods
        %Constructor
        function obj = PutOption(k,p,t, under)
            obj.strike = k;
            obj.premium = p;
            obj.maturity = t;
            obj.underlying = under;
        end
        
        function v = value(p,x)
            v = 100*max( p.strike - x,0);
        end
    end

end

