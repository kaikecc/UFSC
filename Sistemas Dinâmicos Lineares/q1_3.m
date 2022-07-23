
syms tetha
A = [-tetha,1,0,0;0,-tetha,0,0;0,0,tetha,1;0,0,0,tetha];
B = [0;1;0;1];
C = [1,0,0,0];
D = [0];
e = eig(A);

% Sistema internamente estável, se todos os autovalores são negativos.
% Porém, dois desses autovalares são positivos e torna internamente
% instável.

Control = [B A*B A*A*B A*A*A*B];

r_control = rank(Control);

% O sistema é controlavél, pois têm rank igual a ordem da matriz

O = [C;C*A;C*A*A;C*A*A*A];

r_obs = rank(O);

% O sistema não é observável, pois o rank é menor que a dimensão da matriz


I = [1,0,0,0;0,1,0,0;0,0,1,0;0,0,0,1];
syms s;
g = C*inv(s*I - A)*B + D



% O sistema não estável, pois possuem dois autovalores positivos.


