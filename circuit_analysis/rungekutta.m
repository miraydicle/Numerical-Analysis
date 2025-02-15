% Command line argument
    syms t;                     % create a symbol, needed to parse Vin_str
    s = sin(2*pi*100*t);          % converts string to epression/constant
    s_type = char(class(s));    % get type for if condition
    Vin_is_double = strcmp(s_type,'double');

    % Convert Vin_str into Vin, either as a const or function of t
    if(Vin_is_double)
       Vin = s;                 % Vin as a const
    else
       Vin = matlabFunction(s); % Vin as a function of t
    end

    % Circuit parameters
    R = 260;                    % Ohm
    L = 0.5;                    % Henry
    C = 0.0000035;              % Farad

    % Circuit initial conditions
    qi = 0.000000005;           % Coulomb
    ii = 0;                     % Ampere

    % Set time range and interval size
    ti = 0;                     % initial time
    tf = 0.05;                  % final time
    h = 0.0001;                 % time interval size

    % Coupled 1st order ODEs
    dq = @(t,q,i) i;
    if(Vin_is_double)
       di = @(t,q,i) (1/L)*(Vin - R*i - (1/C)*q);
    else
       di = @(t,q,i) (1/L)*(Vin(t) - R*i - (1/C)*q);
    end
    
    % Applying numerical method
    N = round((tf-ti)/h);       % total number of steps
    t = zeros(1,N);             % [1 x N] matrix of 0's
    q = zeros(1,N);
    i = zeros(1,N);

    % Set initial conditions
    t(1) = ti;
    q(1) = qi;
    i(1) = ii;

% RK4 method
for n = 1:N-1
    k1q = h * dq(t(n), q(n), i(n));
    k1i = h * di(t(n), q(n), i(n));
    
    k2q = h * dq(t(n) + h/2, q(n) + k1q/2, i(n) + k1i/2);
    k2i = h * di(t(n) + h/2, q(n) + k1q/2, i(n) + k1i/2);
    
    k3q = h * dq(t(n) + h/2, q(n) + k2q/2, i(n) + k2i/2);
    k3i = h * di(t(n) + h/2, q(n) + k2q/2, i(n) + k2i/2);
    
    k4q = h * dq(t(n) + h, q(n) + k3q, i(n) + k3i);
    k4i = h * di(t(n) + h, q(n) + k3q, i(n) + k3i);
    
    t(n+1) = t(n) + h;
    q(n+1) = q(n) + (1/6)*(k1q + 2*k2q + 2*k3q + k4q);
    i(n+1) = i(n) + (1/6)*(k1i + 2*k2i + 2*k3i + k4i);
end

    % Plot graph
    V_C = (1/C)*q;
    V_R = R*i;
    figure;
    if(Vin_is_double)
        plot(t, ones(size(t))*Vin, 'k:');
        V_L = Vin - V_R - V_C;
    else
        plot(t, Vin(t),'k:');
        V_L = Vin(t) - V_R - V_C;
    end
    hold on;
    plot(t, V_C, t, V_R, t, V_L);

    title('Voltage across R, L and C with Runge-Kutta Method');
    xlabel('Time/s');
    ylabel('Voltage/V');
    legend('Vin(t)','V_C = (1/C)*q','V_R = R*q''','V_L = L*q''''');
