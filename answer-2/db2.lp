% Defining devices
device(a).
device(b).
device(c).
device(d).
device(e).

% Defining the distance of two devices
distance(a,b,3).
distance(a,c,4).
distance(a,d,3).
distance(a,e,4).
distance(b,c,3).
distance(b,d,3).
distance(b,e,3).
distance(c,d,3).
distance(c,e,4).
distance(d,e,4).

% Define max distance for communication
#const maxDist = 3.