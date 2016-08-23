%% Tranpose Matrix fake data
%fake' ;

%% Tranpsoe Matrix human data
%human';

%% remove columns 
%fakeDataset(: , 501:3202) = []
%humanDataset(: , 501:1946) = []

%% creating one matrix 
%inputValues = [fakeDataset humanDataset];
%save('inputValues.mat','inputValues')

%% Remove first row
%ans(1,:) =[]

%% Creating .mat files from CSV
%humanDataset = csvread('human_app2.csv');
%save('humanDataset.mat','humanDataset');

%% Filling the targetValue matrix
%targetValues(:,500) = 0;

%% Creating a network
%% normalizedInputsValues = mapminmax(inputValues);
%% remove = inputValues([1,3:end] , : );
%% remove = inputValues([1:10] , : );
%% remove = inputValues([1,6,10] , : );
%% a = min(inputValues(:));
%% b = max(inputValues(:));
%%  ra = 1;
%%  rb = 0;
%%  normalizedInputsValues = (((ra-rb) * (inputValues - a)) / (b - a)) + rb;
%%  a = min(remove(:));
%%  b = max(remove(:));
%%   ra = 1;
%%   rb = 0;
%%   normalizedInputsValues = (((ra-rb) * (remove - a)) / (b - a)) + rb;
%%net = newff(remove , targetValues, [2], {'tansig' 'logsig'}, 'trainrp', ...
%%           '', 'mse', {}, {}, '');

net = newff(inputValues, targetValues, [2], {'tansig' 'logsig'}, 'trainrp', ...
           '', 'mse', {}, {}, '');

%% 
figure    % Create a new figure.
ax = axes % Get a handle to the figure's axes.
hold on   % Set the figure to not overwrite old plots.
grid on   % Turn on the grid.
 
for k = 1:10 
title(ax, 'learning rate');
%train the network
   net = init(net); 
   [trained_net, stats] = train(net, inputValues , targetValues);
   plot(ax, stats.perf)
end

plotconfusion(targetValues, sim(trained_net, inputValues))
