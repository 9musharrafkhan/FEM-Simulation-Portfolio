
%% Global stiffness matrix
function [K] = stiff_global(Tdof, Geo, E, ny)

% initalize
K = zeros(max(Tdof(:)));

for n1 = 1:size(Tdof,1)

    % Element stiffness matrix
    [k] = stiff(Geo(:,:,n1), E, ny);

    % Assembling
    K(Tdof(n1, :), Tdof(n1, :)) = K(Tdof(n1, :), Tdof(n1, :)) + k;
end

end
