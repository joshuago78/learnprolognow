% 1. Write a predicate pptree/1 that takes a complex term representing a tree as
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



% 2. Time to practice writing operator definitions. In the practical session
% of Chapter  7 , you were asked to write a DCG generating propositional
% logic formulas. The input you had to use was a bit awkward though. The
% formula Â¬ ( p → q ) had to be represented as [not,  ’(’,  p,  implies,  q,
%  ’)’] . Now that you know about operators, you can do things rather more
% neatly. Write operator definitions for not , and , or , and implies , so
% that Prolog accepts (and correctly brackets) propositional logic formulas.
% Use display/1 to check your code. It should yield the following kinds of
% response:
%
%   ?-  display(not(p  implies  q)). 
%   not(implies(p,q)). 
%    
%   yes 
%    
%   ?-  display(not  p  implies  q). 
%   implies(not(p),q) 
%    
%   yes


:- op(500, fx, not).
:- op(700, xfx, implies).
:- op(500, yfx, and).
:- op(500, yfx, or).
