%% =========================================================
% Geometry and 3D mesh
%% =========================================================

function [N,T] = geometry()

%% Geometry dimensions
% All dimension in mm

Lx = 300;
Ly = 20;
Lz = 20;

%% Number of elements

nx = 60;
ny = 4;
nz = 4;

%% Generate 3D Hex mesh

[N,T] = mesh_hex8(Lx,Ly,Lz,nx,ny,nz);

end
