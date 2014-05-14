% Exercise 5.2
%  1. Define a 2-place predicate increment that holds only when its second
%     argument is an integer one larger than its first argument. For example,
%     increment(4,5) should hold, but increment(4,6) should not.
%  2. Define a 3-place predicate sum that holds only when its third argument is
%     the sum of the first two arguments. For example, sum(4,5,9) should hold,
%     but sum(4,6,12) should not.


increment(X,Y) :-
  Y is X + 1.


sum(X,Y,Z) :-
  Z is X + Y.



% Exercise 5.3
% Write a predicate addone/2 whose first argument is a list of
% integers, and whose second argument is the list of integers obtained by
% adding 1 to each integer in the first list. For example, the query
%
%   ?-  addone([1,2,7,2],X).
%
%should give
%
%   X  =  [2,3,8,3].


addone([],[]).
addone([H1|T1], [H2|T2]) :-
  H2 is H1 + 1,
  addone(T1, T2).