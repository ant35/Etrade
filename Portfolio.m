classdef Portfolio < handle
    %Portfolio This class represents a portfolio of assets and liabilities
    %   
    
    properties
        assets
        liabilities
        N
        PortfolioValue
    end
    
    methods
        function obj = Portfolio(asset_list)
            %default constructor
            if nargin == 1
                obj.assets = asset_list;
            end
            obj.N = size(asset_list,1);
        end
       
        %Puts security in portfolio
        function buy(obj,security_list)
            n = size(security_list,1);
            for i = 1:n
                obj.assets = [obj.assets;security_list(i,1)];
            end
            obj.N = obj.N + n;
        end
        
        %Takes security out of portfolio
        function sell(obj,security_list)
            number_of_securities = size(security_list,1);
            n = obj.N;
            for index=1:number_of_securities
                sec = security_list(index,1);
                for i=1:n
                    if isequal(obj.assets(i,1),sec)
                        if (i == 1)
                            obj.assets = obj.assets(2:n,1);
                            break;
                        elseif ( i < n)
                            obj.assets = [obj.assets(1:i-1,1);obj.assets(i+1:n,1)];
                            break;
                        else
                            obj.assets = obj.assets(1:n-1,1);
                            break;
                        end
                    end
                end
                n = n-1;
                obj.N = n;
            end
        end
        
        %Shows current assets in portfolio
        function showAssets(obj)
            for i = 1:obj.N
                disp(obj.assets(i,1));
            end
        end
        
    end
    
end

