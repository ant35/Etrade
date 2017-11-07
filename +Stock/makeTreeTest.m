days = 5;
d = 1/2;
r = 1/2;
u = 1.5;
S0 = 1;
K = .1;
p=1/3;
q=1-p;

tree = makeTree(days,p,q,r,u,d,S0);
disp(transpose(tree));
disp(" ");

optiontree = makeOptionTree(days,tree,d,r,u,K);
disp(transpose(optiontree));