% Para K = 1
K = 1

h_s = tf([K],[1,0])

g_s = tf([1],[1,8,32])

l_s = tf([K],[1,8,32,0])


rlocus(l_s)

%PROVA 1

K = 0.00637
s = tf('s')

l_s = K*exp(-5*s) / (s*(s + 1/10))



g_s = exp(-5*s) / ((s+1/60)*(s + 1/10))