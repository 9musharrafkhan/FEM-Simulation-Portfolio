
%% Solve linear System - BC:Delete rows and columns
function [u] = process_boundV2(F, K, Bc)

% calculate constrained DOF
Bc = [(Bc(:,1)*3-2).*Bc(:,2),...
      (Bc(:,1)*3-1).*Bc(:,3),...
      (Bc(:,1)*3)  .*Bc(:,4)];
Bc = nonzeros(unique(Bc));
Bc = sort(Bc);

% K-value
stiff_k = 1e+5*max((max(K)));

% increase stiffness
for n1 = 1:length(Bc)
    K(Bc(n1), Bc(n1)) = stiff_k;
end

% calculate u (solve system)
u = linsolve(K, F);

end

