% Exercise 6.1
% Let’s call a list doubled if it is made of two consecutive blocks of elements
% that are exactly the same. For example, [a,b,c,a,b,c] is doubled (it’s made
% up of [a,b,c] followed by [a,b,c] ) and so is [foo,gubble,foo,gubble] . On
% the other hand, [foo,gubble,foo] is not doubled. Write a predicate
% doubled(List) which succeeds when List is a doubled list.


dub(L1,L2) :-
  reverse(L1,L2).
dub([H1|T1], Acc) :-
  dub(T1, [H1|Acc]).

doubled(List) :-
  dub(List, []).


% Here's a second solution that doesn't use the reverse/2 built-in predicate

split(List, Pivot, Pivot, _, List).
split([Head|T1], Pivot, Acc, [Head|T2], Back):-
  Temp is Acc + 1,
  split(T1, Pivot, Temp, T2, Back).
  
doubled2(List) :-
  length(List, Length),
  0 is Length mod 2,
  Pivot is Length // 2,
  split(List, Pivot, 0, Half, Half).



% Exercise  6.2
% A palindrome is a word or phrase that spells the same forwards and backwards.
% For example, ‘rotator’, ‘eve’, and ‘nurses run’ are all palindromes. Write a
% predicate palindrome(List) , which checks whether List is a palindrome. For
% example, to the queries
%
%   ?-  palindrome([r,o,t,a,t,o,r]).
%
% and
%
%   ?-  palindrome([n,u,r,s,e,s,r,u,n]).
%
% Prolog should respond yes, but to the query
%
%   ?-  palindrome([n,o,t,h,i,s]).
%
% it should respond no.


palindrome(Letters) :-
  reverse(Letters, Letters).



% Exercise  6.3
% Write a predicate toptail(InList,OutList) which says no if InList is a list
% containing fewer than 2 elements, and which deletes the first and the last
% elements of InList and returns the result as OutList , when InList is a list
% containing at least 2 elements. For example:
%
%   toptail([a],T). 
%   no 
%    
%   toptail([a,b],T). 
%   T=[] 
%    
%   toptail([a,b,c],T). 
%   T=[b]
% (Hint: here’s where append/3 comes in useful.)


toptail2([_|T], Trimmed) :-
  reverse(T, [_|Rev]),
  reverse(Rev, Trimmed).



% Exercise  6.4
% Write a predicate last(List,X) which is true only when List is a list that
% contains at least one element and X is the last element of that list. Do
% this in two different ways:
%
% Define last/2 using the predicate rev/2 discussed in the text.
% Define last/2 using recursion.


accRev([H|T],A,R):-  
  accRev(T,[H|A],R). 
accRev([],A,A).

rev(L,R):-  
  accRev(L,[],R).


last_rev(List, X):-
  rev(List, [X|_]).


last_rec([X], X).
last_rec([_|T], X) :-
  last_rec(T, X).



% Exercise  6.5
% Write a predicate swapfl(List1,List2) which checks whether List1 is identical
% to List2 , except that the first and last elements are exchanged. Here’s
% where append/3 could come in useful again, but it is also possible to write a
% recursive definition without appealing to append/3 (or any other) predicates.

% easy solution

swapfl([A|MidA], [Z|MidZ]):-
  reverse(MidZ, [A|RevMidZ]),
  reverse(MidA, [Z|RevMidZ]).


% recursive solution

swapfl_help([Last|T1],[First|T2],First,Last):-
  length(T1,0),
  length(T2,0).
swapfl_help([Same|T1], [Same|T2], First, Last):-
  swapfl_help(T1,T2,First,Last).

swapfl_rec([First|T1], [Last|T2]):-
  swapfl_help(T1,T2,First,Last).



% Exercise  6.6
% Here is an exercise for those of you who like logic puzzles.
%
% There is a street with three neighbouring houses that all have a different
% colour, namely red, blue, and green. People of different nationalities live
% in the different houses and they all have a different pet. Here are some
% more facts about them:
%
% The Englishman lives in the red house.
%   - The jaguar is the pet of the Spanish family.
%   - The Japanese lives to the right of the snail keeper.
%   - The snail keeper lives to the left of the blue house.
%
% Who keeps the zebra? Don’t work it out for yourself: define a predicate
% zebra/1 that tells you the nationality of the owner of the zebra!
%
% (Hint: Think of a representation for the houses and the street. Code the
% four constraints in Prolog. You may find member/2 and sublist/2 useful.)


% The nextto/3 predicate only works for lists with non-repeating value (sets).
nextto(E2, [E2|_]).
nextto(E1, E2, [E1|T]) :-
  nextto(E2, T).
nextto(E1, E2, [_|T]) :-
  nextto(E1, E2, T).

zebra(ZebraOwner) :-
  length(Street, 3),
  member([english, red, _], Street),
  member([spanish, _, jaguar], Street),
  nextto([_,_,snail],[japanese,_,_], Street),
  nextto([_,_,snail],[_,blue,_], Street),
  member([ZebraOwner,_,zebra], Street),
  member([_,green,_], Street).


