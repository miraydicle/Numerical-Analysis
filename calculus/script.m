%% Central Difference Method

g = input('Enter your function: ');
h = input('Enter your step size: ');
x = input('At which point you want to approximate derivative: ');

solution = central_diff_function(g,x,h);
%% Lagrange Method

g = input('Enter your function: ');
h = input('Enter your step size: ');
x = input('At which point you want to approximate derivate: ');

solution = lagrange_derivative_function(g,x,h);
%% Taylor Method

g = input('Enter your function: ');
h = input('Enter your step size: ');
x = input('At which point you want to approximate derivate: ');

solution = taylor_function(g,x,h);
%% Trapezoidal Method

g = input('Enter your function: ');
N = input('Enter no of max Trapeziums: ');
a = input('Enter lower limit: ');
b = input('Enter upper limit: ');

error = zeros(1,N);

for i=1:N

    trap=i;
    solution = trapezoidal_function(g,trap,a,b);
    actual = integral(g,a,b);
    error(i) = abs(actual-solution);
end

plot(1:N,error);
grid on
%% Double Integral Method

g = input('Enter your function: ');
a = input('Enter lower limit1: ');
b = input('Enter upper limit1: ');
m = input('Enter lower limit2: ');
n = input('Enter upper limit2: ');
max_steps = input('Enter maximum steps: ');

error = zeros(1,max_steps);

for i=1:max_steps

    steps_x = i;
    steps_y = i;
    solution = double_integral_function(g,a,b,m,n,steps_x,steps_y);

    actual = integral2(g,m,n,a,b);
    error(i) = abs(actual-solution);
end

plot(1:max_steps,error);
grid on