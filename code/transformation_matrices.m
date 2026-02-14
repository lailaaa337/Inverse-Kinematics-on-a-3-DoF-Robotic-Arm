% transformation_matrices.m
% Computes full homogeneous transformation matrix

clc;
clear;

syms theta1 theta2 theta3 theta4
syms L1 L2 L3

% Rotation matrices
RotZ = @(theta) [cos(theta) -sin(theta) 0 0;
                 sin(theta)  cos(theta) 0 0;
                 0           0          1 0;
                 0           0          0 1];

RotX = @(alpha) [1 0 0 0;
                 0 cos(alpha) -sin(alpha) 0;
                 0 sin(alpha)  cos(alpha) 0;
                 0 0 0 1];

% Translation matrix
TransX = @(a) [1 0 0 a;
               0 1 0 0;
               0 0 1 0;
               0 0 0 1];

% Individual transformations
T1 = RotZ(theta1) * RotX(pi/2);
T2 = RotZ(theta2) * TransX(L1);
T3 = RotZ(theta3) * TransX(L2);
T4 = RotZ(theta4) * TransX(L3);

% Total transformation
T_total = simplify(T1 * T2 * T3 * T4);

disp('Full Transformation Matrix:')
disp(T_total)