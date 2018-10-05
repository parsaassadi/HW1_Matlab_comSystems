%% HW1-Q2 -  Communication systems



%% Power content of a signal is computed via two methods:
% 
%
%
% # Sampling the signal and then using trapzodial numerical integration
% method
% # Creating a function handler of the squared signal and performing integration
% using built-in integral() function of matlab
% 

% Sampling method
t = -1 : 1e-3 : 11;
x = (cos(2 * pi * 47 * t) + cos(2 * pi * 219 * t)).*(t >= 0 & t <= 10) + (0).*(t <= 0 & t >= 10);
power_content_trapzodial_method = trapz(t,x.^2)

% Function handler method
signal_in_power_of_two = @(t) (cos(2 * pi * 47 * t) + cos(2 * pi * 219 * t)).^2;
power_content_function_handler_method = integral(signal_in_power_of_two, 0, 10)

%%
% *As results suggest, the power content of the signal is approximately 10. The answer obtained by these two methods only differ by a narrow margin of 0.004; hence, the relative error would be 4e-4 which seems reasonable. This slight difference between answers is mainly because of the fact that integral() function and trapz() function use different numerical methods for integration, so they produce slightly different answers.*

