%  Model for the 0/1 knapsack problem

int: n;
set of int: Items = 1..n;
int: capacity;

array[Items] of int: profits;
array[Items] of int: weights;

var set of Items: knapsack;

constraint sum(i in knapsack) (weights[i]) <= capacity;

solve maximize sum (i in Items) (bool2int(i in knapsack)*profits[i]) ;

output [show(knapsack),"\n"];
