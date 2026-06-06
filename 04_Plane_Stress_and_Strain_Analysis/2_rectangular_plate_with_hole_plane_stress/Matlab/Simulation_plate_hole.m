%
% Name: Musharraf Khan
% M.N: 253207
% FEM Simulation
% Rectangular Plate with Rectangular Hole
%

close all
clear
clc

%--------------------------------------------------
% Material
%--------------------------------------------------
E  = 210000;     % MPa
nu = 0.3;
h  = 5;         % mm

%--------------------------------------------------
% Geometry
%--------------------------------------------------
Geo_plate_hole

%--------------------------------------------------
% Global Stiffness
%--------------------------------------------------
dof_total = num_nodes * 2;

K = sparse(dof_total,dof_total);

fprintf('\nAssembling Global Stiffness Matrix...\n');

for e = 1:num_elements
    Ke = Four_node_membrane_iso_2_2(ex(e,:), ey(e,:), E, nu, h);
    index = To_Trans(e,:);
    K(index,index) = K(index,index) + Ke;
end

fprintf('Assembly Complete\n');

%--------------------------------------------------
% Boundary Conditions
%--------------------------------------------------
Boundary_conditions_plate_hole

%--------------------------------------------------
% Force Vector (Surface Pressure of 100 MPa)
%--------------------------------------------------
f = zeros(dof_total,1);

tolerance = 1e-6;

right_nodes = find(abs(Ko(:,1)-200) < tolerance);  
right_nodes = sortrows([right_nodes Ko(right_nodes,2)],2);

pressure = 100;      % MPa

for i = 1:size(right_nodes,1)
    node = right_nodes(i,1);
    
    if i == 1
        dy = (right_nodes(i+1,2)-right_nodes(i,2))/2;
    elseif i == size(right_nodes,1)
        dy = (right_nodes(i,2)-right_nodes(i-1,2))/2;
    else
        dy = (right_nodes(i+1,2)-right_nodes(i-1,2))/2;
    end
    
    force = pressure * h * dy;
    dof = node*2 - 1;
    f(dof) = f(dof) + force;
end

fprintf('Force Applied Successfully\n');

%--------------------------------------------------
% Solve
%--------------------------------------------------
fprintf('\nSolving System...\n');
U = K\f;
fprintf('Solution Complete\n');

%--------------------------------------------------
% Extract Displacements
%--------------------------------------------------
ux = U(1:2:end);
uy = U(2:2:end);

%--------------------------------------------------
% Calculate Stresses using the element function
%--------------------------------------------------
fprintf('\nCalculating Stresses at Integration Points...\n');

sigma_xx_all = [];
sigma_yy_all = [];
sigma_xy_all = [];
von_mises_all = [];
stress_coords = [];

for e = 1:num_elements
    ue = zeros(8,1);
    for i = 1:4
        ue(2*i-1) = ux(To(e,i));
        ue(2*i)   = uy(To(e,i));
    end
    
    [~, ~, stress] = Four_node_membrane_iso_2_2(ex(e,:), ey(e,:), E, nu, h, ue);
    
    if ~isempty(stress)
        for ip = 1:4
            sigma_xx_all = [sigma_xx_all; stress(1, ip)];
            sigma_yy_all = [sigma_yy_all; stress(2, ip)];
            sigma_xy_all = [sigma_xy_all; stress(3, ip)];
            
            sxx = stress(1, ip);
            syy = stress(2, ip);
            sxy = stress(3, ip);
            vm = sqrt(sxx^2 + syy^2 - sxx*syy + 3*sxy^2);
            von_mises_all = [von_mises_all; vm];
            
            stress_coords = [stress_coords; stress(4, ip), stress(5, ip)];
        end
    end
end

fprintf('Stress Calculation Complete\n');
fprintf('Total integration points: %d\n', length(von_mises_all));

%--------------------------------------------------
% Key Points for Results
%--------------------------------------------------
% Right Center Node (200,50)
target1 = find(abs(Ko(:,1)-200) < tolerance & abs(Ko(:,2)-50) < tolerance);

% Top Center Node (100, 100)
target2 = find(abs(Ko(:,1)-100) < tolerance & abs(Ko(:,2)-100) < tolerance);

% Left Center Node (0, 50)
target3 = find(abs(Ko(:,1)-0) < tolerance & abs(Ko(:,2)-50) < tolerance);

% Bottom Center Node (100, 0)
target4 = find(abs(Ko(:,1)-100) < tolerance & abs(Ko(:,2)-0) < tolerance);

