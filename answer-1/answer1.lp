% Creating week graph
nextday(monday, tuestday).
nextday(tuestday, wednesday).
nextday(wednesday, thursday).
nextday(thursday, friday).
nextday(friday, saturday).
nextday(saturday, sunday).
nextday(sunday, monday).

% X number of days till christmas
timetillxmas(0..X) :-  startdate(X, _).

% Assign day name to days till XMAS starting from startdate
date(X,Y) :- startdate(X, Y).
1 { date(X, Y) : nextday(Y, _)} 1 :- timetillxmas(X).
:- date(X1, Y1), date(X2, Y2), X1 == X2 + 1, not nextday(Y1, Y2).

% Create Schedule
1 {schedule(N, D, T) : date(N, D)} 1:- task(_, T).

% 1. Cook on celebration day
:- schedule(N, _, T), celebrate(L), task(M, T),  M == 1, N != L.

% 2. Go to supermarket 1 day before celebration (as cooking takes up all the time on celebration day)
:- schedule(N, _, T), celebrate(L), task(M, T),  M == 2, N != L + 1.

% 3. Go to bank before going to the supermarket
:- schedule(N1, _, T1), schedule(N2, _, T2), task(M1, T1), task(M2, T2), M1 == 2, M2 == 3, N1 > N2.


% Rest of tasks
:- schedule(N, _, T), celebrate(L), task(M, T),  M == 3, N < L + 1.
:- schedule(N, _, T), celebrate(L), task(M, T),  M == 4, N < L + 1.

% Accounting for dayoffs
:- schedule(N, _, T), dayoff(L), task(M, T),  M > 2, N == L.

% If sunday and saturday are holidays apply this (excluding the day before christmas for supermarkets)
% :- schedule(N, D, T), D == saturday, task(M, T), M == 2, N != 1.
% :- schedule(N, D, T), D == sunday, task(M, T), M == 2, N != 1.
% :- schedule(_, D, T), D == sunday,  task(M, T), M == 3.
% :- schedule(_, D, T), D == saturday, task(M, T), M == 3.
% :- schedule(_, D, T), D == sunday, task(M, T), M == 4.
% :- schedule(_, D, T), D == saturday, task(M, T), M == 4.


% By minimizing the days until xmas of a task we group up the tasks
#minimize {N , D, T: schedule(N, D, T)}.

#show schedule/3.