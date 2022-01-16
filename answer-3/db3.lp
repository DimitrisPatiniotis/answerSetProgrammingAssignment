% Define roads
road(a,b).
road(b,c).
road(c,d).
road(d,a).
road(c,a).
road(d,c).
road(c,a).
road(c,b).
road(b,a).
road(a,f).
road(f,a).

% Define blocked roads
blocked(d,a).

% Define start point
start(a).