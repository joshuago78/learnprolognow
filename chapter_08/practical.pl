% 1. First, bring together all the things we have learned about DCGs for
% English into one DCG. In particular, in the text we saw how to use extra
% arguments to deal with the subject/object distinction, and in the exercises
% you were asked to use additional arguments to deal with the singular/plural
% distinction. Write a DCG which handles both. Moreover, write the DCG in such
% a way that it will produce parse trees, and makes use of a separate lexicon.

s(s(NP,VP)) --> np(NP, subject, GramNum),vp(VP, GramNum).

np(np(DET,N),_, Gnum)  -->  det(DET, Gnum),n(N, Gnum). 
np(np(Word), X, Gnum) --> [Word],{lex(Word,pro(X),Gnum)}.

vp(vp(V,NP), Gnum)  -->  v(V, Gnum),np(NP,object,_). 
vp(vp(V), Gnum)  -->  v(V, Gnum). 

det(det(Word), Gnum)  -->  [Word],{lex(Word,det,Gnum)}. 
n(noun(Word), Gnum)  -->  [Word],{lex(Word,n,Gnum)}. 
v(verb(Word), Gnum)  -->  [Word],{lex(Word,v,Gnum)}.

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




% Once you have done this, extend the DCG so that noun phrases can be modified
% by adjectives and simple prepositional phrases (that is, it should be able to
% handle noun phrases such as “the small frightened woman on the table” or “the
% big fat cow under the shower”). Then, further extend it so that the
% distinction between first, second, and third person pronouns is correctly
% handled (both in subject and object form).



s2(s(NP,VP)) --> np2(NP, subject, GramNum),vp2(VP, GramNum).

np2(np(DET,NOM),_, Gnum) --> det2(DET, Gnum),nom2(NOM, Gnum).
np2(np(DET,NOM, PP),_, Gnum) --> det2(DET, Gnum),nom2(NOM, Gnum),pp2(PP).
np2(np(PRO), SubOb, Gnum) --> pro2(PRO, SubOb, Gnum).

vp2(vp(V,NP), Gnum) --> v2(V, Gnum),np2(NP,object,_). 
vp2(vp(V), Gnum) --> v2(V, Gnum).

nom2(nom(N), Gnum) --> n2(N, Gnum).
nom2(nom(ADJ, N), Gnum) --> adj2(ADJ), n2(N, Gnum).
nom2(nom(ADJ, NOM), Gnum) --> adj2(ADJ), nom2(NOM, Gnum).

pp2(pp(PREP, NP)) --> prep2(PREP),np2(NP,_,_).

adj2(adj(Word)) --> [Word],{lex2(Word,adj,_)}.
det2(det(Word), Gnum) -->  [Word],{lex2(Word,det,Gnum)}. 
n2(noun(Word), Gnum) -->  [Word],{lex2(Word,n,Gnum)}. 
v2(verb(Word), Gnum) -->  [Word],{lex2(Word,v,Gnum)}.
pro2(pro(Word), SubOb, Gnum) --> [Word],{lex(Word,pro(SubOb),Gnum)}.
prep2(prep(Word)) --> [Word],{lex2(Word,prep,_)}.

% lexicon data structure
% lex2(word,
%     part of speech,
%     grammatical number (singular or plural),
%     )
lex2(the,det,_).
lex2(a,det,singular).
lex2(woman,n,singular).
lex2(women,n,plural).
lex2(man,n,singular).
lex2(men,n,plural).
lex2(cow,n,plural).
lex2(table,n,plural).
lex2(shoots,v,singular).
lex2(shoot,v,plural).
lex2(he,pro(subject),singular).
lex2(him,pro(object),singular).
lex2(she,pro(subject),singular).
lex2(her,pro(object),singular).
lex2(they,pro(subject),plural).
lex2(them,pro(object),plural).
lex2(we,pro(subject),singular).
lex2(us,pro(object),singular).
lex2(i,pro(subject),singular).
lex2(me,pro(object),singular).
lex2(you,pro(_),singular).
lex2(big,adj,_).
lex2(fat,adj,_).
lex2(small,adj,_).
lex2(frightened,adj,_).
lex2(in,prep,_).
lex2(on,prep,_).
lex2(under,prep,_).
lex2(above,prep,_).