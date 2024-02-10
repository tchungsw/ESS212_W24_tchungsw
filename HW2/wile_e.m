%% part b
dt = 1;
l = 1:100;
z_n(1) = 100;
g = 9.8;

for n = 2:length(l)
   z_n(n) =  z_n(n-1) + sqrt(2*g*(z_n(n-1) - z_n(1))) ;
end

%dz/dt = v;
%dv/dt = -g
z_n2 = 100;
v = 0;

%z(0) = 100, v(0) = 0
for n = 2:length(l)
    v(n) = v(n-1) + dt*(-g);
    % v = sqrt(2*g*(z_n2(i) - z_n2(1)));
    z_n2(n) = z_n2(n-1) + dt*v(n-1);
end

m = 20;
%potential energy
p_e = m*g*z_n2(1);
for n = 2:length(l)
    p_e(n) = m*g*(z_n2(n));
end

k_e = 0;
for n = 2:length(l)
    v(n) = v(n-1) + dt*(-g);
    k_e(n) = 0.5*m*(v(n)^2);
end

%total energy
t_e = k_e + p_e;


p_e_0 = find(p_e<0);
p_e(p_e_0) = [];
% set end time for p_e 
t_p = l;
t_p(p_e_0) = [];
figure()
plot(t_p,p_e)
hold on
plot(l,k_e)
plot(l,t_e)
hold off
legend('potential energy','kinetic energy','total energy')
xlim([0 8])

%% part c
v_LF = 0;
z_n_LF = 100;

for n = 2:length(l)
    v_LF(n) = v_LF(n-1) + 2*(-g);
    % v = sqrt(2*g*(z_n2(i) - z_n2(1)));
    % z_n_LF(i) = z_n_LF(i-1) + 2*v_LF(i);
end

z_n_LF2 = 100;

for n = 2:2:length(l)
    for k = 2:length(l)/2
    z_n_LF2(k) = z_n_LF2(k-1) + 2*v_LF(k);
    end
end

p_e_LF = m*g*z_n_LF2(1);
for n = 2:length(l)/2
    p_e_LF(n) = m*g*(z_n_LF2(n));
end

k_e_LF = 0;
for n = 2:length(l)/2
    k_e_LF(n) = 0.5*m*(v_LF(n)^2);
end

t_e_LF = k_e_LF + p_e_LF;

p_e_0_LF = find(p_e_LF<0);
p_e_LF(p_e_0_LF) = [];
% set end time for p_e 
t_p_LF = 2:2:length(l);
% set end time for k_e and p_e
knt_p_LF = 2:2:length(l);

t_p_LF(p_e_0_LF) = [];
figure()
plot(t_p_LF,p_e_LF)
hold on
plot(knt_p_LF,k_e_LF)
plot(knt_p_LF,t_e_LF)
hold off
legend('potential energy','kinetic energy','total energy')
xlim([0 6])
