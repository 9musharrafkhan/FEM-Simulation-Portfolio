%% FEM - Matlab Programm for Cantilever Beam

clc
close all
clear variables
tic
%% Material
% E - Young's modulus
% ny - Poissons ratio
% rho - Density
[E, ny, rho] = material();

%% Node and Topology
% N - Nodes
% T - Topology
[N, T] = geometry();

%% Dirichlet boundary
% Bc - Boundary [Node, DOX, DOY, DOZ]
[Bc] = boundary(N);

%% Neumann boundary
% F_e - Force [Node, Fx, Fy, Fz]
[F_e] = force(N);

%% Element matrices
% Tdof - Topology dof matrix
% Geo - Element geometry matrix
[Tdof, Geo] = element(N,T);

% Stiffness matrix
% K - Stiffness matrix (System)
[K] = stiff_global(Tdof, Geo, E, ny);

% global Force vector
% F - Global force vector (System)
[F] = force_global(max(Tdof(:)), F_e);

%% Process
% Solution 1: Delete rows and columns
tic
x1 = process_boundV1(F, K, Bc);
toc
% Solution 2: Higher Stiffness
tic
x2 = process_boundV2(F, K, Bc);
toc

% Select one solution
x = x1;

%% Postprocessing
% u - Displacement in the shape of N
% sigma - stress
% epsil - strain
[u, epsil, sigma] = post_proc(Geo, Tdof, x, E, ny);

% Fig 1: Deformation
% fac_def - scaling factor for deformation visualisation
fac_def = 20;
plot_Def_3D(T, N, u, F_e, fac_def)

% Fig 2: Stress/Strain Distribution
plot_Str(Geo, epsil, sigma)

toc
