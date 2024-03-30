clear; clc; close all

N = 261;         % Size of the population
I0 = 7;          % Initially infected
S0 = N-I0;       % Number of susceptible individuals
lambda = 0.0178; % Transmission coefficient
gamma = 2.73;    % Recovery rate

% We order the variables as y(t) = [S(t),I(t)]
f = @(t,y) [-lambda*y(1)*y(2); lambda*y(1)*y(2)-gamma*y(2)];
[T,Y] = ode45(@(t,y) f(t,y),linspace(0,5,1000),[S0;I0]);

% We plot the three curves on the same graph
figure(1)
plot(T,Y(:,1),'r-',...
    T,Y(:,2),'b-',...
    T,N-Y(:,1)-Y(:,2),'c-',...
    T,N*ones(size(T)),'k--','LineWidth',2);
xlabel('Time')
ylabel('Population')
legend({'S(t)','Y(t)','R(t)'},'Location','best')
axis tight

figure(2)
plot(Y(:,1),Y(:,2),'LineWidth',2);
xlabel('S(t)');
ylabel('Y(t)');