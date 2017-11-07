function [ optiontree ] = makeOptionTree(n,tree,d,r,u,option)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

optiontree = tree;
shifts = n;
top = 2;
K = option.K;
bottom = 1;
topRow = n;
bottomRow = n+1;
ptilda = (r-d)/(u-d);
qtilda = 1 - ptilda;
discount = 1/r;
for i = 1 : n
    for j = 1:shifts
        %Start at bottom left node of tree
        %shift to neighbor nodes and calculate European value
        %for root
        
        root = optiontree(topRow,top+2*(j-1));
        down = optiontree(bottomRow,bottom + 2*(j-1));
        up = optiontree(bottomRow,bottom + 2*j);
        %Calculate intrinsic value only for first iteration
        if i == 1
            %use intrinsic value as base case for further calculation (last row of tree)            
              ev1 = value(option,down);
              ev2 = value(option,up);
        else
            %to recurse up the tree, first calculate the european value
            %for the american option
            ev1 = down; %left
            ev2 = up;%right
            
        end
        %This is the discounted price under risk neutral measure P-tilda
        %The left node is Tails and the right is Heads
        ev = discount*(qtilda*ev1+ptilda*ev2);
        
        %Now compare the european value with the intrinsic value
        iv = value(option,root);
        %disp(['intrinsic value: ' num2str(iv) ' vs european value ' num2str(ev)]);
        v = max(ev,iv);
        optiontree(topRow,top+2*(j-1)) = v;
        
        
        %The value of the root node is the max of european value
        %and intrinsic value.
        
        %disp(discount*(qtilda*v1+ptilda*v2));
    end
    %move row pointers up,
    %column pointers, top and bottom, to the right by 1
    %and reduce shifts by 1
    topRow = topRow-1;
    bottomRow = bottomRow -1;
    top = top + 1;
    bottom = bottom + 1;
    shifts = shifts-1;
end
%Fill in the bottom row
shifts = 2*n+1;
row = n+1;
for i=1:2:shifts
    optiontree(row,i) = value(optiontree(row,i),K,type);
end

