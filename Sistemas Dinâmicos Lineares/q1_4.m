clc
clear all

A = [-0.18123,-0.47879;-0.47879,-17.819];
B = [-1.0333;-1.3901];
C = [-1.0333,-1.3901];

Wc = lyap(A,B*B')

Wo = lyap(A',C'*C)

% Como sigma1 >> sigma2, etão pode-se obter um modelo de ordem reduzida
% desprezando o estado associada a sigma2
