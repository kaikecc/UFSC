function dydt = s2_ex1_4(t,y)
%   Evaluate the ODE 
%   Session 2 - Exercise 1 - 2
%   Daniel Coutinho 2021
%
u = sin(t);
dydt = [y(2); -y(2)+u]; 