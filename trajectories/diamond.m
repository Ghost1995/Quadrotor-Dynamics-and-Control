function [desired_state] = diamond(t, qn)
% DIAMOND trajectory generator for a diamond

% =================== Your code goes here ===================
% You have to set the pos, vel, acc, yaw and yawdot variables

T = t/15;
if T == 0
    pos = [0; 0; 0];
    vel = [0; 0; 0];
elseif T < 0.25
    pos = [0.25*(4*T); 2*(4*T); 2*(4*T)];
    vel = [1; 8; 8]/15;
elseif T < 0.5
    pos = [0.25*(4*(T - 0.25)) + 0.25; -2*(4*(T - 0.25)) + 2; 2*(4*(T - 0.25)) + 2];
    vel = [1; -8; 8]/15;
elseif T < 0.75
    pos = [0.25*(4*(T - 0.5)) + 0.5; -2*(4*(T - 0.5)); -2*(4*(T - 0.5)) + 4];
    vel = [1; -8; -8]/15;
elseif T < 1
    pos = [0.25*(4*(T - 0.75)) + 0.75; 2*(4*(T - 0.75)) - 2; -2*(4*(T - 0.75)) + 2];
    vel = [1; 8; -8]/15;
else
    pos = [1; 0; 0];
    vel = [0; 0; 0];
end
acc = [0; 0; 0];
yaw = 0;
yawdot = 0;

% =================== Your code ends here ===================

desired_state.pos = pos(:);
desired_state.vel = vel(:);
desired_state.acc = acc(:);
desired_state.yaw = yaw;
desired_state.yawdot = yawdot;

end