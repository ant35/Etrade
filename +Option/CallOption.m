classdef CallOption < Option.Option
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods
        %Constructor
        function obj = CallOption(k, p, t, under)
            obj.strike = k;
            obj.premium = p;
            obj.maturity = t;
            obj.underlying = under;
        end
    
    
    
    function v = value(obj,x)
            v = 100*max(x - obj.strike,0);
        end
    end
    
end

