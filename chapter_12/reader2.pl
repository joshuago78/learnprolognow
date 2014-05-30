:- module(reader2, [getdata/3]).


getdata(Stream, Lines, Expected) :-
  readlines(Stream, Lines, Expected).


readlines(Stream, [], []) :-
  at_end_of_stream(Stream), !.
readlines(Stream, [Words|Lines], [ParsedWords|Expected]) :-
  readwords(Stream, RawWords, 2),
  stripblanks(RawWords, Words),
  read(Stream, ParsedWords),
  readlines(Stream, Lines, Expected).

stripblanks([], []).
stripblanks([''|Words], Clean) :-
  stripblanks(Words, Clean), !.
stripblanks([Word|Words], [Word|Clean]) :-
  stripblanks(Words, Clean).

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