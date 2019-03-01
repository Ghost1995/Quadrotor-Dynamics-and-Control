function [desired_state] = circle(t, qn)
% CIRCLE trajectory generator for a circle

% =================== Your code goes here ===================
% You have to set the pos, vel, acc, yaw and yawdot variables

T = t/10;
if T == 0
    pos = [5; 0; 0];
    vel = [0; 0; 0];
    acc = [0; 0; 0];
elseif T >= 1
    pos = [5; 0; 2.5];
    vel = [0; 0; 0];
    acc = [0; 0; 0];
else
        pos = [5*cos(2*pi*T); 5*sin(2*pi*T); 2.5*T];
        vel = [-10*pi*sin(2*pi*T); 10*pi*cos(2*pi*T); 2.5]/10;
        acc = [-20*pi*pi*cos(2*pi*T); -20*pi*pi*sin(2*pi*T); 0]/100;
end
yaw = 0;
yawdot = 0;

% =================== Your code ends here ===================

desired_state.pos = pos(:);
desired_state.vel = vel(:);
desired_state.acc = acc(:);
desired_state.yaw = yaw;
desired_state.yawdot = yawdot;

end