% Exercise  10.2
% First, explain what the following program does:
%
%   class(Number,positive)  :-  Number  >  0. 
%   class(0,zero). 
%   class(Number,negative)  :-  Number  <  0.
%
% Second, improve it by adding green cuts.

class(Num, positive) :- Num > 0,!.
class(0, zero) :- !.
class(Num, negative) :- Num < 0.



% Exercise  10.3
% Without using cut, write a predicate split/3 that splits a list of integers
% into two lists: one containing the positive ones (and zero), the other
% containing the negative ones. For example:
%
%           split([3,4,-5,-1,0,4,-9],P,N)
%
% should return:
%
%           P  =  [3,4,0,4] 
%    
%           N  =  [-5,-1,-9].
%
% Then improve this program, without changing its meaning, with the help of the
% cut.

split([],[],[]).
split([Head|Tail], [Head|Pos], Neg) :-
  Head >= 0, !,
  split(Tail, Pos, Neg).
split([Head|Tail], Pos, [Head|Neg]) :-
  Head < 0,
  split(Tail, Pos, Neg).




% Exercise  10.4
%
% Recall that in Exercise   3.3 we gave you the following knowledge base:

   directTrain(saarbruecken,dudweiler). 
   directTrain(forbach,saarbruecken). 
   directTrain(freyming,forbach). 
   directTrain(stAvold,freyming). 
   directTrain(fahlquemont,stAvold). 
   directTrain(metz,fahlquemont). 
   directTrain(nancy,metz).

% We asked you to write a recursive predicate travelFromTo/2 that told us when
% we could travel by train between two towns.
%
% Now, it’s plausible to assume that whenever it is possible to take a direct
% train from A to B, it is also possible to take a direct train from B to A.
% Add this information to the database. Then write a predicate route/3 which
% gives you a list of towns that are visited by taking the train from one town
% to another. For instance:

%   ?-  route(forbach,metz,Route). 
%   Route  =  [forbach,freyming,stAvold,fahlquemont,metz]


