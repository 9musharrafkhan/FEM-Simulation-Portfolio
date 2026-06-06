%
% Name: Musharraf Khan
% M.N: 253207
% Geometry of Rectangular Plate with Rectangular Hole
%

clearvars -except E nu h

%--------------------------------------------------
% Parameters
%--------------------------------------------------
plate_width  = 200;     % mm
plate_height = 100;     % mm

% Rectangular hole dimensions
hole_width  = 60;       % mm (x-direction)
hole_height = 30;       % mm (y-direction)

% Hole center (same as plate center)
hole_center_x = plate_width / 2;   % 100 mm
hole_center_y = plate_height / 2;  % 50 mm

% Hole boundaries
hole_left   = hole_center_x - hole_width/2;   % 70 mm
hole_right  = hole_center_x + hole_width/2;   % 130 mm
hole_bottom = hole_center_y - hole_height/2;  % 35 mm
hole_top    = hole_center_y + hole_height/2;  % 65 mm

mesh_spacing = 2;       % mm

fprintf('\n========================================\n');
fprintf('RECTANGULAR PLATE WITH RECTANGULAR HOLE\n');
fprintf('========================================\n');
fprintf('Plate: %d x %d mm\n', plate_width, plate_height);
fprintf('Hole: %d x %d mm at center\n', hole_width, hole_height);
fprintf('Hole position: x = %.0f to %.0f mm\n', hole_left, hole_right);
fprintf('               y = %.0f to %.0f mm\n', hole_bottom, hole_top);
fprintf('Mesh spacing: %d mm\n', mesh_spacing);

%--------------------------------------------------
% Generate Grid
%--------------------------------------------------
x_coords = 0:mesh_spacing:plate_width;
y_coords = 0:mesh_spacing:plate_height;

nx = length(x_coords);
ny = length(y_coords);

Ko = zeros(nx*ny,2);
node = 0;

for i = 1:ny
    for j = 1:nx
        node = node + 1;
        Ko(node,1) = x_coords(j);
        Ko(node,2) = y_coords(i);
    end
end

%--------------------------------------------------
% Create Elements (Remove elements inside rectangular hole)
%--------------------------------------------------
To = [];
elements_removed = 0;

for i = 1:ny-1
    for j = 1:nx-1
        n1 = (i-1)*nx + j;
        n2 = n1 + 1;
        n3 = n2 + nx;
        n4 = n1 + nx;
        
        % Element center
        xc = mean([Ko(n1,1), Ko(n2,1), Ko(n3,1), Ko(n4,1)]);
        yc = mean([Ko(n1,2), Ko(n2,2), Ko(n3,2), Ko(n4,2)]);
        
        % Check if element is inside the rectangular hole
        if (xc > hole_left && xc < hole_right && yc > hole_bottom && yc < hole_top)
            elements_removed = elements_removed + 1;
        else
            To = [To; n1, n2, n3, n4];
        end
    end
end

%--------------------------------------------------
% Element Coordinates
%--------------------------------------------------
num_elements = size(To,1);
num_nodes    = size(Ko,1);

ex = zeros(num_elements,4);
ey = zeros(num_elements,4);

for j = 1:num_elements
    for m = 1:4
        ex(j,m) = Ko(To(j,m),1);
        ey(j,m) = Ko(To(j,m),2);
    end
end

%--------------------------------------------------
% DOF Topology
%--------------------------------------------------
To_Trans = zeros(num_elements,8);

for j = 1:num_elements
    To_Trans(j,:) = [
        To(j,1)*2-1, To(j,1)*2, ...
        To(j,2)*2-1, To(j,2)*2, ...
        To(j,3)*2-1, To(j,3)*2, ...
        To(j,4)*2-1, To(j,4)*2
    ];
end

fprintf('Nodes      : %d\n', num_nodes);
fprintf('Elements   : %d\n', num_elements);
fprintf('Removed    : %d\n', elements_removed);
fprintf('========================================\n');

