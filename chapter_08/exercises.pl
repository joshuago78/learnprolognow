% Exercise  8.1
% Here.s our basic DCG:
%
%   s  -->  np,vp. 
%    
%   np  -->  det,n. 
%    
%   vp  -->  v,np. 
%   vp  -->  v. 
%    
%   det  -->  [the]. 
%   det  -->  [a]. 
%    
%   n  -->  [woman]. 
%   n  -->  [man]. 
%   n  -->  [apple]. 
%   n  -->  [pear]. 
%    
%   v  -->  [eats].
% Suppose we add the noun "men" (which is plural) and the verb "know". Then we
% would want a DCG which says that "The men eat" is ok, "The man eats" is ok,
% "The men eats" is not ok, and "The man eat" is not ok. Change the DCG so that
% it correctly handles these sentences. Use an extra argument to cope with the
% singular/plural distinction.


s --> np(Agreement), vp(Agreement).

np(Agreement) --> det(Agreement), n(Agreement).
np(plural) --> n(plural).

vp(Agreement) --> v(Agreement), np(_).

det(_) --> [the].
det(singular) --> [a].

n(singular) --> [woman].
n(singular) --> [man].
n(singular) --> [apple].
n(singular) --> [pear].
n(plural) --> [men].

v(singular) --> [eats].
v(plural) --> [eat].




% Exercise  8.2
% In the text, we only gave examples of DCG rules with one extra argument, but
% in fact you can add as many extra arguments as you like. Here.s a DCG rule
% with three extra arguments:
%
%   kanga(V,R,Q)  -->  roo(V,R),jumps(Q,Q),{marsupial(V,R,Q)}.
%
% Translate it into the form Prolog uses.


kanga(V, R, Q, A, C) :-
  roo(V, R, A, B),
  jumps(Q, Q, B, C),
  marsupial(V,R,Q).


