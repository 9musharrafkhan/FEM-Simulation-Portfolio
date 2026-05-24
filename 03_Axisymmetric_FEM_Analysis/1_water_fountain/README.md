# 03_Water_Foundation_Axisymmetric_Analysis

# Axisymmetric Water Foundation Analysis using ANSYS

---

# Overview

This project presents the axisymmetric finite element analysis of a concrete water foundation subjected to hydrostatic pressure using ANSYS Mechanical.

The analysis investigates:

- Hydrostatic pressure loading
- Axisymmetric structural behavior
- Stress distribution
- Directional deformation
- Mesh convergence study

The objective of this project is to:

- Model an axisymmetric foundation structure
- Apply hydrostatic pressure loading
- Evaluate stress concentration regions
- Investigate deformation response
- Perform convergence validation
- Demonstrate professional ANSYS simulation workflow

---

# Problem Description

A concrete water foundation structure subjected to hydrostatic pressure is analyzed using the axisymmetric formulation in ANSYS Mechanical.

The structure contains:

- Curved inner geometry
- Axisymmetric profile
- Hydrostatic fluid loading
- Fixed base support

The model is solved using 2D axisymmetric finite elements.

Geometry and dimensions are based on the attached engineering drawing. :contentReference[oaicite:0]{index=0}

---

# Geometry

The geometry represents a rotationally symmetric water foundation profile.

All dimensions are in mm. :contentReference[oaicite:1]{index=1}

## Main Dimensions

| Parameter | Value |
|---|---|
| Total Width | 1000 mm |
| Internal Width | 800 mm |
| Total Height | 660 mm |
| Internal Height | 500 mm |
| Inner Radius | 100 mm |
| Upper Lip Width | 60 mm |
| Lower Step Height | 120 mm |

---

# Material Properties

Concrete material properties used in the analysis: :contentReference[oaicite:2]{index=2}

| Property | Value |
|---|---|
| Material | Concrete |
| Young’s Modulus | 29 GPa |
| Poisson Ratio | 0.15 |

---

# Fluid Properties

| Property | Value |
|---|---|
| Fluid Density | 1000 kg/m³ |
| Gravitational Acceleration | 9.81 m/s² |

---

# Theory of Hydrostatic Pressure

Hydrostatic pressure varies linearly with fluid depth.

The applied hydrostatic pressure is given by:

```math
P = \rho g h
```

Where:

- \( \rho \) = fluid density
- \( g \) = gravitational acceleration
- \( h \) = fluid depth

---

# Axisymmetric Formulation

The structure is modeled using a 2D axisymmetric formulation.

The geometry is revolved about the axis of symmetry internally by the solver.

This significantly reduces:

- computational cost
- number of elements
- solution time

while preserving 3D structural behavior.

---

# ANSYS Analysis

The analysis was performed using ANSYS Mechanical Static Structural.

---

# Analysis Type

| Parameter | Value |
|---|---|
| Analysis Type | Static Structural |
| Formulation | Axisymmetric |
| Solver | Direct Sparse |
| Large Deflection | OFF |

---

# Element Information

| Parameter | Value |
|---|---|
| Element Type | PLANE182 / PLANE183 |
| Formulation | 2D Axisymmetric Structural Element |

---

# Boundary Conditions

## Fixed Support

The bottom surface of the foundation was fully fixed.

---

## Axisymmetric Constraint

A frictionless support was applied along the axis of symmetry.

This constraint allows:

- axial displacement
- axisymmetric deformation

while restricting radial penetration across the symmetry axis.

---

## Hydrostatic Pressure

Hydrostatic pressure was applied on the top internal surface of the structure.

Pressure variation was automatically computed using:

- water density
- gravity
- fluid depth

---

# Mesh Information

A mapped mesh was used for accurate structured discretization.

## Mesh Controls

| Parameter | Value |
|---|---|
| Mesh Type | Mapped Face Mesh |
| Edge Sizing | 10 |
| Element Shape | Quadrilateral |
| Meshing Method | Face Meshing |

The mapped mesh provided:

- improved element quality
- smooth stress distribution
- better convergence behavior

