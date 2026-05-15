
%% Element stiffness matrix
function [k] = stiff(geo, E_mat, ny_mat)

% initialize
k = 0;

% Gausspoints and weights
x_G = [-1/sqrt(3), 1/sqrt(3)];
a_G = [1, 1];

% Constitutive matrix
c = (1-2*ny_mat)/2;
C = E_mat/(1+ny_mat)/(1-2*ny_mat)*...
    [1-ny_mat   ny_mat   ny_mat 0 0 0
       ny_mat 1-ny_mat   ny_mat 0 0 0
       ny_mat   ny_mat 1-ny_mat 0 0 0
            0        0        0 c 0 0
            0        0        0 0 c 0
            0        0        0 0 0 c];


% Loop over all gausspoints
for n1 = 1:numel(x_G)
    for n2 = 1:numel(x_G)
        for n3 = 1:numel(x_G)

            % Derivative shape functions
            N_Gd(1,:) = 1/8*[
                -(1-x_G(n2))*(1-x_G(n3)),...
                 (1-x_G(n2))*(1-x_G(n3)),...
                 (1+x_G(n2))*(1-x_G(n3)),...
                -(1+x_G(n2))*(1-x_G(n3)),...
                -(1-x_G(n2))*(1+x_G(n3)),...
                 (1-x_G(n2))*(1+x_G(n3)),...
                 (1+x_G(n2))*(1+x_G(n3)),...
                -(1+x_G(n2))*(1+x_G(n3))];

            N_Gd(2,:) = 1/8*[
                -(1-x_G(n1))*(1-x_G(n3)),...
                -(1+x_G(n1))*(1-x_G(n3)),...
                 (1+x_G(n1))*(1-x_G(n3)),...
                 (1-x_G(n1))*(1-x_G(n3)),...
                -(1-x_G(n1))*(1+x_G(n3)),...
                -(1+x_G(n1))*(1+x_G(n3)),...
                 (1+x_G(n1))*(1+x_G(n3)),...
                 (1-x_G(n1))*(1+x_G(n3))];

            N_Gd(3,:) = 1/8*[
                -(1-x_G(n1))*(1-x_G(n2)),...
                -(1+x_G(n1))*(1-x_G(n2)),...
                -(1+x_G(n1))*(1+x_G(n2)),...
                -(1-x_G(n1))*(1+x_G(n2)),...
                 (1-x_G(n1))*(1-x_G(n2)),...
                 (1+x_G(n1))*(1-x_G(n2)),...
                 (1+x_G(n1))*(1+x_G(n2)),...
                 (1-x_G(n1))*(1+x_G(n2))];

            % Jacobian matrix
            J = N_Gd * geo;

            % Inverse jacobian
            J_I = inv(J);

            % B-Matrix
            B(1,1:3:24) = J_I(1,:)*N_Gd;
            B(2,2:3:24) = J_I(2,:)*N_Gd;
            B(3,3:3:24) = J_I(3,:)*N_Gd;

            B(4,1:3:24) = J_I(2,:)*N_Gd;
            B(4,2:3:24) = J_I(1,:)*N_Gd;

            B(5,2:3:24) = J_I(3,:)*N_Gd;
            B(5,3:3:24) = J_I(2,:)*N_Gd;

            B(6,1:3:24) = J_I(3,:)*N_Gd;
            B(6,3:3:24) = J_I(1,:)*N_Gd;

            % stiffness matrix
            k = k + a_G(n1)*a_G(n2)*a_G(n3)*B'*C*B*det(J);

        end
    end
end

end


