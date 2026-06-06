%
% Name: Musharraf Khan
% M.N: 253207
% Boundary Conditions
%

tolerance = 1e-6;

left_edge_nodes = find(abs(Ko(:,1)) < tolerance);

RB_x = left_edge_nodes;
RB_y = left_edge_nodes;

fprintf('\nApplying Boundary Conditions\n');

%--------------------------------------------------
% Penalty Method
%--------------------------------------------------
penalty_value = 1e10;

% Fix ux
for i = 1:length(RB_x)
    dof = RB_x(i)*2 - 1;
    K(dof,dof) = K(dof,dof) + penalty_value;
end

% Fix uy
for i = 1:length(RB_y)
    dof = RB_y(i)*2;
    K(dof,dof) = K(dof,dof) + penalty_value;
end

fprintf('Boundary Conditions Applied\n');
fprintf('Left Edge Fully Fixed\n');