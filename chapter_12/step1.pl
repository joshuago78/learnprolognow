% Step 1

% Take the DCG that you built in the practical session of Chapter  8 and turn
% it into a module, exporting the predicate s/3 , that is, the predicate that
% lets you parse sentences and returns the parse tree as its first argument.


:- module(step1, [s/3]).

s(s(NP,VP)) --> np(NP, subject, GramNum),vp(VP, GramNum).

np(np(DET,NOM),_, Gnum) --> det(DET, Gnum),nom(NOM, Gnum).
np(np(DET,NOM, PP),_, Gnum) --> det(DET, Gnum),nom(NOM, Gnum),pp(PP).
np(np(PRO), SubOb, Gnum) --> pro(PRO, SubOb, Gnum).

vp(vp(V,NP), Gnum) --> v(V, Gnum),np(NP,object,_). 
vp(vp(V), Gnum) --> v(V, Gnum).

nom(nom(N), Gnum) --> n(N, Gnum).
nom(nom(ADJ, N), Gnum) --> adj(ADJ), n(N, Gnum).
nom(nom(ADJ, NOM), Gnum) --> adj(ADJ), nom(NOM, Gnum).

pp(pp(PREP, NP)) --> prep(PREP),np(NP,_,_).

adj(adj(Word)) --> [Word],{lex(Word,adj,_)}.
det(det(Word), Gnum) -->  [Word],{lex(Word,det,Gnum)}. 
n(noun(Word), Gnum) -->  [Word],{lex(Word,n,Gnum)}. 
v(verb(Word), Gnum) -->  [Word],{lex(Word,v,Gnum)}.
pro(pro(Word), SubOb, Gnum) --> [Word],{lex(Word,pro(SubOb),Gnum)}.
prep(prep(Word)) --> [Word],{lex(Word,prep,_)}.

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
lex(cow,n,plural).
lex(table,n,plural).
lex(shoots,v,singular).
lex(shoot,v,plural).
lex(he,pro(subject),singular).
lex(him,pro(object),singular).
lex(she,pro(subject),singular).
lex(her,pro(object),singular).
lex(they,pro(subject),plural).
lex(them,pro(object),plural).
lex(we,pro(subject),singular).
lex(us,pro(object),singular).
lex(i,pro(subject),singular).
lex(me,pro(object),singular).
lex(you,pro(_),singular).
lex(big,adj,_).
lex(fat,adj,_).
lex(small,adj,_).
lex(frightened,adj,_).
lex(in,prep,_).
lex(on,prep,_).
lex(under,prep,_).
lex(above,prep,_).