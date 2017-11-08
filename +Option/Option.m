classdef Option
    %UNTITLED2 Basic option definition with strike, premium and maturity
    %   Detailed explanation goes here
    
    properties
        strike
        premium
        maturity
        underlying
        underlying_tree
        option_tree
    end
    
    methods
        function obj = Option()
            %default constructor
        end
    
         
        %Should only be set if the option is bought. Keeps track of
        %which path the option has taken
        function [obj] = set.underlying_tree(obj,tree)
            obj.underlying_tree = tree;
        end
        
        function [obj] = set.option_tree(obj,tree)
            obj.option_tree = tree;
        end
    
    end

end

