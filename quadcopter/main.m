%%
clc
%close all
clear

%% ranadom values for Kp Km
% kp = 1.5E-5
% km = 2E-5

%% Guidance

% t = 0:0.1:1;
t = linspace(0, 1, 100);
vm = 20;
tm = 0.9;

% attitude reference:   qd = [q0d, q1d, q2d, q3d]^T;
q0d = [];
q2d = [];
% quat_ref = [];

for i=1:length(t)
    q0d(i) = (2/(1+exp(-vm*(t(i)-tm/2))))-1;
    q2d(i) = sqrt(1-q0d(i)^2);
%     quat_ref(i) = quaternion(q0d(i), 0, q2d(i), 0);
end

col0 = zeros(1,100);
quat_ref = quaternion(q0d', col0', q2d', col0');

%plot
figure
plot(t, q0d, LineWidth=0.5)
hold on
plot(t, q2d, LineWidth=0.5)
legend

rotm = quat2rotm(quat_ref)

