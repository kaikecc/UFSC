
clc
clear all

s = tf('s');
g_s = exp(-5*s) / (50*s + 1);
%bode(g_s)
%grid

% Definir uma PM de 60°

% Phase = -180 + 60 = -120°

% Corresponde um w_c = 0.165 e GM = -18.4

K = 10^(16.6/20);

w_c = 0.134;


zero = 0.001*w_c;
tal = 1 / zero;


h_s = K*(1 + 1/(tal*s));

l_s = g_s * h_s;
t_s = l_s / (1 + l_s);

margin(l_s)
grid

