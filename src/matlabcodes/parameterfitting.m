%% Parameter fitting

clear; clc; close all;

%% Rumford of Bavaria

data = [ 4 126 % Time (min) and Temperature (°F)
  5 125
  7 123
  12 120
  14 119
  16 118
  20 116
  24 115
  28 114
  31 113
  34 112
  37.5 111
  41 110
];

fo = fitoptions('Method','NonlinearLeastSquares',...
               'Lower',[0],...
               'Upper',[Inf],...
               'StartPoint',[1]);
ft = fittype('60 + 70*exp(-a*x)','options',fo);
[curve,gof] = fit(data(:,1),data(:,2),ft);

figure(1)
plot(curve,data(:,1),data(:,2))
xlabel('Time (m)');
ylabel('Temperature (°F)');

%% Puromycin

data = [ % substrate treated untreated
  0.02 76 67
  0.02 47 51
  0.06 97 84
  0.06 107 86
  0.11 123 98
  0.11 139 115
  0.22 159 131
  0.22 152 124
  0.56 191 144
  0.56 201 158
  1.10 207 160
  1.10 200 NaN   
 ];

fo = fitoptions('Method','NonlinearLeastSquares',...
               'Lower',[0,0],...
               'Upper',[Inf,Inf],...
               'StartPoint',[1 1]);
ft = fittype('a*x./(b + x)','options',fo);

[curve1,gof1] = fit(data(:,1),data(:,2),ft);
[curve2,gof2] = fit(data(1:end-1,1),data(1:end-1,3),ft);

figure(2)
hold on
    plot(curve1,'r-',data(:,1),data(:,2),'rx');
    plot(curve2,'b-',data(1:end-1,1),data(1:end-1,3),'bo');    
hold off
xlabel('Substrate Concentration');
ylabel('Velocity');

%% Leafs

data = [ % Time (days) Leaf length (cm)
  0.5 1.3
  1.5 1.3
  2.5 1.9
  3.5 3.4
  4.5 5.3
  5.5 7.1
  6.5 10.6
  7.5 16.0
  8.5 16.4
  9.5 18.3
  10.5 20.9
  11.5 20.5
  12.5 21.3
  13.5 21.2
  14.5 20.9
];

fo = fitoptions('Method','NonlinearLeastSquares',...
               'Lower',[0,0,0,0],...
               'Upper',[Inf,Inf,Inf,Inf],...
               'StartPoint',[1 1 1 1]);
ft = fittype('a./(1 + b.*exp(-c*x)).^(1/d)','options',fo);

[curve,gof] = fit(data(:,1),data(:,2),ft);

figure(3)
plot(curve,data(:,1),data(:,2));
xlabel('Substrate Concentration');
ylabel('Velocity');


%% Chlorine example

data = csvread('chlorine.csv',1,0);

figure(1)
plot(data(:,1),data(:,2),'o')
xlabel('Time (s)');
ylabel('Concentration %');

fo = fitoptions('Method','NonlinearLeastSquares',...
               'Lower',[0,0,0],...
               'Upper',[Inf,Inf,Inf],...
               'StartPoint',[1 1 1]);
ft = fittype('a*(1-b*exp(-c*x))','options',fo);

[curve,gof] = fit(data(:,1),data(:,2),ft);
ci = confint(curve,0.95);

figure(4)
plot(curve)