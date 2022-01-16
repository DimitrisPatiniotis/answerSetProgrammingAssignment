% Defining tasks
task(1, cook).
task(2, supermarket).
task(3, bank).
task(4, haircut).

% Defining holidays (dayoff(0) and dayoff(1) means the day of christmas and the day before christmas are holidays)
dayoff(0).
dayoff(1).

% When are we selebrating (0 if celebration is on christmas, 1 for one day before christmas)
celebrate(1).

% startdate(DAYS TILL CHRISTMAS, NAME OF DAY)
startdate(6, tuestday).