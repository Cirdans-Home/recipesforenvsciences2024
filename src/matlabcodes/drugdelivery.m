%% Drug Delivery
% This script will be used to solve a simple drug-delivery model in the form
% of two linear coupled odes

clear; clc; close all; % Clean the memory

k1 = 0.9776;      % Transition rate between stomach and blood
ke = 0.2213;      % Eliminatio rate from the blood
A = [ -k1 0; k1 -ke]; % Two by two matrix
f = @(t,y) A*y;   % Right-hand side of the ODE
y0 = [600;0]; % firt component is the initial condition for y1, the second for y2
t0 = 0;
tf = 6;
[T,Y] = ode45(@(t,y) f(t,y),[t0,tf],y0);

figure(1)
plot(T,Y(:,1),'r-')
xlabel('T (h)')
ylabel('y_1(t)')
figure(2)
plot(T,Y(:,2),'r-')
xlabel('T (h)')
ylabel('y_2(t)')
