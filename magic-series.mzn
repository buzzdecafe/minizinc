% magic series
% series problem: find a list of numbers s = [s_0, . . . , s_{n−1}] such 
% that s_i is the number of occurrences of i in s. An example is s = [1, 2, 1, 0].

int: n;
array[0..n-1] of var 0..n: s;

% higher-order constraints
constraint forall(i in 0..n-1) (
  s[i] = (sum(j in 0..n-1)(bool2int(s[j]=i))));

solve satisfy;

output [ "s = ", show(s), ";\n" ] ;
