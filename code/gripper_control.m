% gripper_control.m
% Basic gripper open/close simulation logic

clc;
clear;

% This assumes connection to CoppeliaSim Remote API

disp('Connecting to CoppeliaSim...')

% Example logic (pseudo-implementation)
gripperState = 0; % 0 = open, 1 = closed

while true
    
    command = input('Enter 1 to close, 0 to open, -1 to exit: ');
    
    if command == -1
        break;
    end
    
    if command == 1
        gripperState = 1;
        disp('Gripper Closed');
        % Add API command to close gripper
    else
        gripperState = 0;
        disp('Gripper Opened');
        % Add API command to open gripper
    end
    
end

disp('Simulation Ended');