% =========================
% FACTS
% =========================

% Male
male(abraham).
male(clancy).
male(homer).
male(bart).

% Female
female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

% Parent
parent(abraham, homer).
parent(mona, homer).

parent(clancy, marge).
parent(jackie, marge).

parent(clancy, patty).
parent(jackie, patty).

parent(clancy, selma).
parent(jackie, selma).

parent(homer, bart).
parent(marge, bart).

parent(homer, lisa).
parent(marge, lisa).

parent(homer, maggie).
parent(marge, maggie).

parent(selma, ling).


% =========================
% RULES
% =========================


father(X, Y) :- parent(X, Y), male(X).



mother(X, Y) :- parent(X, Y), female(X).



son(X, Y) :- parent(Y, X), male(X).



daughter(X, Y) :- parent(Y, X), female(X).



brother(X, Y) :- parent(P, X), parent(P, Y), male(X).



sister(X, Y) :- parent(P, X), parent(P, Y), female(X).



grandfather(X, Z) :- parent(X, Y), parent(Y, Z), male(X).



aunt(X, Z) :- sister(X, Y), parent(Y, Z).



uncle(X, Z) :- brother(X, Y), parent(Y, Z).



cousin(X, Z) :- parent(P, X), parent(Q, Z), brother(P, Q).
cousin(X, Z) :- parent(P, X), parent(Q, Z), sister(P, Q).


ancestor(X, Z) :- parent(X, Z).
ancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).


% ==========================================
% Queries and Answers
% ==========================================

% 41 ?- consult(['c:/Users/yaraq/OneDrive/Desktop/AI/lab/lab5/family.pl']).
% true.

% 42 ?- father(homer, bart).
% true.

% 43 ?- father(marge, bart).
% false.

% 44 ?- mother(marge, bart).
% true.

% 45 ?- mother(homer, bart).
% false.

% 46 ?- son(bart, homer).
% true.

% 47 ?- son(lisa, homer).
% false.

% 48 ?- daughter(lisa, homer).
% true.

% 49 ?- daughter(bart, homer).
% false.

% 50 ?- brother(bart, lisa).
% true.

% 51 ?- brother(lisa, bart).
% false.

% 52 ?- sister(lisa, bart).
% true.

% 53 ?- sister(bart, lisa).
% false.

% 54 ?- grandfather(abraham, bart).
% true.

% 55 ?- grandfather(homer, bart).
% false.

% 56 ?- aunt(patty, bart).
% true.

% 57 ?- aunt(marge, bart).
% false.

% 58 ?- uncle(clancy, bart).
% true.

% 59 ?- uncle(homer, bart).
% false.

% 60 ?- cousin(bart, ling).
% true.

% 61 ?- cousin(lisa, ling).
% true.

% 62 ?- ancestor(abraham, bart).
% true.

% 63 ?- ancestor(homer, bart).
% true.