% 1. Define a predicate nu/2 (”not unifiable”) which takes two terms as
% arguments and succeeds if the two terms do not unify. For example:

%           nu(foo,foo). 
%           no 
    
%           nu  (foo,blob). 
%           yes 
    
%           nu(foo,X). 
%           no

% You should define this predicate in three different ways:

% First (and easiest) write it with the help of = and \+ .
% Second write it with the help of = , but don’t use \+ .
% Third, write it using a cut-fail combination. Don’t use = and don’t use \+ .


nu1(X, Y) :-
  \+ X = Y.

nu2(X, Y) :-
  X \= Y.  

nu3(X,X) :- !,fail.
nu3(_,_).



% Define a predicate unifiable(List1,Term,List2) where List2 is the list of
% all members of List1 that unify with Term . The elements of List2 should not
% be instantiated by the unification. For example

%           unifiable([X,b,t(Y)],t(a),List]

% should yield

%           List  =  [X,t(Y)].

% Note that X and Y are still not instantiated. So the tricky part is: how do
% we check that they unify with t(a) without instantiating them?

% (Hint: consider using tests of the form \+  term1  =  term2 . Why? Think
% about it. You might also like to think about tests of the form
% \+  \+  term1  =  term2 .)

nu(X,X) :- !,fail.
nu(_,_).

unifiable([], _, []).
unifiable([Head|Tail], Term, [Head|List]) :-
  \+ nu(Head, Term),!,
  unifiable(Tail, Term, List).
unifiable([Head|Tail], Term, List) :-
  nu(Head, Term),
  unifiable(Tail, Term, List).