% forward_kinematics.m
% Computes the end-effector position of a 4-DOF robotic arm

clc;
clear;

% Symbolic variables
syms theta1 theta2 theta3 theta4
syms L1 L2 L3 L4

% Forward Kinematics Equations
X = cos(theta1) * (L2*cos(theta2) + ...
                   L3*cos(theta2+theta3) + ...
                   L4*cos(theta2+theta3+theta4));

Y = sin(theta1) * (L2*cos(theta2) + ...
                   L3*cos(theta2+theta3) + ...
                   L4*cos(theta2+theta3+theta4));

Z = L1 + L2*sin(theta2) + ...
         L3*sin(theta2+theta3) + ...
         L4*sin(theta2+theta3+theta4);

disp('End Effector Position:')
disp(['X = ', char(X)])
disp(['Y = ', char(Y)])
disp(['Z = ', char(Z)])