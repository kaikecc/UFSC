clc
clear all

A = [-1];
B = [2];
C = [1];
D = [1];
sys = ss(A,B,C,D);

Ta = 0.1
sysd = c2d(sys,Ta);

I = [1];
syms s;
g = C*inv(s*I - A)*B + D