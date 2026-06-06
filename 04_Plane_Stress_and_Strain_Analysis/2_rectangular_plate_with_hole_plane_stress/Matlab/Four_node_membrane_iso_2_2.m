function [Ke, Me, stress] = Four_node_membrane_iso_2_2(ex, ey, E, nu, h, displacements)
%--------------------------------------------------------------------------
%
%   Name: Musharraf Khan
%   M.N: 253207
%   The subroutine calculates the element stiffness matrix Ke 
%   of a four-node membrane element using 2x2 Gauss integration.
%   Can also calculate stresses at integration points.
%
%   Input parameters: 
%       ex, ey = Node coordinates [x1 x2 x3 x4], [y1 y2 y3 y4]
%       E = Young's modulus
%       nu = Poisson's ratio
%       h = thickness
%       displacements = (optional) element nodal displacements [8x1]
%
%   Output:
%       Ke = Element stiffness matrix (8x8)
%       Me = Element mass matrix (optional)
%       stress = (optional) stresses at integration points
%--------------------------------------------------------------------------

% Gauss integration points (2x2)
xi_points = [-1/sqrt(3), 1/sqrt(3)];
eta_points = [-1/sqrt(3), 1/sqrt(3)];
weights = [1, 1];

% Initialize element stiffness matrix
Ke = zeros(8, 8);

% Material constitutive matrix (plane stress)
factor = E / (1 - nu^2);
ES = factor * [1,      nu,     0;
               nu,     1,      0;
               0,      0,      (1-nu)/2];

% Initialize stress storage
if nargin > 5 && ~isempty(displacements)
    calculate_stress = true;
    stress = zeros(3, 4); % 3 stress components at 4 integration points
    stress_points = zeros(4, 2); % Store integration point coordinates
else
    calculate_stress = false;
    stress = [];
end

% Numerical integration using 2x2 Gauss quadrature
point_counter = 0;
for i = 1:2
    xi = xi_points(i);
    wi = weights(i);
    
    for j = 1:2
        eta = eta_points(j);
        wj = weights(j);
        point_counter = point_counter + 1;
        
        % Shape function derivatives with respect to natural coordinates
        dN_xi = [-1/4*(1-eta);
                  1/4*(1-eta);
                  1/4*(1+eta);
                 -1/4*(1+eta)];
        
        dN_eta = [-1/4*(1-xi);
                  -1/4*(1+xi);
                   1/4*(1+xi);
                   1/4*(1-xi)];
        
        % Jacobian matrix
        J = [dN_xi, dN_eta]' * [ex', ey'];
        detJ = det(J);
        
        % Check for negative Jacobian (element distortion)
        if detJ <= 0
            warning('Negative Jacobian determinant detected! Element distorted.');
        end
        
        % Inverse of Jacobian
        invJ = inv(J);
        
        % B matrix (strain-displacement)
        B = zeros(3, 8);
        
        % Calculate derivatives with respect to physical coordinates
        for k = 1:4
            dNdx = invJ(1,1)*dN_xi(k) + invJ(1,2)*dN_eta(k);
            dNdy = invJ(2,1)*dN_xi(k) + invJ(2,2)*dN_eta(k);
            
            B(1, 2*k-1) = dNdx;           % du/dx
            B(2, 2*k)   = dNdy;           % dv/dy
            B(3, 2*k-1) = dNdy;           % du/dy
            B(3, 2*k)   = dNdx;           % dv/dx
        end
        
        % Add contribution to stiffness matrix
        Ke = Ke + wi * wj * h * B' * ES * B * detJ;
        
        % Calculate stress if displacements provided
        if calculate_stress
            % Calculate strains
            strain = B * displacements;
            
            % Calculate stresses
            stress(:, point_counter) = ES * strain;
            
            % Calculate physical coordinates of integration point
            N = [1/4*(1-xi)*(1-eta);
                 1/4*(1+xi)*(1-eta);
                 1/4*(1+xi)*(1+eta);
                 1/4*(1-xi)*(1+eta)];
            
            stress_points(point_counter, :) = N' * [ex; ey]';
        end
    end
end

% Optional: Return mass matrix (commented out)
Me = [];

% Store integration points coordinates if stresses calculated
if calculate_stress
    stress = [stress; stress_points'];
end
end