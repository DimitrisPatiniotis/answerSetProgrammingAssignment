% Create verteces
vertex(X) :- road(X,Y).
vertex(X) :- road(Y,X).

% Create at least 1 cycle for every vertex
1 {cycle(X,Y): road(X,Y) } :- vertex(X).

% Go to every vertex avoiding blocked roads
reachable(Y) :- start(X),cycle(X,Y).
reachable(Y) :- reachable(X),cycle(X,Y).
:- vertex(X),not reachable(X).
:- cycle(X,Y), blocked(X,Y).

% Get total cycles
cyclen(X,Y,1) :- cycle(X,Y).
total_steps(1..N) :- N = #sum {Z, X, Y : cyclen(X, Y, Z), cycle(X, Y)}.

% Create steps from cycles so that result is in order
1 {step(N, X, Y): cycle(X,Y)} 1 :- total_steps(N).
:- step(N1, X1, Y1), step(N2, X2, Y2), X1 == X2, Y1 == Y2,   N1 != N2.
:- step(1, X, _), not start(X).
:- step(N1,X1, Y1), step(N2, X2, Y2),  N1 == N2-1, Y1 != X2.

% Final step must be to beginning vertex
steps(N,X,Y, 1) :- step(N,X,Y).
total(D) :- D = #sum {L, Z, X, Y : steps(X, Y, Z, L)}.
:- step(N,_,Y), total(N), not start(Y).

% Find shortest path
#minimize{N, X,Y: step(N,X,Y)}.

#show step/3. 