%--------------------------------------------------------------------------
% Save to topology.log file
%--------------------------------------------------------------------------
fprintf('\nSaving to topology.log...');

fileID = fopen('topology.log', 'w');

fprintf(fileID, '! Units: mm\n');
fprintf(fileID, '! Rectangular Plate with Rectangular Hole\n');
fprintf(fileID, '! Plate: %d x %d mm\n', plate_width, plate_height);
fprintf(fileID, '! Hole: %d x %d mm at center\n', hole_width, hole_height);
fprintf(fileID, '! Total nodes: %d, Total elements: %d\n', num_nodes, num_elements);
fprintf(fileID, '\n');
fprintf(fileID, '! -------------------------------------------------\n');
fprintf(fileID, '! Nodes (from MATLAB Ko matrix)\n');
fprintf(fileID, '! Format: N,node_id,x,y,z\n');
fprintf(fileID, '! -------------------------------------------------\n');
fprintf(fileID, '\n');

for i = 1:num_nodes
    fprintf(fileID, 'N,%d,%.1f,%.1f,0\n', i, Ko(i,1), Ko(i,2));
end

fprintf(fileID, '\n');
fprintf(fileID, '! -------------------------------------------------\n');
fprintf(fileID, '! Elements (from MATLAB To matrix)\n');
fprintf(fileID, '! Format: E,node1,node2,node3,node4 (quadrilateral)\n');
fprintf(fileID, '! -------------------------------------------------\n');
fprintf(fileID, '\n');

for i = 1:num_elements
    fprintf(fileID, 'E,%d,%d,%d,%d\n', To(i,1), To(i,2), To(i,3), To(i,4));
end

fclose(fileID);

fprintf(' done!\n');
fprintf('File saved: topology.log\n');

% Display sample
fprintf('\nSample of topology.log (first 10 nodes and elements):\n');
fprintf('--------------------------------------------------------\n');
fprintf('! Units: mm\n');
fprintf('\n');
fprintf('! Nodes\n');
fprintf('! -------------------------------------------------\n');
for i = 1:min(10, num_nodes)
    fprintf('N,%d,%.1f,%.1f,0\n', i, Ko(i,1), Ko(i,2));
end
if num_nodes > 10
    fprintf('...\n');
end
fprintf('\n! Elements\n');
fprintf('! -------------------------------------------------\n');
for i = 1:min(10, num_elements)
    fprintf('E,%d,%d,%d,%d\n', To(i,1), To(i,2), To(i,3), To(i,4));
end
if num_elements > 10
    fprintf('...\n');
end
fprintf('========================================\n');

%--------------------------------------------------
% Plot Geometry
%--------------------------------------------------
figure('Name', 'Rectangular Plate with Rectangular Hole', 'Position', [100, 100, 1000, 600])
hold on
axis equal
grid on
title('Rectangular Plate with Rectangular Hole at Center', 'FontSize', 14)
xlabel('x (mm)')
ylabel('y (mm)')

% Plot elements
for e = 1:num_elements
    nodes = To(e,:);
    X = Ko(nodes,1);
    Y = Ko(nodes,2);
    fill(X, Y, [0.8 0.9 0.8], 'EdgeColor', [0.5 0.5 0.5], 'LineWidth', 0.3, 'FaceAlpha', 0.5);
end

% Plot rectangular hole
hole_x = [hole_left, hole_right, hole_right, hole_left, hole_left];
hole_y = [hole_bottom, hole_bottom, hole_top, hole_top, hole_bottom];
plot(hole_x, hole_y, 'r-', 'LineWidth', 2.5);

% Mark boundaries
plot([0, 0], [0, plate_height], 'g-', 'LineWidth', 2.5);
plot([plate_width, plate_width], [0, plate_height], 'r-', 'LineWidth', 2.5);

% Add force arrows on right edge
for y = 10:20:plate_height-10
    quiver(plate_width, y, 15, 0, 'r', 'LineWidth', 1.5, 'MaxHeadSize', 0.5, 'AutoScale', 'off');
end


title('Rectangular Plate with Rectangular Hole - Mesh');