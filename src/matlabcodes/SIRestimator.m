%% SIR Parameer Estimator

clear; clc; close all;

rng(10);

% We order the variables as y(t) = [S(t),I(t)]
% lambda = theta(1) gamma = theta(2)
sirModel = @(t,y,theta) [-theta(1)*y(1)*y(2); ...
    theta(1)*y(1)*y(2)-theta(2)*y(2);...
    theta(2)*y(2)];

% Then we have the function solving the model
sirSOL = @(theta,IC,t) deval(ode45( @(t,y) sirModel(t,y,theta),t,IC),t);

% We start by generating some fictitious data for our problem
numpts=20;
tdata = [0, sort(20*rand (1,numpts))];
width = 0.1;
ndataSIR = 20*[0, normrnd(0,width,[1,numpts]);
    0, normrnd(0,width,[1,numpts]);
    0, normrnd(0,width,[1,numpts])];

lambda = 0.01;
gamma = 0.1;
S0 = 50;
I0 = 1;
R0 = 0;
theta = [lambda; gamma];
IC = [S0; I0; R0];
SIRData = sirSOL(theta,IC,tdata) + ndataSIR;

% We will only use the data for I(t) and N(t) to optimize the parameters
SIRDatared = [0 1 0; 1 1 1]*SIRData;

% Let us look at the data we have obtained
figure(1)
plot(tdata,SIRDatared(1,:),'*',tdata,SIRDatared(2,:),'x')
xlabel('t')
legend('I(t)','S(t) + I(t) + R(t)')

% Now we build the function we wish to optimize
SIRthetaSol = @(theta,t) [0 1 0;1 1 1]*sirSOL([theta(1) theta(2)],IC,t);
objective = @(theta) sum(sum( (SIRthetaSol(theta,tdata) - SIRDatared).^2 ));

options = optimset('Display','iter');
[SIRtheta, fval, exitflag] = ...
    fmincon(objective,[0.1 4],[],[],[],[],[0 0],[1 4],[],options);

tsol = linspace(0,max(tdata),400);
SIRSOL = sirSOL(SIRtheta,IC,tsol);

figure(1)
plot(tdata,SIRData(1,:),'b*',...
    tdata,SIRData(2,:),'rx',...
    tdata,SIRData(3,:),'g^',...
    tdata,sum(SIRData),'k.',...
    tsol,SIRSOL(1,:),'b-',tsol,SIRSOL(2,:),'r-',tsol,SIRSOL(3,:),'g-',...
    tsol,sum(SIRSOL),'k--');
xlabel('t')
legend({'S^*(t)','I^*(t)','R^*(t)','N^*(t)',...
    'S(t)','I(t)','R(t)','N'},'Location','eastoutside')
axis tight

