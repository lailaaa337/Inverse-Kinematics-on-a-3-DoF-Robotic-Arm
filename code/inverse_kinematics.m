% inverse_kinematics.m
% Uses Robotics System Toolbox

clc;
clear;

% Create rigid body tree
robot = rigidBodyTree('DataFormat','column','MaxNumBodies',4);

% Define links
L1 = 1;
L2 = 1;
L3 = 1;

% Joint 1
body1 = rigidBody('link1');
joint1 = rigidBodyJoint('joint1','revolute');
setFixedTransform(joint1,trvec2tform([0 0 0]) * axang2tform([1 0 0 pi/2]));
body1.Joint = joint1;
addBody(robot,body1,'base');

% Joint 2
body2 = rigidBody('link2');
joint2 = rigidBodyJoint('joint2','revolute');
setFixedTransform(joint2,trvec2tform([L1 0 0]));
body2.Joint = joint2;
addBody(robot,body2,'link1');

% Joint 3
body3 = rigidBody('link3');
joint3 = rigidBodyJoint('joint3','revolute');
setFixedTransform(joint3,trvec2tform([L2 0 0]));
body3.Joint = joint3;
addBody(robot,body3,'link2');

% Joint 4
body4 = rigidBody('link4');
joint4 = rigidBodyJoint('joint4','revolute');
setFixedTransform(joint4,trvec2tform([L3 0 0]));
body4.Joint = joint4;
addBody(robot,body4,'link3');

% Inverse Kinematics Solver
ik = inverseKinematics('RigidBodyTree',robot);

% Desired end-effector pose
targetPose = trvec2tform([1.5 0.5 1]);

% Initial guess
initialGuess = robot.homeConfiguration;

% Solve IK
[configSol,solInfo] = ik('link4',targetPose,[1 1 1 0 0 0],initialGuess);

disp('Joint Angles Solution:')
disp(configSol)