%% Using MATLAB to read serial output from an Arduino in real time
% Authors: ENGR114 Student Group Spring 2017
% Revised: 05/31/17
% Version: 2.1
% Licence: Open source BSD Licence

%% Clear variables, commandline, figures and existing serial ports
clc,clear all
close all
delete(instrfindall); %deletes any exhisting serial ports
%% Open the serial port to connect to the Arduino
% change 'COM4' to the port the arduino is connected to
a=serial('COM4','BaudRate',9600);
fopen(a);

%% set up the animated figure

time_interval = input('For how many seconds would you like to measure the water level? ')

figure
h = animatedline;
ax = gca;              % gca - get current axis. Allows axis to be modified.
ax.YGrid = 'on';       % include a grid on the plot._program
ax.YLim = [0 15];   % the serial output range
xlabel('time (in seconds)')
ylabel('water depth (in inches)')
title('water depth vs. time')
grid on


x=linspace(1,time_interval,time_interval); % can change to change the number of data points 
startTime = datetime('now'); %saves the current time

user_choice = input('Would you like to save the figure (1 for yes/2 for no)? ')
if user_choice == 1
    savefig('water depth vs. time.fig')
end


%% collect serial data from the arduino
serial_data = [0]
for i=1:length(x);
    serial_read = -(fscanf(a,'%f')/150)+14.667 % reads to serial output
    serial_data(end+1)=fscanf(a,'%f'); % saves the serial output
    t =  datetime('now') - startTime; % updates the time
    addpoints(h,datenum(t),serial_read) % adds the data point to the figure
    
    ax.XLim = datenum([t-seconds(15) t]); % Update axes
    datetick('x','keeplimits') % update tick marks
    drawnow % draw in the data point
end

%% Close the arduino serial object
fclose(a);
delete(a)
clear a;
disp('Serial Port is closed')
