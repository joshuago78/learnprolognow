% Here are some programs for you to try your hand at.
%
% 1. Imagine that the following knowledge base describes a maze. The facts
% determine which points are connected, that is, from which points you can
% get to which other points in one step. Furthermore, imagine that all paths
% are one-way streets, so that you can only walk them in one direction. So,
% you can get from point 1 to point 2, but not the other way round.

   connected(1,2). 
   connected(3,4). 
   connected(5,6). 
   connected(7,8). 
   connected(9,10). 
   connected(12,13). 
   connected(13,14). 
   connected(15,16). 
   connected(17,18). 
   connected(19,20). 
   connected(4,1). 
   connected(6,3). 
   connected(4,7). 
   connected(6,11). 
   connected(14,9). 
   connected(11,15). 
   connected(16,12). 
   connected(14,17). 
   connected(16,19).

% Write a predicate path/2 that tells you from which points in the maze you
% can get to which other points when chaining together connections given in
% the above knowledge base. Can you get from point 5 to point 10? Which other
% point can you get to when starting at point 1? And which points can be
% reached from point 13?

path(Start, End) :-
  connected(Start, End);
  connected(Midpoint, End),
  path(Start, Midpoint).



% 2. We are given the following knowledge base of travel information:

   byCar(auckland,hamilton). 
   byCar(hamilton,raglan). 
   byCar(valmont,saarbruecken). 
   byCar(valmont,metz). 
    
   byTrain(metz,frankfurt). 
   byTrain(saarbruecken,frankfurt). 
   byTrain(metz,paris). 
   byTrain(saarbruecken,paris). 
    
   byPlane(frankfurt,bangkok). 
   byPlane(frankfurt,singapore). 
   byPlane(paris,losAngeles). 
   byPlane(bangkok,auckland). 
   byPlane(singapore,auckland). 
   byPlane(losAngeles,auckland).

% Write a predicate travel/2 which determines whether it is possible to travel
% from one place to another by chaining together car, train, and plane
% journeys. For example, your program should answer yes to the query 
%
%    travel(valmont,raglan).


travelDirect(From, To) :-
  byCar(From, To);
  byTrain(From, To);
  byPlane(From, To).

travel(Start, End) :-
  travelDirect(Start, End);
  travelDirect(Midpoint, End),
  travel(Start, Midpoint).



% 3. So, by using travel/2 to query the above database, you can find out that
% it is possible to go from Valmont to Raglan. If you are planning such a
% voyage, that’s already something useful to know, but you would probably
% prefer to have the precise route from Valmont to Raglan. Write a predicate
% travel/3 which tells you which route to take when travelling from one place
% to another. For example, the program should respond
%
%   X  =  go(valmont,metz, 
%                 go(metz,paris, 
%                       go(paris,losAngeles)))
%
% to the query travel(valmont,losAngeles,X).


go(From, To) :-
  byCar(From, To);
  byTrain(From, To);
  byPlane(From, To).
go(From, To, From, Midpoint, go(Path)) :-
  go(From, Midpoint),
  go(Midpoint, To, Path).


travel_path(From, To, Path) :-
  go(From, To, Path).



% 4. Extend the predicate travel/3 so that it not only tells you the route to
% take to get from one place to another, but also how you have to travel. That
% is, the new program should let us know, for each stage of the voyage,
% whether we need to travel by car, train, or plane.

travel_by(Start,End, byCar(Start,End)) :-
    byCar(Start,End).
travel_by(Start,End, byTrain(Start,End)) :-
    byTrain(Start,End).
travel_by(Start,End, byPlane(Start,End)) :-
    byPlane(Start,End).


travel_by(Start,End, byCar(Start, Midpoint, Method)) :-
    byCar(Start,Midpoint),
    travel_by(Midpoint,End, Method).
travel_by(Start,End, byTrain(Start, Midpoint, Method)) :-
    byTrain(Start,Midpoint),
    travel_by(Midpoint,End, Method).
travel_by(Start,End, byPlane(Start, Midpoint, Method)) :-
    byPlane(Start,Midpoint),
    travel_by(Midpoint,End, Method).