---

# Results

---

# Directional Deformation

Directional deformation in the Y-direction was evaluated.

| Location | Deformation |
|---|---|
| Bottom Surface | 0.0 mm |
| Top Surface | -0.00496 mm |

The maximum deformation occurred at the upper free region of the structure.

---

# Equivalent Stress

Von Mises equivalent stress distribution showed:

- maximum stress concentration at the upper curved face
- smooth stress variation throughout the structure

Stress concentration occurred due to:

- geometric curvature
- hydrostatic pressure loading
- local stiffness variation

---

# Mesh Convergence Study

A convergence study was performed using adaptive mesh refinement.

## Convergence Parameters

| Parameter | Value |
|---|---|
| Convergence Quantity | Total Deformation |
| Allowable Change | 0.00005 |
| Maximum Refinement Loops | 8 |

The convergence study showed stable numerical behavior and good convergence.

The deformation solution became mesh independent after successive refinements.

---

# Validation

Validation of the model was performed using:

- mesh convergence study
- physical deformation behavior
- reaction consistency
- stress distribution assessment

The solution showed physically realistic structural response under hydrostatic loading.

---

# Key Observations

- Maximum deformation occurred near the free upper surface.
- The bottom fixed region remained fully constrained.
- Stress concentration developed at the curved upper corner.
- Axisymmetric modeling significantly reduced computational cost.
- Mapped mesh improved numerical stability and convergence.

---

# Repository Structure

```text
03_Water_Foundation_Axisymmetric_Analysis/
│
├── README.md
│
├── ansys/
│   │
│   ├── project_files/
│   │   ├── water_foundation.wbpj
│   │   └── solver_files/
│   │
│   ├── geometry/
│   │   ├── geometry.png
│   │   ├── dimensions.png
│   │   └── geometry.step
│   │
│   ├── mesh/
│   │   ├── mapped_mesh.png
│   │   ├── mesh_quality.png
│   │   └── mesh_statistics.txt
│   │
│   ├── boundary_conditions/
│   │   ├── fixed_support.png
│   │   ├── frictionless_support.png
│   │   ├── hydrostatic_pressure.png
│   │   └── BC_summary.txt
│   │
│   ├── results/
│   │   ├── total_deformation.png
│   │   ├── directional_deformation_Y.png
│   │   ├── equivalent_stress.png
│   │   ├── stress_probe.png
│   │   └── result_summary.csv
│   │
│   ├── convergence_study/
│   │   ├── convergence.csv
│   │   ├── convergence_plot.png
│   │   └── convergence_summary.md
│   │
│   └── README_ANSYS.md
│
├── report/
│   └── water_foundation_report.pdf
│
├── figures/
│   ├── deformation_plot.png
│   ├── stress_distribution.png
│   └── mesh_plot.png
│
└── references/
    └── theory_notes/
```

---

# ANSYS Workflow

The ANSYS workflow includes:

1. Geometry creation  
2. Axisymmetric setup  
3. Material assignment  
4. Hydrostatic pressure definition  
5. Mesh generation using mapped mesh  
6. Boundary condition application  
7. Static structural solution  
8. Stress and deformation evaluation  
9. Convergence study  
10. Postprocessing and validation  

---

# Files Included

| Folder | Description |
|---|---|
| geometry/ | Geometry screenshots and CAD |
| mesh/ | Mesh screenshots and statistics |
| boundary_conditions/ | Boundary condition setup |
| results/ | Stress and deformation results |
| convergence_study/ | Mesh convergence analysis |
| report/ | Final engineering report |

---

# Key Learnings

This project demonstrates:

- Axisymmetric FEM formulation
- Hydrostatic pressure loading
- Mapped mesh generation
- Structured meshing techniques
- Stress concentration evaluation
- Mesh convergence study
- ANSYS Mechanical workflow
- Engineering result interpretation

---

# Future Extensions

Future improvements may include:

- nonlinear material behavior
- fluid-structure interaction
- transient hydrostatic loading
- crack propagation
- reinforced concrete modeling
- thermal coupling analysis

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
