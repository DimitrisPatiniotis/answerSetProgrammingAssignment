distance(X,Y,V) :- distance(Y,X,V).
edge(X,Y) :- distance(X,Y, M), not M > maxDist.
edge(X,Y) :- edge(Y,X).


{ backbone(X) } :- edge(X, Y), edge(X,Z), Z!=Y.

1 {adj(X) : device(X) } 1 :- edge(X,Y), backbone(Y).
adj(X) :- backbone(X).

% Backbones must connect directly 
contactsbackbone(X,Y) :- backbone(X), backbone(Y), edge(X,Y).
% Or through other backbones
contactsbackbone(X,Y) :- backbone(X), backbone(Z), contactsbackbone(Z,Y).

% Every device must be close to a backbone
:- device(X), not adj(X).
% Every backbone must be connected directly or indirectly with all other backbones
:- backbone(X), backbone(Y), X != Y, not contactsbackbone(X,Y).

% Return a (or the) minimal answer set
backbonen(X, 1) :- backbone(X).
totalcost(D) :- D = #sum {Y,X : backbonen(X, Y), backbone(X)}.
#minimize {D: totalcost(D)}.

#show backbone/1.