% 1. The formal language Even is very simple: it consists of all strings
% containing an even number of a's, and nothing else. Note that the empty
% string ϵ belongs to Even. Write a DCG that generates Even.

even --> [].
even --> a, even, a.
a --> [a].



% 2. The formal language a^n b^2m c^2m d^n consists of all strings of the
% following form: an unbroken block of a's followed by an unbroken block of
% b's followed by an unbroken block of c's followed by an unbroken block of
% d's, such that the a and d blocks are exactly the same length, and the b and
% c blocks are also exactly the same length and furthermore consist of an even
% number of b's and c's respectively. For example, ϵ , abbccd , and
% aabbbbccccdd all belong to a^n b^2m c^2m d^n. Write a DCG that generates
% this language.


s2 --> [].
s2 --> left, inner, right.
s2 --> left, s2, right.
left --> [a].
right --> [d].
inner --> [].
inner --> inleft, inner, inright.
inleft --> [b,b].
inright --> [c,c].



% 3. The language that logicians call “propositional logic over the
% propositional symbols p , q , and r ” can be defined by the following
% context free grammar:
%
% prop  ->  p
% prop  ->  q
% prop  ->  r
% prop  -> Â¬  prop
% prop  -> (prop   ∧  prop)
% prop  -> (prop   ∨  prop)
% prop  -> (prop   →  prop)
% Write a DCG that generates this language. Actually, because we don’t know 
% about Prolog operators yet, you will have to make a few rather clumsy looking
% compromises. For example, instead of getting it to recognise
% 
% Â¬ (p   →  q)
% 
% you will have to get it recognise things like
% 
% [not,  ’(’,  p,  implies,  q,  ’)’]
% 
% instead. We will learn in Chapter  9 how to deal with propositional logic
% somewhat more naturally; in the meantime, write a DCG that accepts a clumsy
% looking version of this language. Use or for ∨ , and and for ∧ .



var --> [p].
var --> [q].
var --> [r].
conj --> [or].
conj --> [and].
conj --> [implies].
prop --> var.
prop --> [not], prop.
prop --> ['('], prop, conj, prop, [')'].
