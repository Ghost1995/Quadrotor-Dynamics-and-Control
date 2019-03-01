function [F, M, trpy, drpy] = controller(qd, t, qn, params)
% CONTROLLER quadrotor controller
% The current states are:
% qd{qn}.pos, qd{qn}.vel, qd{qn}.euler = [roll;pitch;yaw], qd{qn}.omega
% The desired states are:
% qd{qn}.pos_des, qd{qn}.vel_des, qd{qn}.acc_des, qd{qn}.yaw_des, qd{qn}.yawdot_des
% Using these current and desired states, you have to compute the desired controls

% =================== Your code goes here ===================

Kpl = [1; 15; 10];
Kdl = [8; 10; 7];
Kpa = [0.3; 0.5; 1];
Kda = [0.05; 0.01; 1];

if t ~= 0
    err_pos = qd{qn}.pos_des - qd{qn}.pos;
    err_vel = qd{qn}.vel_des - qd{qn}.vel;
    acc = Kpl.*err_pos + Kdl.*err_vel + qd{qn}.acc_des;
else
    acc = qd{qn}.acc_des;
end

% Desired roll, pitch and yaw
phi_des = (acc(1)*sin(qd{qn}.yaw_des) - acc(2)*cos(qd{qn}.yaw_des))/params.grav;
if abs(phi_des) > params.maxangle
    phi_des = sign(phi_des) * params.maxangle;
end

theta_des = (acc(1)*cos(qd{qn}.yaw_des) + acc(2)*sin(qd{qn}.yaw_des))/params.grav;
if abs(theta_des) > params.maxangle
    theta_des = sign(theta_des) * params.maxangle;
end

psi_des = qd{qn}.yaw_des;

% Thrust
F = params.mass*(params.grav + acc(3));
if F > params.maxF
    F = params.maxF;
elseif F < params.minF
    F = params.minF;
end

% Moment
M = [Kpa(1)*(phi_des - qd{qn}.euler(1)) - Kda(1)*qd{qn}.omega(1);Kpa(2)*(theta_des - qd{qn}.euler(2)) - Kda(2)*qd{qn}.omega(2);Kpa(3)*(psi_des - qd{qn}.euler(3)) - Kda(3)*qd{qn}.omega(3)]; % You should fill this in

% =================== Your code ends here ===================

% Output trpy and drpy as in hardware
trpy = [F, phi_des, theta_des, psi_des];
drpy = [0, 0,       0,         0];

end