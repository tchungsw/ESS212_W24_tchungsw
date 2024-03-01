syms A B C
x1 = -4; x2 = 0; x3 = 4;
y1 = 30; y2 = 2; y3 = 6;


F_1 = A*(x1-B)*(x1-C);
F_2 = A*(x2-B)*(x2-C);
F_3 = A*(x3-B)*(x3-C);
F_beta = [F_1 F_2 F_3]';

beta_0 = [A B C]';
beta_1 = beta_0 - inv(jacobian(F_beta, beta_0'));
%%
A = 1;
B = 2;
C = 3;

subs(beta_1)