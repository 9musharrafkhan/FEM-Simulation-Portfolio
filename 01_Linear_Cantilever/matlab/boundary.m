%% Dirichlet boundary
function [Bc] = boundary(N)

% DOX
n = find(N(:,1)<1e-10);
Bc = [n, ones(numel(n),1), zeros(numel(n),2)];

% DOY
%n = find(N(:,2)<1e-10);
Bc = [Bc; n, zeros(numel(n),1), ones(numel(n),1), zeros(numel(n),1)];

% DOZ
%n = find(N(:,3)<1e-10);
Bc = [Bc; n, zeros(numel(n),2), ones(numel(n),1)];


end
