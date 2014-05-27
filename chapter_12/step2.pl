% Step 2

% In the practical session of Chapter  9 , you had to write a program for
% pretty printing parse trees onto the screen. Turn that into a module as well.

:- module(step2, [pptree/1]).

indent(Num) :-
  Size is Num * 3,
  tab(Size).

branch(Tree, ArgNum, Branch, Name, BranchArrity) :-
  arg(ArgNum, Tree, Branch),
  functor(Branch, Name, BranchArrity).

pptree(Tree) :-
  functor(Tree, Func, Arrity),
  write(Func), write('('), nl,
  ppbranch(Tree, 1, Arrity, 1).

ppbranch(Tree,Depth,X,X) :-
  branch(Tree, X, Branch, Name, BranchArrity),
  procbranch(Branch, Name, Depth, BranchArrity),
  Decr is Depth - 1,
  indent(Decr), write(')'), nl.
ppbranch(Tree, Depth, Arrity, Count) :-
  branch(Tree, Count, Branch, Name, BranchArrity),
  procbranch(Branch, Name, Depth, BranchArrity),
  Incr is Count + 1,
  ppbranch(Tree, Depth, Arrity, Incr).

procbranch(Branch, _, Depth, 1) :-
  indent(Depth), write(Branch), nl.
procbranch(Branch, Name, Depth, Arrity) :-
  indent(Depth), write(Name), write('('),nl,
  SubDepth is Depth + 1,
  ppbranch(Branch, SubDepth, Arrity, 1).