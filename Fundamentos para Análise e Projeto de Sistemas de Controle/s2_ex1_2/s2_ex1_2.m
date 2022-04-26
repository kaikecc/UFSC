function dydt = s2_ex1_2(t,y)
%   Evaluate the ODE 
%   Session 2 - Exercise 1 - 2
%   Daniel Coutinho 2021
%
u = 1;
dydt = [y(2); -5*y(1)-2*y(2)+u]; 