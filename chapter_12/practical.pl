% In this practical session, we want to combine what we have learned about
% file handling with some topics we met in earlier chapters. The goal is to
% write a program for running a DCG grammar on a testsuite, so that the
% performance of the grammar can be checked.

% What is a testsuite? It is a file that contains lots of possible inputs (and
% expected outputs) for some program. In this case, a testsuite will be a file
% that has lists representing grammatical and ungrammatical sentences, such as
% [the,woman,shoots,the,cow,under,the,shower] or [him,shoots,woman] . The test
% program should take this file, run the grammar on each of the sentences, and
% store the results in another file. We can then look at the output file to
% check whether the grammar answered everywhere the way it should have. When
% developing grammars, testsuites like this are extremely useful for making
% sure that any modifications we make to the grammar don’t have unwanted
% effects.

% Step 1

% Take the DCG that you built in the practical session of Chapter  8 and turn
% it into a module, exporting the predicate s/3 , that is, the predicate that
% lets you parse sentences and returns the parse tree as its first argument.



% WARNING: The previous exercises were all done with GNU Prolog
% However, it does not support the use_module/1 predicate, so this practical
% session was done with SWI-Prolog.

:- use_module(step1).