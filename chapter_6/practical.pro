% 1. It is possible to write a one line definition of the member predicate by
% making use of append/3 . Do so. How does this new version of member compare
% in efficiency with the standard one?

member1(X, List) :-
  append(_,[X|_], List).



% 2. Write a predicate set(InList,OutList) which takes as input an arbitrary
% list, and returns a list in which each element of the input list appears
% only once. For example, the query
%    
%   set([2,2,foo,1,foo,  [],[]],X).
%
% should yield the result
%    
%   X  =  [2,foo,1,[]].
%
% (Hint: use the member predicate to test for repetitions of items you have
% already found.)


set([],Set,Set).
set([H|T], Set, Result) :-
  \+ member(H, Set),
  set(T, [H|Set], Result).
set([H|T], Set, Result) :-
  member(H, Set),
  set(T, Set, Result).

set(List, Set) :-
  set(List, [], RevSet),
  reverse(RevSet, Set).



% 3. We ‘flatten’ a list by removing all the square brackets around any lists
% it contains as elements, and around any lists that its elements contain as
% elements, and so on, for all nested lists. For example, when we flatten the
% list
%
%   [a,b,[c,d],[[1,2]],foo]
%
% we get the list
%
%   [a,b,c,d,1,2,foo]
%
% and when we flatten the list
%
%   [a,b,[[[[[[[c,d]]]]]]],[[1,2]],foo,[]]
%
% we also get
%
%   [a,b,c,d,1,2,foo].
%
% Write a predicate flatten(List,Flat) that holds when the first argument List
% flattens to the second argument Flat . This should be done without making
% use of append/3 .

islist(X) :-
  length(X, _).

flat_help([], Acc, Acc).
flat_help([H|T], Acc, Flat) :-
  \+ islist(H),
  flat_help(T, [H|Acc], Flat).
flat_help([H|T], Acc, Flat) :-
  islist(H),
  flat_help(H, Acc, NewAcc),
  flat_help(T, NewAcc, Flat).

flat(List, Flat) :-
  flat_help(List, [], RevFlat),
  reverse(RevFlat, Flat).
