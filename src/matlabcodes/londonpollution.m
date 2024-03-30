%% London Pollution Data
% Analysis of the Pollution data from London.

clear; clc; close all;

london = readtable('london_combined_2019_all.csv');

index = strcmp(london.location,'London Eltham');

figure(1)
plot(london.utc(index),london.value(index),'o')
xlabel('UTC');
ylabel('pm25 ug/m3');


%% All location different subplots
location = unique(london.location);

for i=1:length(location)
    index = strcmp(london.location,location{i});
    figure(2)
    subplot(5,2,i)
    plot(london.utc(index),london.value(index),'o')
    xlabel('UTC');
    ylabel('pm25 ug/m3');
    title(location{i});
end

%% All locations same plot
Markers = {'+','o','*','x','v','d','^','s','>','<'};
for i=1:length(location)
    index = strcmp(london.location,location{i});
    figure(3)
    hold on
    plot(london.utc(index),london.value(index),Markers{i},'DisplayName',location{i})
    hold off
end
xlabel('UTC');
ylabel('pm25 ug/m3');
legend('Location','eastoutside');

%% Producin a box plot
figure(4)
boxplot(london.value,london.location);
ylabel('pm25 ug/m3');
xtickangle(30)

%% Put data on a map
latitude = zeros(10,1);
longitude = zeros(10,1);
average = zeros(10,1);
for i=1:10
    index = strcmp(london.location,location{i});
    latitude(i) = unique(london.latitude(index));
    longitude(i) = unique(london.longitude(index));
    average(i) = mean(london.value(index));
end
figure(5)
tab = table(latitude,longitude,average);
gb = geobubble(tab,'latitude','longitude', ...
    'SizeVariable','average');
gb.SizeLegendTitle = 'Average pm25';
geobasemap colorterrain

figure(6)
gb = geobubble(tab,'latitude','longitude', ...
    'SizeVariable','average');
gb.SizeLegendTitle = 'Average pm25';
name = 'openstreetmap';
url = 'a.tile.openstreetmap.org';
copyright = char(uint8(169));
attribution = copyright + "OpenStreetMap contributors";
addCustomBasemap(name,url,'Attribution',attribution)
geobasemap openstreetmap
gb.MapLayout = 'maximized';
