
%% Function for postprocessing (Stress/Strain calculation)
function [u, epsil, sigma] = post_proc(Geo, Tdof, x, E_mat, ny_mat)

% Initialize
epsil = zeros(6, 8, size(Tdof,1));
sigma = zeros(6, 8, size(Tdof,1));

% material
c = (1-2*ny_mat)/2;
C = E_mat/(1+ny_mat)/(1-2*ny_mat)*...
    [1-ny_mat     ny_mat    ny_mat  0  0  0
       ny_mat   1-ny_mat    ny_mat  0  0  0
       ny_mat     ny_mat  1-ny_mat  0  0  0
            0          0         0  c  0  0
            0          0         0  0  c  0
            0          0         0  0  0  c];

for n1 = 1:size(Tdof,1)
    % B-Matrix for each point in the corner of the element
    bel = solid3_lin_B(Geo(:,:,n1));

    % calculate strain
    for n2 = 1:8
        epsil(:,n2,n1) = bel(:,:,n2) * x(Tdof(n1,:));
    end

    % calculate stress
    sigma(:,:,n1) = C * epsil(:,:,n1);
end

% Displacement
u = reshape(x, size(Geo,2), [])';
end
