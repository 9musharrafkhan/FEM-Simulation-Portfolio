
%% Plot Stress and Strain (2D - Mesh)
function plot_Str(Geo, epsil, sigma)

% get screensize
scrsi = get( groot, 'Screensize' );
% open figure
figure('Name','Deformation',...
    'Position',[scrsi(3)/2+1,0.05*scrsi(4), scrsi(3)/2, 0.85*scrsi(4)]);
% Tiled Layout
tiledlayout(2,4);
% Create xyz-pairs for Plot
plot_x = reshape(Geo(1:4,1,:), 4, size(Geo,3));
plot_y = reshape(Geo(1:4,2,:), 4, size(Geo,3));

% Stress
titles = ["$\sigma_{xx}$ [MPa]", "$\sigma_{yy}$ [MPa]", ...
    "$\sigma_{zz}$ [MPa]", "$\sigma_{xy}$ [MPa]"];
for n1 = 1 : 4 
    % create xyz-pairs
    plot_c = reshape(sigma(n1, 1:4, :), 4, size(Geo,3));
    
    % Visualization
    nexttile;
    hold on
    fill(plot_x,plot_y,plot_c)
    xlabel('$x$ [mm]','Interpreter','latex')
    ylabel('$y$ [mm]','Interpreter','latex')
    title(titles(n1),'Interpreter','latex')
    set(gca,'xscale','linear');
    set(gca,'yscale','linear');
    set(gca,'FontSize',18);
    set(gca,'TickLabelInterpreter','latex')
    colormap(jet)
    colorbar
    hold off
end

% Strain
titles = ["$\varepsilon_{xx}$ [-]", "$\varepsilon_{yy}$ [-]", ...
    "$\varepsilon_{zz}$ [-]", "$\varepsilon_{xy}$ [-]"];
for n1 = 1 : 4 
    % create xyz-pairs
    plot_c = reshape(epsil(n1, 1:4, :), 4, size(Geo,3));

    % Visualization
    nexttile;
    hold on
    fill(plot_x,plot_y,plot_c)
    xlabel('$x$ [mm]','Interpreter','latex')
    ylabel('$y$ [mm]','Interpreter','latex')
    title(titles(n1),'Interpreter','latex')
    set(gca,'xscale','linear');
    set(gca,'yscale','linear');
    set(gca,'FontSize',18);
    set(gca,'TickLabelInterpreter','latex')
    colormap(jet)
    colorbar
    hold off
end

% Visualization
for n1 = 1:8
    nexttile(n1)
    grid on; box on; axis equal
end

end

