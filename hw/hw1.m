% ASEN 5050
% HW #1
% 9/2/2012
% Kevin Dinkel
%% Set-up:
close all; clear all; clc; addpath('../util');

%% Problem 1:

%% Problem 2:
mu = 398600.4418; % km^3/s^2
dt = 50 * 60; %s
hp = 300; % km
ha = 600; % km
v = 320; % deg
Re = 6378.1; % km

% Get satellite COE:
A0 = alt2COE(ha,hp,Re);
A0(6) = degtorad(v);

% Propagate COE foward:
A = propagate2body(A0,dt,mu);

% Print Results:
fprintf('\nProblem 1: \n');
printCOE(A);

%% Problem 3:
hp1 = 798; % km
ha1 = 816; % km
hp2 = 795; % km
ha2 = 814; % km

% Get satellite COEs:
A1 = Alt2COE(ha1,hp1,Re);
A2 = Alt2COE(ha2,hp2,Re);

% Calculate period:
P1 = 2*pi*sqrt(A1(1)^3/mu);
P2 = 2*pi*sqrt(A2(1)^3/mu);

% Print results:
fprintf('\nProblem 2: \n');
fprintf('a error: %f km\n',A2(1) - A1(1));
fprintf('e error: %f\n',A2(2) - A1(2));
fprintf('P error: %f s\n',P2 - P1);

%% Problem 4:
r = [-5633.9; -2644.9; 2834.4]; % km
v = [2.39805; -7.02301; -1.79578]; % km/s

% Convert to COE:
O = COE2ORBIT(RV2COE(r,v,mu),mu);

% Print Results:
fprintf('\nProblem 4: \n');
printORBIT(O);
fprintf('Hp = %f km\n',O(10) - Re);
fprintf('Ha = %f km\n',O(11) - Re);
fprintf('phi = %f deg\n',rad2deg(FPA(ORBIT2COE(O))));

%% Problem 5:
fprintf('\nProblem 5: \n');
fprintf('FPA = 0 deg\n');
fprintf('R = 2 * Re = %f km\n', 2*Re);
fprintf('V = sqrt(mu/r) = %f km/s\n', sqrt(mu/(2*Re)));

%% Problem 6:
Amerc = zeros(6,1);
Amerc(1) = 0.387 * 149598000; % km
Amerc(2) = 0.205;

% Get the rest of the COE:
mu_s = 132712440018; % km^3/s^2
Omerc = COE2ORBIT(Amerc,mu_s);

% Print results:
fprintf('\nProblem 6: \n');
printORBIT(Omerc);
fprintf('P  = %f years\n',Omerc(7)/31558149.8);
fprintf('Vp = %f km/s\n',sqrt((2*mu_s/Omerc(10)) - (mu_s/Omerc(1))));

%% Problem 7:
r = [-5633.9; -2644.9; 2834.4]; % km
v = [2.39805; -7.02301; -1.79578]; % km/s

% Convert to COE:
O = COE2ORBIT(RV2COE(r,v,mu),mu);
h = cross(r,v);

fprintf('\nProblem 7: \n');
fprintf('E  = %f km^2/s^2\n',O(8));
fprintf('hx = %f km^2/s\n',h(1));
fprintf('hx = %f km^2/s\n',h(2));
fprintf('hx = %f km^2/s\n',h(3));
fprintf('|h| = %f km^2/s\n',norm(h));






