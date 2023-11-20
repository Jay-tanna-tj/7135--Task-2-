% Creating a new Mamdani-type fuzzy inference system
fis = mamfis('Name', 'Heating');

% Adding input variables (Temperature, Time of Day, Weather)
fis = addInput(fis, [0 40], 'Name', 'Temperature');
fis = addInput(fis, [0 24], 'Name', 'TimeOfDay');
fis = addInput(fis, [1 5], 'Name', 'Weather');

% Adding output variable (Heating Level)
fis = addOutput(fis, [0 10], 'Name', 'HeatingLevel');

% Defining membership functions for Temperature
fis = addMF(fis, 'Temperature', 'trimf', [0 0 10], 'Name', 'VeryCold');
fis = addMF(fis, 'Temperature', 'trimf', [5 10 15], 'Name', 'Cold');
fis = addMF(fis, 'Temperature', 'trimf', [10 20 30], 'Name', 'Cool');
fis = addMF(fis, 'Temperature', 'trimf', [18 24 30], 'Name', 'Comfortable');
fis = addMF(fis, 'Temperature', 'trimf', [22 30 38], 'Name', 'Warm');
fis = addMF(fis, 'Temperature', 'trimf', [30 40 40], 'Name', 'Hot');

% Defining membership functions for Time of Day
fis = addMF(fis, 'TimeOfDay', 'trimf', [5 9 12], 'Name', 'Morning');
fis = addMF(fis, 'TimeOfDay', 'trimf', [12 14 16], 'Name', 'Afternoon');
fis = addMF(fis, 'TimeOfDay', 'trimf', [17 18 23], 'Name', 'Evening');
fis = addMF(fis, 'TimeOfDay', 'trimf', [0 2 4], 'Name', 'Night');

% Defining membership functions for Weather
fis = addMF(fis, 'Weather', 'trimf', [1 1 2], 'Name', 'Sunny');
fis = addMF(fis, 'Weather', 'trimf', [1 2 3], 'Name', 'Cloudy');
fis = addMF(fis, 'Weather', 'trimf', [2 3 4], 'Name', 'Rainy');
fis = addMF(fis, 'Weather', 'trimf', [3 4 5], 'Name', 'Snowy');
fis = addMF(fis, 'Weather', 'trimf', [4 5 5], 'Name', 'Windy');

% Defining membership functions for Heating Level
fis = addMF(fis, 'HeatingLevel', 'trimf', [0 0 2.5], 'Name', 'Off');
fis = addMF(fis, 'HeatingLevel', 'trimf', [2 4 6], 'Name', 'Low');
fis = addMF(fis, 'HeatingLevel', 'trimf', [4 6 8], 'Name', 'Medium');
fis = addMF(fis, 'HeatingLevel', 'trimf', [6 8 10], 'Name', 'High');
fis = addMF(fis, 'HeatingLevel', 'trimf', [7.5 10 10], 'Name', 'VeryHigh');

% Defining the rules based on the provided rule base
rules = [
    % Temperature, TimeOfDay, Weather, HeatingLevel, Weight, Connection
    1, 1, 1, 4, 1, 1; % Rule 1
    2, 1, 1, 3, 1, 1; % Rule 2
    3, 1, 1, 1, 1, 1; % Rule 3
    1, 2, 1, 4, 1, 1; % Rule 4
    2, 2, 1, 3, 1, 1; % Rule 5
    3, 2, 1, 2, 1, 1; % Rule 6
    1, 3, 1, 5, 1, 1; % Rule 7
    2, 3, 1, 4, 1, 1; % Rule 8
    3, 3, 1, 2, 1, 1; % Rule 9
    1, 1, 2, 4, 1, 1; % Rule 10
    2, 1, 2, 4, 1, 1; % Rule 11
    3, 1, 2, 3, 1, 1; % Rule 12
    1, 2, 2, 3, 1, 1; % Rule 13
    2, 2, 2, 3, 1, 1; % Rule 14
    3, 2, 2, 2, 1, 1; % Rule 15
    1, 3, 2, 5, 1, 1; % Rule 16
    2, 3, 2, 4, 1, 1; % Rule 17
    3, 3, 2, 3, 1, 1; % Rule 18
    1, 1, 3, 4, 1, 1; % Rule 19
    2, 1, 3, 3, 1, 1; % Rule 20
    3, 1, 3, 2, 1, 1; % Rule 21
    1, 2, 3, 5, 1, 1; % Rule 22
    2, 2, 3, 4, 1, 1; % Rule 23
    3, 2, 3, 2, 1, 1; % Rule 24
    1, 3, 3, 5, 1, 1; % Rule 25
    2, 3, 3, 4, 1, 1; % Rule 26
    3, 3, 3, 3, 1, 1; % Rule 27
    1, 0, 0, 5, 1, 1; % Rule 28
    2, 0, 0, 4, 1, 1; % Rule 29
    3, 0, 0, 3, 1, 1; % Rule 30
    4, 0, 0, 1, 1, 1; % Rule 31
    5, 0, 0, 1, 1, 1; % Rule 32
    6, 0, 0, 1, 1, 1; % Rule 33
    1, 4, 4, 5, 1, 1; % Rule 34
    2, 4, 4, 5, 1, 1; % Rule 35
    4, 4, 4, 3, 1, 1; % Rule 36
    1, 3, 4, 5, 1, 1; % Rule 37
    2, 3, 4, 5, 1, 1; % Rule 38
    3, 3, 4, 4, 1, 1; % Rule 39
    1, 4, 3, 4, 1, 1; % Rule 40
    2, 4, 3, 3, 1, 1; % Rule 41
    3, 4, 3, 3, 1, 1; % Rule 42
];

% Adding rules to the FIS
fis = addRule(fis, rules);



% Some input values
temperature = 10;
timeOfDay = 23;
weather = 4;

% Evaluate the FIS
output = evalfis(fis, [temperature, timeOfDay, weather]);

% Display the output
disp(output);     

% Plot the membership functions for the Temperature input variable
figure;
plotmf(fis, 'input', 1);

% Plot the membership functions for the TimeOfDay input variable
figure;
plotmf(fis, 'input', 2);

% Plot the membership functions for the Weather input variable
figure;
plotmf(fis, 'input', 3);

% Plot the membership functions for the HeatingLevel output variable
figure;
plotmf(fis, 'output', 1);

% Generate a surface plot of the FIS
figure;
gensurf(fis);
title('Surface plot of the Fuzzy Inference System');
 