% Hole Corner Points (stress concentration)
hole_left = 70;
hole_right = 130;
hole_bottom = 35;
hole_top = 65;

hole_corner1 = find(abs(Ko(:,1)-hole_left) < tolerance & abs(Ko(:,2)-hole_bottom) < tolerance);
hole_corner2 = find(abs(Ko(:,1)-hole_right) < tolerance & abs(Ko(:,2)-hole_bottom) < tolerance);
hole_corner3 = find(abs(Ko(:,1)-hole_right) < tolerance & abs(Ko(:,2)-hole_top) < tolerance);
hole_corner4 = find(abs(Ko(:,1)-hole_left) < tolerance & abs(Ko(:,2)-hole_top) < tolerance);

%--------------------------------------------------
% Display Results
%--------------------------------------------------
fprintf('\n================================\n');
fprintf('DISPLACEMENT RESULTS\n');
fprintf('================================\n');

if ~isempty(target1)
    fprintf('ux at (200,50) = %.6f mm\n', ux(target1));
    fprintf('uy at (200,50) = %.6f mm\n', uy(target1));
end
fprintf('----------------------------\n');
if ~isempty(target2)
    fprintf('ux at (100,100) = %.6f mm\n', ux(target2));
    fprintf('uy at (100,100) = %.6f mm\n', uy(target2));
end
fprintf('----------------------------\n');
if ~isempty(target3)
    fprintf('ux at (0,50) = %.6f mm\n', ux(target3));
    fprintf('uy at (0,50) = %.6f mm\n', uy(target3));
end
fprintf('----------------------------\n');
if ~isempty(target4)
    fprintf('ux at (100,0) = %.6f mm\n', ux(target4));
    fprintf('uy at (100,0) = %.6f mm\n', uy(target4));
end

fprintf('\n================================\n');
fprintf('STRESS RESULTS (Hole Corners)\n');
fprintf('================================\n');

if ~isempty(hole_corner1)
    % Find stress near corner
    dist_to_corner = sqrt((stress_coords(:,1)-hole_left).^2 + (stress_coords(:,2)-hole_bottom).^2);
    [~, idx] = min(dist_to_corner);
    fprintf('At Bottom-Left Corner (70,35):\n');
    fprintf('  Von Mises Stress = %.2f MPa\n', von_mises_all(idx));
end

if ~isempty(hole_corner2)
    dist_to_corner = sqrt((stress_coords(:,1)-hole_right).^2 + (stress_coords(:,2)-hole_bottom).^2);
    [~, idx] = min(dist_to_corner);
    fprintf('At Bottom-Right Corner (130,35):\n');
    fprintf('  Von Mises Stress = %.2f MPa\n', von_mises_all(idx));
end

if ~isempty(hole_corner3)
    dist_to_corner = sqrt((stress_coords(:,1)-hole_right).^2 + (stress_coords(:,2)-hole_top).^2);
    [~, idx] = min(dist_to_corner);
    fprintf('At Top-Right Corner (130,65):\n');
    fprintf('  Von Mises Stress = %.2f MPa\n', von_mises_all(idx));
end

if ~isempty(hole_corner4)
    dist_to_corner = sqrt((stress_coords(:,1)-hole_left).^2 + (stress_coords(:,2)-hole_top).^2);
    [~, idx] = min(dist_to_corner);
    fprintf('At Top-Left Corner (70,65):\n');
    fprintf('  Von Mises Stress = %.2f MPa\n', von_mises_all(idx));
end

fprintf('\n================================\n');
fprintf('STRESS STATISTICS\n');
fprintf('================================\n');
fprintf('Maximum Von Mises Stress: %.2f MPa\n', max(von_mises_all));
fprintf('Mean Von Mises Stress: %.2f MPa\n', mean(von_mises_all));
fprintf('Applied Pressure: %d MPa\n', pressure);

%--------------------------------------------------
% Expected Result
%--------------------------------------------------
u_theoretical = pressure * 200 / E;  % Changed to 200 (plate width)
fprintf('\nExpected ux (no hole) ≈ %.6f mm\n', u_theoretical);

%--------------------------------------------------
% PLOT 1: Deformed Shape
%--------------------------------------------------
scale = 100;

figure('Name', 'Deformed vs Undeformed Shape', 'Position', [50, 50, 900, 600])
hold on
axis equal
grid on
title('Deformed Shape (scale factor = 100)', 'FontSize', 12)
xlabel('x (mm)')
ylabel('y (mm)')

