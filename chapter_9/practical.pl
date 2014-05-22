% Write a predicate pptree/1 that takes a complex term representing a tree as
% its argument and prints the tree in a more readable form.


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

