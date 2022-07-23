mp = 0.25

psi = sqrt(log(mp)^2/(pi*pi + log(mp)^2))
ta = 0.5;
wn = 3/ (ta * psi)

tr = (pi - atan(wn * sqrt(1-psi*psi))/(psi*wn)) / (wn * sqrt(1-psi*psi))

gs = tf([1],[5,1]);

K = wn*wn - 1;

tal_2 = 1/10; %polo em -4

tal_1 = (2*psi*wn - 5 - tal_2) / K

hs = tf([K*tal_1,K],[tal_2,1])

ls = gs*hs
%%%%%

ts = ls / (1+ls)
%stepinfo(ts)

td = c2d(ts,0.05,'zoh')

step(ts,'-',td,'--')
