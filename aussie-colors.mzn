% Coloring the map of Australia

int: nc = 3;

var 1..nc: wa;  % Western Australia
var 1..nc: nt;  % Northern Territory?
var 1..nc: sa;  % South Australia
var 1..nc: q;   % Queensland
var 1..nc: nsw; % New South Wales
var 1..nc: v;   % Victoria?
var 1..nc: t;   % Tasmania

constraint wa  != nt;
constraint wa  != sa;
constraint nt  != sa;
constraint nt  != q;
constraint sa  != q;
constraint sa  != nsw;
constraint sa  != v;
constraint q   != nsw;
constraint nsw != v;

solve satisfy;

output [
  "wa=", show(wa),
  "\t nt=", show(nt),
  "\t sa=", show(sa),
  "\n q=", show(q),
  "\t nsw=", show(nsw),
  "\t v=", show(v),
  "\n t=", show(t),
  "\n"
];

