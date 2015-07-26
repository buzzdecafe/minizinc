% cakes with datafile
%
% A banana cake which takes 250g of self-raising flour, 2 mashed bananas, 75g sugar and 100g
% of butter, and a chocolate cake which takes 200g of self-raising flour, 75g of cocoa, 150g 
% sugar and 150g of butter. We can sell a chocolate cake for $4.50 and a banana cake for $4.00. 
% And we have 4kg self-raising flour, 6 bananas, 2kg of sugar, 500g of butter and 500g of cocoa.

int: flour;
int: banana;
int: sugar;
int: butter;
int: cocoa;

constraint assert(flour >=0, "Invalid datafile: " ++
  "Amount of flour is non-negative");
constraint assert(banana >=0, "Invalid datafile: " ++
  "Amount of banana is non-negative");
constraint assert(sugar >=0, "Invalid datafile: " ++
  "Amount of sugar is non-negative");
constraint assert(butter >=0, "Invalid datafile: " ++
  "Amount of butter is non-negative");
constraint assert(cocoa >=0, "Invalid datafile: " ++
  "Amount of cocoa is non-negative");

var 0..100: bCake; % no. of banana cakes
var 0..100: cCake; % no. of chocolate cakes

constraint 250 * bCake + 200 * cCake <= flour;
constraint 2 * bCake <= banana;
constraint 75 * bCake + 150 * cCake <= sugar;
constraint 100 * bCake + 150 * cCake <= butter;
constraint 75 * cCake <= cocoa;

% maximize profit
solve maximize 400 * bCake + 450 * cCake;

output [
  "Banana Cakes: ", show(bCake), "\n",
  "Chocolate Cakes: ", show(cCake), "\n"
];