% Exercise 2.4 Here are six Italian words:
% 
% astante , astoria , baratto , cobalto , pistola , statale .
% 
% They are to be arranged, crossword puzzle fashion, in the following grid:
% 
% (see grid at http://www.learnprolognow.org/lpnpage.php?pagetype=html&pageid=lpn-htmlse7)
% 
% The following knowledge base represents a lexicon containing these words:
% 
%    word(astante,  a,s,t,a,n,t,e). 
%    word(astoria,  a,s,t,o,r,i,a). 
%    word(baratto,  b,a,r,a,t,t,o). 
%    word(cobalto,  c,o,b,a,l,t,o). 
%    word(pistola,  p,i,s,t,o,l,a). 
%    word(statale,  s,t,a,t,a,l,e).
% 
% Write a predicate crossword/6 that tells us how to fill in the grid. The first three arguments should be the vertical words from left to right, and the last three arguments the horizontal words from top to bottom.


word(astante,  a,s,t,a,n,t,e). 
word(astoria,  a,s,t,o,r,i,a). 
word(baratto,  b,a,r,a,t,t,o). 
word(cobalto,  c,o,b,a,l,t,o). 
word(pistola,  p,i,s,t,o,l,a). 
word(statale,  s,t,a,t,a,l,e).


crossword(H1, H2, H3, V1, V2, V3) :-
  word(H1, _,TopLeft,_,TopMid,_,TopRight,_),
  word(H2, _,MidLeft,_,Center,_,MidRight,_),
  word(H3, _,BottomLeft,_,BottomMid,_,BottomRight,_),
  word(V1, _,TopLeft,_,MidLeft,_,BottomLeft,_),
  word(V2, _,TopMid,_,Center,_,BottomMid,_),
  word(V3, _,TopRight,_,MidRight,_,BottomRight,_).

% Note that the above code is not perfect as it does not tell prolog that it cannot use the same word twice. Thus you will get multiple solutions. As the tutorial had not specified how to do such, I assume this is the solution they were looking for. After learning more about list processing and negation in later chapters I came back and redid this exercise. Below is the improved code. It actually has two answers; the second is just the quarter-clockwise rotation of the first.

allUnique([_]).
allUnique([Head|Tail]) :-
  \+ member(Head, Tail),
  allUnique(Tail).

crossword2(H1, H2, H3, V1, V2, V3) :-
  word(H1, _,TopLeft,_,TopMid,_,TopRight,_),
  word(H2, _,MidLeft,_,Center,_,MidRight,_),
  word(H3, _,BottomLeft,_,BottomMid,_,BottomRight,_),
  word(V1, _,TopLeft,_,MidLeft,_,BottomLeft,_),
  word(V2, _,TopMid,_,Center,_,BottomMid,_),
  word(V3, _,TopRight,_,MidRight,_,BottomRight,_),
  allUnique([H1, H2, H3, V1, V2, V3]).