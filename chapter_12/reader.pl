

:- module(reader, [getlines/2]).

getlines(Stream, Clean) :-
  readlines(Stream, Lines), !,
  cleanlines(Lines, Clean).

cleanlines([], []).
cleanlines([['']|Lines], Clean) :-
  cleanlines(Lines, Clean), !.
cleanlines([Line|Lines], [Line|Clean]) :-
  cleanlines(Lines, Clean).

readlines(Stream, []) :-
  at_end_of_stream(Stream), !.
readlines(Stream, [Words|Lines]) :-
  readwords(Stream, Words, 2),
  readlines(Stream, Lines).

readwords(_, [], 46) :- !.
readwords(_, [], 10) :- !.
readwords(_, [], end_of_file) :- !.
readwords(Stream, [Word|Words], _) :-
  nextword(Stream, Word, LastChar),
  readwords(Stream, Words, LastChar).

nextword(Stream, Word, LastChar) :-
  get_code(Stream, FirstChar),
  checkCharAndReadRest(Stream, FirstChar, Chars, LastChar),
  atom_codes(Word,Chars).

checkCharAndReadRest(_, 46,[], 46):-  !.
checkCharAndReadRest(_, 10,[], 10):-  !.
checkCharAndReadRest(_, 32,[], 32):-  !.
checkCharAndReadRest(_, -1,[], -1):-  !.
checkCharAndReadRest(_, end_of_file,[],end_of_file):-  !.
checkCharAndReadRest(Stream, Char, [Char|Chars], LastChar):-
  get_code(Stream, NextChar),
  checkCharAndReadRest(Stream, NextChar, Chars, LastChar).



  