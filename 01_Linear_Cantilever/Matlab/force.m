%% Neumann bundary
function [F_e] = force(N)

% Force [N]
F_abs = 1000;
tol = 1e-6;

% Nodes at the free end

N1 = find(abs(N(:,1)-300) < tol & N(:,2) > 0 & N(:,2) < 20); % inner nodes
N2 = find(abs(N(:,1)-300) < tol & abs(N(:,2)-20) < tol); % outer nodes

% Force per Node
F_n = F_abs/(numel(N1)*2+numel(N2));

% Force matrix
F_e = [N1, zeros(numel(N1),1), F_n*2*ones(numel(N1),1), zeros(numel(N1),1);
    N2, zeros(numel(N2),1), F_n*ones(numel(N2),1),zeros(numel(N2),1);
    ];

end
