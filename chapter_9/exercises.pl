% Exercise  9.3
% Write a two-place predicate termtype(Term,Type) that takes a term and gives
% back the type(s) of that term (atom, number, constant, variable, and so on).
% The types should be given back in the order of their generality. The
% predicate should behave in the following way.

% ?-  termtype(Vincent,variable). 
% yes 
% ?-  termtype(mia,X). 
% X  =  atom  ; 
% X  =  constant  ; 
% X  =  simple_term  ; 
% X  =  term  ; 
% no 
% ?-  termtype(dead(zed),X). 
% X  =  complex_term  ; 
% X  =  term  ; 
% no


termtype(Term, Type) :-
  integer(Term),
  Type = integer;

  float(Term),
  Type = float;

  number(Term),
  Type = number;

  atom(Term),
  Type = atom;
    
  atomic(Term),
  Type = constant;

  var(Term),
  Type = variable;

  simple_term(Term),
  Type = simple_term;

  complex_term(Term),
  Type = complex_term;

  term(Term),
  Type = term.

simple_term(Term) :-
  atomic(Term);
  var(Term).

complex_term(Term) :-
  functor(Term,_,Arrity),
  Arrity > 0.

term(Term) :-
  simple_term(Term);
  complex_term(Term).
