% Exercise  12.1
% Write code that creates hogwart.houses , a file that that looks like this:

%                 gryffindor 
%   hufflepuff          ravenclaw 
%                 slytherin

% You can use the built-in predicates open/3 , close/1 , tab/2 , nl/1 , and
% write/2 .


houses:-
  open('hogwart.houses', write, Stream),
  tab(Stream, 9), write(Stream, gryffindor), nl(Stream),
  write(Stream, hufflepuff),
  tab(Stream, 7), write(Stream, ravenclaw), nl(Stream),
  tab(Stream, 9), write(Stream, slytherin), nl(Stream),
  close(Stream).


% GNU Prolog does not support tab/2 natively, so I had to implement it myself.
tab(_, 0):-  !.
tab(Stream, Spaces) :-
  write(Stream, ' '),
  NewSpaces is Spaces - 1,
  tab(Stream, NewSpaces).



% Exercise  12.2
% Write a Prolog program that reads in a plain text file word by word, and
% asserts all read words and their frequency into the Prolog database. You may
% use the predicate readWord/2 to read in words. Use a dynamic predicate
% word/2 to store the words, where the first argument is a word, and the
% second argument is the frequency of that word.

:- dynamic(word/2).

word_count(Filename) :-
  open(Filename, read, Stream),
  get_words(Stream),
  close(Stream).

get_words(Stream) :-
  at_end_of_stream(Stream), !.
get_words(Stream) :-
  readWord(Stream, Word),
  update_count(Word),
  get_words(Stream).

update_count(Word) :-
  word(Word, Count),
  Incr is Count + 1,
  retract(word(Word, Count)),
  assertz(word(Word, Incr)).
update_count(Word) :-
  assertz(word(Word, 1)).

readWord(InStream,W):- 
  get_code(InStream,Char),
  checkCharAndReadRest(Char,Chars,InStream),
  atom_codes(W,Chars).

checkCharAndReadRest(10,[],_):-  !.
checkCharAndReadRest(32,[],_):-  !.
checkCharAndReadRest(-1,[],_):-  !.
checkCharAndReadRest(end_of_file,[],_):-  !.
checkCharAndReadRest(Char,[Char|Chars],InStream):-
  get_code(InStream,NextChar),
  checkCharAndReadRest(NextChar,Chars,InStream).