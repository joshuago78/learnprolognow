% Exercise  7.2
% The formal language a^n b^n −{ ϵ } consists of all the strings in a^n b^n
% except the empty string. Write a DCG that generates this language.


s(S,X) :-
  length(S, L),
  L > 1,
  sub_s(S,X).
sub_s --> [].
sub_s --> l,sub_s,r.
l --> [a].
r --> [b].




% Exercise  7.3
% Let a^n b^2n be the formal language which contains all strings of the
% following form: an unbroken block of a's of length n followed by an unbroken
% block of b's of length 2n , and nothing else. For example, abb , aabbbb , and
% aaabbbbbb belong to a^n b^2n , and so does the empty string. Write a DCG
% that generates this language.


sabb --> [].
sabb --> left, sabb, right.
left --> [a].
right --> [b,b].