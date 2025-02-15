syms t;
syms i(t) V_c(t)

s = sin(2*pi*100*t);
Vin_is_double = strcmp(char(class(s)), 'double');

% Convert Vin_str into Vin, either as a const or function of t
if Vin_is_double
   Vin = s;  % Vin as a const
else
   Vin = matlabFunction(s); % Vin as a function of t
end

% Circuit parameters
R = 260;  % Ohm
L = 0.5;  % Henry
C = 0.0000035; % Farad

% Initial conditions
qi = 0.000000005; % Coulomb
Vc_i = 0; % Volts
y0 = [qi/L, Vc_i]; % initial state vector

% Set time range and interval size
ti = 0; % initial time
tf = 0.05; % final time
tspan = [ti tf]; % time span for simulation

% Define ODE function
ode_fun = @(t,y) [1/L*(Vin(t) - R*y(1) - y(2)); 1/C*y(1)];

% Solve ODE system
[t_vals, y_vals] = ode45(ode_fun, tspan, y0);

% Extract solution variables
i_vals = y_vals(:,1);
V_c_vals = y_vals(:,2);
V_r_vals = R*i_vals;
V_l_vals = L*gradient(i_vals, t_vals);

% Plot graph
figure;
if Vin_is_double
    plot(t_vals, ones(size(t_vals))*s, 'k:');
else
    plot(t_vals, Vin(t_vals), 'k:');
end
hold on;
plot(t_vals, V_c_vals, t_vals, V_r_vals, t_vals, V_l_vals);
title('Voltage across R, L and C');
xlabel('Time/s');
ylabel('Voltage/V');
legend('Vin(t)', 'V_C(t)', 'V_R(t)', 'V_L(t)');