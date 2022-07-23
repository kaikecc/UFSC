clear all
clc

%Q1

h_1 = tf([1],[1,1,1])
h_2 = tf([0.1,1],[1,1,1])

bode(h_1,'r',h_2,'b--')
legend('H1','H2')

grid on

[mag1,phase1,wout1] = bode(h_1)
[mag2,phase2,wout2] = bode(h_2)

mag1db = 20*log10(mag1)
mag2db = 20*log10(mag2)

[Gm, Pm, Wcg, Wcp] = margin(h_1)

%Q2

c_s = tf([1,1],[0.1,1])

%Q5

g_s = tf([1,-1],[0,1,1])
