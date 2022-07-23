
syms tetha
A = [-tetha,1,0,0;0,-tetha,0,0;0,0,tetha,1;0,0,0,tetha];
B = [0;1;0;1];
C = [1,0,0,0];
D = [0];
e = eig(A);

% Sistema internamente est�vel, se todos os autovalores s�o negativos.
% Por�m, dois desses autovalares s�o positivos e torna internamente
% inst�vel.

Control = [B A*B A*A*B A*A*A*B];

r_control = rank(Control);

% O sistema � controlav�l, pois t�m rank igual a ordem da matriz

O = [C;C*A;C*A*A;C*A*A*A];

r_obs = rank(O);

% O sistema n�o � observ�vel, pois o rank � menor que a dimens�o da matriz


I = [1,0,0,0;0,1,0,0;0,0,1,0;0,0,0,1];
syms s;
g = C*inv(s*I - A)*B + D



% O sistema n�o est�vel, pois possuem dois autovalores positivos.