for e = 1:num_elements
    nodes = To(e,:);
    X = Ko(nodes,1);
    Y = Ko(nodes,2);
    fill(X,Y,'r','edgecolor',[0.8 0.8 0.8], 'facealpha', 0.5);
    Xd = X + scale*ux(nodes);
    Yd = Y + scale*uy(nodes);
    fill(Xd,Yd,'b','facealpha',0.3);
end

% Plot rectangular hole
hole_x = [70, 130, 130, 70, 70];
hole_y = [35, 35, 65, 65, 35];
plot(hole_x, hole_y, 'k-', 'LineWidth', 2);

% Mark boundaries
plot([0, 0], [0, 100], 'g-', 'LineWidth', 2);
plot([200, 200], [0, 100], 'r-', 'LineWidth', 2);

%--------------------------------------------------
% PLOT 2: Von Mises Stress Contour
%--------------------------------------------------
figure('Name', 'Von Mises Stress Contour', 'Position', [150, 150, 900, 600])
hold on
axis equal
grid on
title('Von Mises Stress Distribution (MPa)', 'FontSize', 12)
xlabel('x (mm)')
ylabel('y (mm)')

scatter(stress_coords(:,1), stress_coords(:,2), 30, von_mises_all, 'filled');
colormap(jet(256))
colorbar
c = colorbar;
c.Label.String = 'Von Mises Stress (MPa)';

% Plot rectangular hole
plot(hole_x, hole_y, 'k-', 'LineWidth', 2.5);
plot([0, 0], [0, 100], 'g-', 'LineWidth', 2);
plot([200, 200], [0, 100], 'r-', 'LineWidth', 2);

axis([-10 210 -10 110])
title('Von Mises Stress Distribution at Gauss Integration Points');

%--------------------------------------------------
% Save Results to File
%--------------------------------------------------
fid = fopen('fem_results.txt', 'w');

fprintf(fid, '============================================================\n');
fprintf(fid, 'FEM SIMULATION RESULTS - RECTANGULAR PLATE WITH RECTANGULAR HOLE\n');
fprintf(fid, '============================================================\n\n');

fprintf(fid, 'MATERIAL PROPERTIES\n');
fprintf(fid, '-------------------\n');
fprintf(fid, 'Young''s Modulus (E): %.0f MPa\n', E);
fprintf(fid, 'Poisson Ratio (nu): %.2f\n', nu);
fprintf(fid, 'Thickness (h): %.1f mm\n\n', h);

fprintf(fid, 'GEOMETRY\n');
fprintf(fid, '--------\n');
fprintf(fid, 'Plate: %d x %d mm\n', 200, 100);
fprintf(fid, 'Rectangular Hole: 60 x 30 mm at center\n');
fprintf(fid, 'Hole position: x = 70 to 130 mm, y = 35 to 65 mm\n\n');

fprintf(fid, 'LOAD INFORMATION\n');
fprintf(fid, '----------------\n');
fprintf(fid, 'Applied Pressure: %.0f MPa\n', pressure);
fprintf(fid, 'Total Force: %.2f N\n\n', pressure * h * 100);

fprintf(fid, 'MESH INFORMATION\n');
fprintf(fid, '----------------\n');
fprintf(fid, 'Number of nodes: %d\n', num_nodes);
fprintf(fid, 'Number of elements: %d\n', num_elements);
fprintf(fid, 'Number of integration points: %d\n', length(von_mises_all));
fprintf(fid, 'Degrees of freedom: %d\n\n', dof_total);

fprintf(fid, 'DISPLACEMENT RESULTS\n');
fprintf(fid, '--------------------\n');
if ~isempty(target1)
    fprintf(fid, 'ux at (200,50) = %.6f mm\n', ux(target1));
    fprintf(fid, 'uy at (200,50) = %.6f mm\n\n', uy(target1));
end

fprintf(fid, 'STRESS RESULTS\n');
fprintf(fid, '--------------\n');
fprintf(fid, 'Maximum Von Mises Stress: %.2f MPa\n', max(von_mises_all));
fprintf(fid, 'Mean Von Mises Stress: %.2f MPa\n', mean(von_mises_all));
fprintf(fid, 'Applied Pressure: %d MPa\n\n', pressure);

fprintf(fid, 'STRESS STATISTICS\n');
fprintf(fid, '-----------------\n');
fprintf(fid, 'Std Von Mises Stress: %.2f MPa\n', std(von_mises_all));
fprintf(fid, 'Min Von Mises Stress: %.2f MPa\n', min(von_mises_all));

fclose(fid);

fprintf('\nResults saved to: fem_results.txt\n');
fprintf('\nSimulation Finished Successfully\n');