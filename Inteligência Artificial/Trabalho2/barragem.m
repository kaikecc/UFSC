clc 
clear all

R12 = 100
A1 = 100000
R2 = 1000
A2 = 10000



A = [-1/(A2*R2) 1/(A1*R12);1/(A2*R12) -(1/(A2*R12) + 1/(A2*R2))]
B = [1/A1; 0]
C = [0 1/R2; 1/R12 0]
D = [0 ; 0]

h = ss(A,B,C,0)

%step(h)
%grid

s = tf('s')
g = C*inv(s*eye(2,2) - A)*B