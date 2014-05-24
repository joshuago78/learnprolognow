% Exercise  11.3
% Write a predicate sigma/2 that takes an integer n > 0 and calculates the sum
% of all integers from 1 to n . For example:

%   ?-  sigma(3,X). 
%   X  =  6 
%   yes 
%   ?-  sigma(5,X). 
%   X  =  15 
%   yes
%
% Write the predicate so that results are stored in the database (there should
% never be more than one entry in the database for each value) and are reused
% whenever possible. For example, suppose we make the following query:

%   ?-  sigma(2,X). 
%   X  =  3 
%   yes 
%   ?-  listing. 
%   sigmares(2,3).
%
% Then, if we go on to ask

%   ?-  sigma(3,X).

% Prolog should not calculate everything new, but should get the result for
% sigma(2,3) from the database and only add 3 to that. It should then answer:

%   X  =  6 
%   yes 
%   ?-  listing. 
%   sigmares(2,3). 
%   sigmares(3,6).



:- dynamic sigmaval/2.

sigmaval(0,0).


sigma(Num, Sum) :-
  sigmaval(Num, Sum), !.
sigma(Num, Sum) :-
  Decr is Num - 1,
  sigmaval(Decr, DSum), !,
  Sum is DSum + Num,
  assert(sigmaval(Num, Sum)).
sigma(Num, Sum) :-
  sigmacalc(Num, Sum, 0),
  assert(sigmaval(Num, Sum)).


sigmacalc(0, Sum, Sum) :- !.
sigmacalc(Num, Sum, Temp) :-  
  NewTemp is Num + Temp,
  NewNum is Num - 1,
  sigmacalc(NewNum, Sum, NewTemp).
