function [ tree ] = makeTree(days,u,d,S0)
%UNTITLED3 projects option n days into to the future
%   Detailed explanation goes here
%initialize matrix
tree = zeros(days+1,2*days+1);  
m = 1;
n = days+1;
tree(m,n)=S0;
%populate
for i = 1:days %each day is a new row
    for j=1:i %for the ith row shift i times to the right
        %disp(strcat("(",num2str(m),",",num2str(n),")"));
        %use log percent change to calculate heads and tails 
        up = u*tree(m,n);
        down = d*tree(m,n);
        tree(m+1,n+1) = up; %assign up value in tree
        tree(m+1,n-1) = down; %and down value
        n = n+2;
    end
    %reset pointers
    m = m + 1;
    n = days + 1 - i; %go 1 down and 1 to the left
end

%disp(transpose(tree));

end

