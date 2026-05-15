
%% Solve linear System - BC:Delete rows and columns
function [u] = process_boundV1(F, K, Bc)

% calculate constrained DOF
Bc = [(Bc(:,1)*3-2).*Bc(:,2),...
      (Bc(:,1)*3-1).*Bc(:,3),...
      (Bc(:,1)*3)  .*Bc(:,4)];
Bc = nonzeros(unique(Bc));
Bc = sort(Bc);

% combine K and F
G = [K,F];

% delete rows & collumns
for n1 = length(Bc):-1:1
    G(:, Bc(n1)) = [];
    G(Bc(n1),:) = [];
end

% extract K* and F*
Ks = G(:, 1:end-1);
Fs = G(:, end);

% calculate u (solve system)
u = linsolve(Ks, Fs);

% insert boundary conditions in displacement vector
for n1 = 1:length(Bc)
    u = [u(1:Bc(n1)-1); 0 ;u(Bc(n1):end)];
end

end



