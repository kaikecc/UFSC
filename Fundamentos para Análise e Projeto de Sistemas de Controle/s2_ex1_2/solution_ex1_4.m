% DAS410063 - Session 2
% Solution of Exercise 1 - Item 2
timespan = [0 50];
y0 = [1; 2];
[t,y] = ode45(@s2_ex1_4,timespan,y0);
plot(t,y(:,1),'-o')
title('Solution of Exercise 1.4, Session 2, with ODE45');
xlabel('Time t');
ylabel('Solution y');
legend('y_1')