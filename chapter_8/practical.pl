% 1. First, bring together all the things we have learned about DCGs for
% English into one DCG. In particular, in the text we saw how to use extra
% arguments to deal with the subject/object distinction, and in the exercises
% you were asked to use additional arguments to deal with the singular/plural
% distinction. Write a DCG which handles both. Moreover, write the DCG in such
% a way that it will produce parse trees, and makes use of a separate lexicon.

s --> np(subject, GramNum),vp(GramNum).

np(_, Gnum)  -->  det(Gnum),n(Gnum). 
np(X, Gnum) --> [Word],{lex(Word,pro(X),Gnum)}.

vp(Gnum)  -->  v(Gnum),np(object,_). 
vp(Gnum)  -->  v(Gnum). 

det(Gnum)  -->  [Word],{lex(Word,det,Gnum)}. 
n(Gnum)  -->  [Word],{lex(Word,n,Gnum)}. 
v(Gnum)  -->  [Word],{lex(Word,v,Gnum)}.

% lexicon data structure
% lex(word,
%     part of speech,
%     grammatical number (singular or plural),
%     )
lex(the,det,_). 
lex(a,det,singular). 
lex(woman,n,singular). 
lex(women,n,plural). 
lex(man,n,singular). 
lex(men,n,plural). 
lex(shoots,v,singular).
lex(shoot,v,plural).
lex(he,pro(subject),singular).
lex(she,pro(subject),singular).
lex(him,pro(object),singular).
lex(her,pro(object),singular).
lex(they,pro(subject),plural).
lex(them,pro(object),plural).
