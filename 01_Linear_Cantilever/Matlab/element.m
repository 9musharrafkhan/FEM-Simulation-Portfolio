%% Element definition

function [Tdof, Geo] = element(N, T)

% DOF
DOF = size(N,2);

% Tdof
Tdof = zeros(size(T,1), size(T,2)*DOF);

for n1 = 1:DOF
    Tdof(:, n1:DOF:end) = T(:,:) * DOF - DOF + n1;
end

% Geo
Geo = zeros(size(T,2), DOF, size(T,1));

for n1 = 1:size(T,1)
    Geo(:, :, n1) = N(T(n1,:), :);
end



end
