clc
clear all

g_s = tf([1],[1,0,0]) % planta 

%figure
%rlocus(g_s)

xi = 9/10;

w_n = 4 / xi;

sigma = w_n * xi;

w_d = w_n*sqrt(1 - xi*xi);

p_1 = -sigma + i*w_d;
p_2 = -sigma - i*w_d;

% Resolvendo as expressões:

tal_2 = 1/60; % supondo um polo em -60, tal_2 = alpha * tal

p = 1/tal_2 - 8;

K = tal_2 * (1600/81)*p;

alpha = K / (8*p + (1600/81));

tal = tal_2/alpha;

% Compensador de atraso PI
s = tf('s')
h_s = K*(tal*s + 1)/(alpha*tal*s+1);

% Sistema de malha aberta
l_s = g_s * h_s;

% Sistema de malha fechada
t_s = l_s / (1+l_s);

%rlocus(t_s)
grid
step(t_s)
S = stepinfo(t_s)


