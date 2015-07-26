% send + more = money
include "all_different.mzn";

var 1..9: S;
var 0..9: E;
var 0..9: N;
var 0..9: D;
int: M = 1;
var 0..9: O;
var 0..9: R;
var 0..9: Y;

%   SEND
% + MORE
% ------
%  MONEY

constraint 1000*S + 100*E + 10*N + D
         + 1000*M + 100*O + 10*R + E =
 10000*M + 1000*O + 100*N + 10*E + Y;
constraint all_different([S, E, N, D, M, O, R, Y]);

solve satisfy;

output [
  "    ", show(S), show(E), show(N), show(D),
  "  + ", show(M), show(O), show(R), show(E),
  "= ", show(M), show(O), show(N), show(E), show(Y)
];