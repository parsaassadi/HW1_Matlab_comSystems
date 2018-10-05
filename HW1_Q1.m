
syms t T n t0 A
f = 1/T;

a0 = (1/T) * int(A, t, -t0 , t0);
an = (2/T) * int(A * cos(2* pi * n * f * t), t, -t0, t0);
bn = (2/T) * int(A * sin(2* pi * n * f * t), t, -t0, t0);
cn = (1/T) * int(A * exp(-1j * 2 * pi * f * n * t), t, -t0, t0);
c0 = (1/T) * int(A, t, -t0, t0);

a0_handler  = matlabFunction(a0);
an_handler  = matlabFunction(an);
cn_handler  = matlabFunction(cn);
c0_handler  = matlabFunction(c0);

cn_vector = cn_handler(1,4,[-10:1:10], 1);
cn_vector(11) = c0_handler(1,4,1);

n_vector = -10:1:10;

plot = stem(n_vector,cn_vector);
xlabel('n','fontweight','bold','fontsize',20)
ylabel('c(n)','fontweight','bold','fontsize',20)
plot.LineWidth = 3;
plot.MarkerFaceColor = 'red';
plot.MarkerEdgeColor = 'black';
