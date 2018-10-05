% HW1-Q2 -  Communication systems
% Power content of a signal is computed via two methods: 1)Sampling the
% signal and then using trapzodial integration method 2) Creating a
% function handler of the signal and performing integration using built-in
% integral() function of matlab

% Sampling method
t = -1 : 1e-3 : 11;
x = (cos(2 * pi * 47 * t) + cos(2 * pi * 219 * t)).*(t >= 0 & t <= 10) + (0).*(t <= 0 & t >= 10);
power_content_trapzodial_method = trapz(t,x.^2)

% Function handler method
signal_in_power_of_two = @(t) (cos(2 * pi * 47 * t) + cos(2 * pi * 219 * t)).^2;
power_content_function_handler_method = integral(signal_in_power_of_two, 0, 10)
