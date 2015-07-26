% Laplace 
% A simple finite element model for modelling temperatures on a rectangular
% sheet of metal. We approximate the temperatures across the sheet by breaking the sheet into
% a finite number of elements in a 2 dimensional matrix.

int: w = 4;
int: h = 4;

array[0..w, 0..h] of var float: t; % temperature at point (i, j)

var float: left;
var float: right;
var float: top;
var float: bottom;

% Laplace equation: each internal temp. is average of its neighbours
constraint forall(i in 1..w-1, j in 1..h-1)(
  4.0 * t[i,j] = t[i-1, j] + t[i, j-1] + t[i+1, j] + t[i, j+1]);

% edge constraints
constraint forall(i in 1..w-1)(t[i, 0] = left);
constraint forall(i in 1..w-1)(t[i, h] = right);
constraint forall(j in 1..h-1)(t[0, j] = top);
constraint forall(j in 1..h-1)(t[w, j] = bottom);

% corner constraints
constraint t[0,0] = 0.0;
constraint t[w,0] = 0.0;
constraint t[0,h] = 0.0;
constraint t[w,h] = 0.0;

left = 0.0;
right = 0.0;
top = 100.0;
bottom = 0.0;

solve satisfy;

output [ show_float(6, 2, t[i,j]) ++ if j == h then "\n" else " " endif | i in 0..w, j in 0..h ];
