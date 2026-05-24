# 04_Tunnel_Plane_Strain_Analysis

# Plane Strain Analysis of Tunnel using ANSYS

---

# Overview

This project presents the finite element analysis of an underground tunnel structure using the Plane Strain formulation in ANSYS Mechanical.

The analysis investigates:

- Stress distribution around the tunnel
- Deformation behavior under external pressure
- Plane strain assumptions
- Mesh generation techniques
- Structural response validation

The objective of this project is to:

- Model a long underground tunnel using plane strain formulation
- Apply external ground pressure loading
- Evaluate stress concentration around the tunnel
- Validate plane strain assumptions using deformation results
- Demonstrate professional ANSYS FEM workflow

---

# Problem Description

A concrete tunnel embedded in a surrounding soil/rock domain is analyzed under uniform external pressure loading.

Since the tunnel length is significantly larger than its cross-sectional dimensions, the problem is modeled using the Plane Strain assumption.

The tunnel is subjected to:

- Uniform pressure from top surface
- Uniform pressure from left boundary
- Uniform pressure from right boundary

The analysis evaluates structural stress and deformation behavior.

---

# Geometry

The geometry consists of:

- Rectangular surrounding domain
- Tunnel opening with curved top profile
- Long out-of-plane tunnel length

All dimensions are in mm.

---

# Tunnel Dimensions

| Parameter | Value |
|---|---|
| Tunnel Radius | 1600 mm |
| Side Wall Height | 1200 mm |
| Total Domain Height | 2400 mm |
| Bottom Width Extensions | 400 mm |

---

# Material Properties

Concrete material properties used in the analysis:

| Property | Value |
|---|---|
| Material | Concrete |
| Young’s Modulus | 29 GPa |
| Poisson Ratio | 0.15 |

---

# Plane Strain Assumption

The tunnel is assumed to be very long in the out-of-plane direction.

Therefore:

```math
\varepsilon_z = 0
```

This assumption is valid for:

- tunnels
- dams
- retaining walls
- long underground structures

---

# Governing Equations

The analysis is based on linear elasticity theory.

---

# Equilibrium Equation

```math
\nabla \cdot \sigma + b = 0
```

---

# Constitutive Relation

```math
\sigma = C \varepsilon
```

---

# Strain-Displacement Relation

```math
\varepsilon = Bu
```

---

# ANSYS Analysis

The analysis was performed using ANSYS Mechanical Static Structural.

---

# Analysis Type

| Parameter | Value |
|---|---|
| Analysis | Static Structural |
| Formulation | Plane Strain |
| Solver | Direct Sparse |
| Large Deflection | OFF |

---

# Element Information

| Parameter | Value |
|---|---|
| Element Type | PLANE182 / PLANE183 |
| Formulation | 2D Structural Plane Strain Element |

---

# Boundary Conditions

Uniform pressure loading was applied from:

- Top surface
- Left boundary
- Right boundary
- Bottom fixed

---

# Pressure Loading

| Surface | Pressure |
|---|---|
| Top Surface | 1 MPa |
| Left Surface | 1 MPa |
| Right Surface | 1 MPa |

The pressure represents external ground/soil loading acting on the tunnel structure.

---

# Mesh Information

The mesh was generated using:

- Face Meshing
- Edge Sizing

---

# Mesh Controls

| Parameter | Value |
|---|---|
| Mesh Method | Face Meshing |
| Sizing Method | Edge Sizing |
| Element Shape | Quadrilateral Dominant |

The structured mesh provided:

- improved stress accuracy
- smooth deformation field
- better numerical convergence

---

# Results

---

# Equivalent Stress

The maximum equivalent (von Mises) stress obtained was:

```math
\sigma_{eq,max} = 0.14687 \ MPa
```

Maximum stress concentration occurred near the curved tunnel region.

---

# Directional Deformation

Directional deformation in the Z-direction was evaluated.

The obtained deformation was:

```math
u_z \approx 0
```

This confirms the correct implementation of the Plane Strain formulation.

Since plane strain assumes:

```math
\varepsilon_z = 0
```

the near-zero out-of-plane deformation validates the modeling approach.

---

# Validation

The following observations validated the numerical model:

- Stable stress distribution
- Physically realistic deformation
- Near-zero Z-direction deformation
- Proper pressure transfer through boundaries
- Correct plane strain implementation

---

# Key Observations

- Maximum stress occurred near the tunnel curvature.
- Structured meshing improved stress resolution.
- Plane strain assumption was successfully verified.
- The tunnel showed stable deformation behavior under external pressure loading.
- Z-direction deformation remained nearly zero as expected.

---

# Repository Structure

```text
04_Tunnel_Plane_Strain_Analysis/
│
├── README.md
│
├── ansys/
│   │
│   ├── project_files/
│   │   ├── tunnel_plane_strain.wbpj
│   │   └── tunnel_plain_strain_files/
│   │
│   ├── mesh/
│   │   ├── 2D_mesh_size.png
│   │   ├── 3D_mesh_size.png
│   │   └── mesh_quality.png
│   │
│   ├── boundary_conditions/
│   │   └── boundary_conditions.png
│   │
│   ├── results/
│   │   ├── equivalent_stress.png
│   │   ├── directional_deformation_Y.png
│   │   ├── directional_deformation_Z.png
│   │   └── total_deformation.png
│   │
│   └── README_ANSYS.md
│
└── geometry/
    └── tunnel_geometry.png
```

---

# ANSYS Workflow

The ANSYS workflow includes:

1. Geometry creation  
2. Plane strain setup  
3. Material assignment  
4. Pressure loading application  
5. Face meshing and edge sizing  
6. Static structural solution  
7. Stress and deformation evaluation  
8. Validation of plane strain assumption  
9. Postprocessing and result interpretation  

---

# Key Learnings

This project demonstrates:

- Plane strain FEM formulation
- Tunnel structural analysis
- External pressure loading
- Structured mesh generation
- Stress concentration analysis
- Plane strain validation
- ANSYS Mechanical workflow
- Engineering result interpretation

---

# Author

Musharraf Khan

M.Sc. Computational Methods in Engineering  
Otto von Guericke University Magdeburg

---

# Tools Used

- ANSYS Mechanical
- Finite Element Method
- Structural Mechanics

---

# License

This project is licensed under the MIT License.
