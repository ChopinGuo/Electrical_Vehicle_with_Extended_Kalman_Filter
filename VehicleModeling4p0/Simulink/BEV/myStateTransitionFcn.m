function x = myStateTransitionFcn(x,u)
% Sampe time (s)
dt = 0.1;

% Using Euler discretization, states at time
% step k+1 can be calulated given states
% and input at time step k

% parameters
massVeh = 2300;
airDensity = 1.23;
aeroDragCoeff = 0.38;
frontArea = 2.1;
gravity = 9.81;
inclinationAngle = 0;
rollingResistCoeff = 0.01;

Faero = 0.5*airDensity*aeroDragCoeff*frontArea*x(2)^2;
Fgrade = massVeh*gravity*sin(inclinationAngle);
Frr = massVeh*gravity*rollingResistCoeff;

x = x + [x(2); 1/massVeh*(u-Faero-Fgrade-Frr)]*dt;
end