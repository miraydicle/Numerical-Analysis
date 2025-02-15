%% Fixed Point Iteration Method
g = input('Enter your function: ');
x0 = input('Enter your initial guess: ');
e = input('Enter tolerance: ');
n = input('Enter no of iterations: ');

[solution,iteration,is_valid] = fixed_point_function(g,x0,e,n);

fplot(g);
hold on
plot(solution,0,'*b');
grid on
%% Newton Method

f = input('Enter your function: ');
df = input('Enter derivative of this function: ');
x0 = input('Enter your initial guess: ');
e = input('Enter tolerance: ');
n = input('Enter no of iterations: ');

[solution,iteration,is_valid] = newton_function(f,df,x0,e,n);

fplot(f);
hold on
plot(solution,0,'*b');
grid on
%% Secant Method

f = input('Enter your function: ');
x0 = input('Enter your first initial guess: ');
x1 = input('Enter your second initial guess: ');
e = input('Enter tolerance: ');
n = input('Enter no of iterations: ');

[solution,iteration,is_valid] = secant_function(f,x0,x1,e,n);

fplot(f);
hold on
plot(solution,0,'*b');
grid on