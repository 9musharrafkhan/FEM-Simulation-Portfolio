%% Force vector
function [F] = force_global(DOF, F_e)

% initialize
F = zeros(DOF, 1);

for n1 = 1:size(F_e, 1)
    F(F_e(n1,1)*3-2) = F(F_e(n1,1)*3-2) + F_e(n1, 2);
    F(F_e(n1,1)*3-1) = F(F_e(n1,1)*3-1) + F_e(n1, 3);
    F(F_e(n1,1)*3)   = F(F_e(n1,1)*3)   + F_e(n1, 4);
end

end



%%
