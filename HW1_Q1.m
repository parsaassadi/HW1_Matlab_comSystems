%% HW1-Q1 -  Communication systems
%% Steps of solution:
%%
% 
% # Calculating cn, an, bn, c0 in terms of problem's given variables
% including: t0, T, A. This calculation is done by means of symbolic
% variables
% # Printing the results of the previous calculation via pretty() function
% which is used for printing mathematical statement beatifully
% # Converting these symbolic multi variable functions to function
% handlers. It is done because doing plotting operation is much easier with
% function handlers rather than symbolic functions
% # Plotting c(n) which is a discrete function is done by stem() function.
% For valuse T = 4, t0 = 1, A = 1

%%
% *Note: All of the calculations are done by matlab including calculation of coefficients.*



% Calculating fourier coefficents
syms t T n t0 A
f = 1/T;

a0 = (1/T) * int(A, t, -t0 , t0);
an = (2/T) * int(A * cos(2* pi * n * f * t), t, -t0, t0);
bn = (2/T) * int(A * sin(2* pi * n * f * t), t, -t0, t0);
cn = (1/T) * int(A * exp(-1j * 2 * pi * f * n * t), t, -t0, t0);
c0 = (1/T) * int(A, t, -t0, t0);

% Converting symbolic functions to function handlers
a0_handler  = matlabFunction(a0);
an_handler  = matlabFunction(an);
cn_handler  = matlabFunction(cn);
c0_handler  = matlabFunction(c0);

cn_vector = cn_handler(1,4,[-10:1:10], 1);
cn_vector(11) = c0_handler(1,4,1);
n_vector = -10:1:10;

% Displaying calculated results
disp('**********************')
disp('a0:')
disp(' ')
pretty(a0)
disp('**********************')
disp('an:')
disp(' ')
pretty(an)
disp('**********************')
disp('bn:')
disp(' ')
pretty(bn)
disp('**********************')
disp('c0:')
disp(' ')
pretty(c0)
disp('**********************')
disp('cn:')
disp(' ')
pretty(cn)
disp('**********************')

% Plotitng discrete spectrum
plot = stem(n_vector,cn_vector);
xlabel('n','fontweight','bold','fontsize',20)
ylabel('c(n)','fontweight','bold','fontsize',20)
plot.LineWidth = 3;
plot.MarkerFaceColor = 'red';
plot.MarkerEdgeColor = 'black';

%%
% *Obviously results obtained from discrete spectrum and calculated coefficients agree with theoretical calculations*
