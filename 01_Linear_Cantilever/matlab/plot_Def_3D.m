
%% Plot deformation (3D - Mesh)

function plot_Def_3D(T, N, u, F_e, fac_def)

%% Get screensize
scrsi = get(groot, 'Screensize');

%% Open figure
figure('Name','3D Deformation', ...
    'Position',[1,0.05*scrsi(4), scrsi(3)/1.5, 0.85*scrsi(4)]);

hold on
grid on
view(3)

%% ==========================================
% Create line connectivity
% ===========================================

% Hexahedral edges
L = [
    T(:,[1 2]);
    T(:,[2 3]);
    T(:,[3 4]);
    T(:,[4 1]);

    T(:,[5 6]);
    T(:,[6 7]);
    T(:,[7 8]);
    T(:,[8 5]);

    T(:,[1 5]);
    T(:,[2 6]);
    T(:,[3 7]);
    T(:,[4 8]);
];

%% ==========================================
% Remove duplicate lines
% ===========================================

L = sort(L,2);
L = unique(L,'rows');

%% ==========================================
% Undeformed mesh
% ===========================================

plot_x(1,:) = N(L(:,1),1)';
plot_x(2,:) = N(L(:,2),1)';

plot_y(1,:) = N(L(:,1),2)';
plot_y(2,:) = N(L(:,2),2)';

plot_z(1,:) = N(L(:,1),3)';
plot_z(2,:) = N(L(:,2),3)';

%% ==========================================
% Deformed coordinates
% ===========================================

Kn_F = N + fac_def * u;

%% ==========================================
% Deformed mesh
% ===========================================

plot_x_F(1,:) = Kn_F(L(:,1),1)';
plot_x_F(2,:) = Kn_F(L(:,2),1)';

plot_y_F(1,:) = Kn_F(L(:,1),2)';
plot_y_F(2,:) = Kn_F(L(:,2),2)';

plot_z_F(1,:) = Kn_F(L(:,1),3)';
plot_z_F(2,:) = Kn_F(L(:,2),3)';

%% ==========================================
% Plot undeformed structure
% ===========================================

p1 = line( ...
    plot_x, ...
    plot_y, ...
    plot_z, ...
    'Color','r', ...
    'LineWidth',1);

%% ==========================================
% Plot deformed structure
% ===========================================

p2 = line( ...
    plot_x_F, ...
    plot_y_F, ...
    plot_z_F, ...
    'Color','b', ...
    'LineWidth',1.5);

%% ==========================================
% Plot nodes
% ===========================================

scatter3(N(:,1),N(:,2),N(:,3),20,'filled','r');

scatter3(Kn_F(:,1),Kn_F(:,2),Kn_F(:,3),20,'filled','b');

%% =====================================
% Plot force vectors
%% =====================================

%% =====================================
% Plot force vectors (3D)
%% =====================================

vector_length = 30;

for i = 1:size(F_e,1)

    % Node number
    node = F_e(i,1);

    % Force components
    Fx = F_e(i,2);
    Fy = F_e(i,3);
    Fz = F_e(i,4);

    % Node coordinates
    x = N(node,1);
    y = N(node,2);
    z = N(node,3);

    %% =====================================
    % Normalize force vector
    %% =====================================

    Fmag = sqrt(Fx^2 + Fy^2 + Fz^2);

    if Fmag > 0

        Fx = Fx/Fmag;
        Fy = Fy/Fmag;
        Fz = Fz/Fmag;

    end

    %% =====================================
    % Plot vector
    %% =====================================

    quiver3( ...
        x, y, z, ...
        -vector_length*Fx, ...
        -vector_length*Fy, ...
        -vector_length*Fz, ...
        'LineWidth',1, ...
        'Color','black', ...
        'MaxHeadSize',1, ...
        'AutoScale','off');

    %% =====================================
    % Plot force application point
    %% =====================================

    scatter3( ...
        x, y, z, ...
        100, ...
        'filled', ...
        'blue');

end

%% ==========================================
% Legend
% ===========================================

legend([p1(1) p2(1)], ...
    ["Undeformed FE-mesh", ...
    strjoin(["Deformed FE-Mesh (scaled sf = " ...
    num2str(fac_def) ")"])], ...
    'Interpreter','latex', ...
    'Location','best');

%% ==========================================
% Labels
% ===========================================

xlabel('$x$ [mm]','Interpreter','latex');
ylabel('$y$ [mm]','Interpreter','latex');
zlabel('$z$ [mm]','Interpreter','latex');

title('3D FEM Deformation','Interpreter','latex');

%% ==========================================
% Axis settings
% ===========================================

axis equal

set(gca,'FontSize',18);
set(gca,'TickLabelInterpreter','latex');

rotate3d on

hold off

end
