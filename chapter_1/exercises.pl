% Exercise  1.4 Represent the following in Prolog:
%
% Butch is a killer.
% Mia and Marsellus are married.
% Zed is dead.
% Marsellus kills everyone who gives Mia a footmassage.
% Mia loves everyone who is a good dancer.
% Jules eats anything that is nutritious or tasty.

killer(butch).
married(mia, marsellus).
dead(zed).
kills(Person) :-
  massaged(Person, mia).
loves(mia, Person) :-
  goodDancer(Person).
eats(jules, Food) :-
  nutiritious(Food);
  tasty(Food).
