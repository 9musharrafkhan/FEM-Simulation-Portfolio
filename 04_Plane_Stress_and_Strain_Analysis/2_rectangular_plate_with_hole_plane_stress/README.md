# 04_2_Rectangular_Plate_With_Rectangular_Hole

# Finite Element Analysis of Rectangular Plate with Rectangular Hole

---

# Overview

This project presents the finite element analysis (FEM) of a rectangular plate with a centered rectangular hole subjected to uniaxial tensile loading.

The analysis was performed using:

* MATLAB custom FEM implementation
* ANSYS APDL
* ANSYS Workbench

The project focuses on:

* stress concentration analysis
* deformation behavior
* comparison between MATLAB and ANSYS results
* mesh sensitivity
* stress singularity investigation

The objective of this project is to:

* implement 2D FEM formulation
* validate MATLAB FEM code using ANSYS
* study stress concentration near sharp corners
* compare displacement and stress predictions
* investigate stress singularity behavior
* demonstrate professional FEM workflow

---

# Problem Description

A rectangular steel plate containing a rectangular hole is subjected to tensile pressure loading.

The sharp corners of the rectangular hole create stress concentration regions, making the problem important for:

* structural mechanics
* fracture mechanics
* thin-walled structures
* stress concentration analysis

---

# Geometry

## Plate Dimensions

| Parameter    | Value  |
| ------------ | ------ |
| Plate Width  | 200 mm |
| Plate Height | 100 mm |
| Thickness    | 5 mm   |

---

# Rectangular Hole Dimensions

| Parameter   | Value           |
| ----------- | --------------- |
| Hole Width  | 60 mm           |
| Hole Height | 30 mm           |
| Hole Center | (100 mm, 50 mm) |

Hole boundaries:

```math
x = 70 \text{ to } 130 \ mm
```

```math
y = 35 \text{ to } 65 \ mm
```

---

# Material Properties

| Property        | Value            |
| --------------- | ---------------- |
| Material        | Structural Steel |
| Young’s Modulus | 210000 MPa       |
| Poisson Ratio   | 0.3              |

---

# Loading and Boundary Conditions

## Boundary Conditions

| Boundary  | Condition   |
| --------- | ----------- |
| Left Edge | Fully Fixed |

```math
u_x = 0,\quad u_y = 0
```

---

# Loading

| Boundary   | Load                         |
| ---------- | ---------------------------- |
| Right Edge | Distributed Tensile Pressure |

Applied pressure:

```math
P = 100 \ MPa
```

---

# Mesh Information

| Parameter     | Value                |
| ------------- | -------------------- |
| Element Type  | 4-node Quadrilateral |
| ANSYS Element | PLANE182             |
| Mesh Spacing  | 2 mm                 |
| Mesh Type     | Structured           |

The rectangular hole was modeled by removing elements located inside the hole region.

The mesh near the hole creates a staircase approximation of the rectangular geometry.

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

# MATLAB FEM Implementation

The MATLAB implementation includes:

* mesh generation
* stiffness matrix assembly
* quadrilateral element formulation
* boundary condition application
* stress recovery
* postprocessing

The problem was solved using custom FEM code developed from scratch.

---

# MATLAB Results

| Quantity                 | Value       |
| ------------------------ | ----------- |
| Minimum Von Mises Stress | 28.19 MPa   |
| Maximum Von Mises Stress | 278.81 MPa  |
| Maximum X-Deformation    | 0.115844 mm |
| Maximum Y-Deformation    | 0.016799 mm |

---

# ANSYS APDL Analysis

The same problem was modeled and solved using ANSYS APDL for validation.

---

# ANSYS APDL Results

| Quantity                 | Value       |
| ------------------------ | ----------- |
| Minimum Von Mises Stress | 27.60 MPa   |
| Maximum Von Mises Stress | 226.455 MPa |
| Maximum X-Deformation    | 0.105077 mm |
| Maximum Y-Deformation    | 0.018168 mm |

---

# ANSYS Workbench Analysis

The geometry was additionally solved using ANSYS Workbench.

---

# ANSYS Workbench Results

| Quantity                 | Value       |
| ------------------------ | ----------- |
| Minimum Von Mises Stress | 27.21 MPa   |
| Maximum Von Mises Stress | 256.83 MPa  |
| Maximum X-Deformation    | 0.12431 mm  |
| Maximum Y-Deformation    | 0.018573 mm |

---

# Results Comparison

| Method          | Von Mises Stress (MPa) | X-Deformation (mm) | Y-Deformation (mm) |
| --------------- | ---------------------- | ------------------ | ------------------ |
| MATLAB FEM      | 28.19 – 278.81         | 0.115844           | 0.016799           |
| ANSYS APDL      | 27.60 – 226.455        | 0.105077           | 0.018168           |
| ANSYS Workbench | 27.21 – 256.83         | 0.12431            | 0.018573           |

---

# Discussion of Result Deviations

The displacement results show good agreement between MATLAB and ANSYS solutions.

However, larger deviations are observed in stress predictions.

---

# Primary Reason: Stress Singularity

The major reason for stress deviation is the stress singularity occurring at the sharp re-entrant corners of the rectangular hole.

---

# Why Stress Singularity Occurs

## 1. Geometric Discontinuity

Sharp 90° corners produce extremely high stress concentration.

---

## 2. Mathematical Behavior

The stress field theoretically approaches infinity near sharp re-entrant corners.

---

## 3. Mesh Sensitivity

Stress values near singular regions become highly dependent on mesh refinement.

Finer meshes generally produce:

* higher peak stresses
* non-converging stress values

---

# Why Displacements Match Better

Displacements are primary FEM variables and are solved directly from the stiffness matrix.

They are:

* less sensitive to local geometry
* smoother numerically
* more stable under mesh refinement

Stress values are secondary variables derived from displacement gradients, making them highly sensitive to mesh quality and singularities.

---

# ANSYS Analysis Information

---

# Analysis Type

| Parameter   | Value             |
| ----------- | ----------------- |
| Analysis    | Static Structural |
| Formulation | Plane Stress      |
| Solver      | Direct Sparse     |

---

# Element Information

| Parameter         | Value    |
| ----------------- | -------- |
| Element Type      | PLANE182 |
| Nodes per Element | 4        |
| DOF per Node      | 2        |

---

# Mesh Strategy

The mesh was refined near the rectangular hole to improve:

* stress resolution
* displacement accuracy
* stress concentration capture

---

# Validation

Validation was performed by comparing:

* MATLAB FEM
* ANSYS APDL
* ANSYS Workbench

The results showed:

* good displacement agreement
* acceptable stress prediction trends
* correct stress concentration behavior

---

# Key Observations

* Maximum stress occurs near rectangular hole corners.
* Displacements show strong agreement across all methods.
* Stress values vary due to singularity effects.
* Structured mesh improves deformation prediction.
* Sharp corners create localized stress concentration.

---

# Conclusions

1. MATLAB FEM implementation was successfully validated using ANSYS.

2. Displacement predictions showed good agreement between all methods.

3. Stress deviations are mainly caused by stress singularity near sharp corners.

4. The problem demonstrates the importance of mesh refinement in stress analysis.

5. Stress concentration effects dominate structural behavior near geometric discontinuities.

---

# Repository Structure

```text
04_2_Rectangular_Plate_With_Rectangular_Hole/
│
├── README.md
│
├── matlab/
│   ├── main.m
│   ├── material.m
│   ├── geometry.m
│   ├── mesh_quad4.m
│   ├── assemble_global.m
│   ├── boundary_conditions.m
│   ├── solve_system.m
│   ├── stress_recovery.m
│   ├── postprocess.m
│   └── validation.m
│
├── ansys_apdl/
│   ├── plate_hole.mac
│   ├── mesh.png
│   ├── stress_result.png
│   ├── deformation_x.png
│   └── deformation_y.png
│
├── ansys_workbench/
│   ├── project_files/
│   ├── mesh/
│   ├── results/
│   └── screenshots/
│
├── report/
│   └── rectangular_plate_hole_report.pdf
│
├── figures/
│   ├── mesh_visualization.png
│   ├── stress_distribution.png
│   ├── deformation_plot.png
│   └── comparison_plot.png
│
├── data/
│   ├── matlab_results.csv
│   ├── ansys_results.csv
│   └── convergence.csv
│
└── python/
    ├── comparison_plot.py
    ├── convergence_plot.py
    ├── validation_analysis.py
    └── postprocess.py
```

---

# Key Learnings

This project demonstrates:

* 2D finite element formulation
* Plane stress analysis
* Quadrilateral element implementation
* Stress concentration analysis
* Stress singularity behavior
* FEM validation techniques
* MATLAB and ANSYS comparison
* Engineering result interpretation

---

# Future Extensions

Future improvements may include:

* adaptive mesh refinement
* higher-order elements
* nonlinear material behavior
* fracture mechanics
* crack propagation
* topology optimization

---

# Author

Musharraf Khan

M.Sc. Computational Methods in Engineering
Otto von Guericke University Magdeburg

---

# Tools Used

* MATLAB
* ANSYS APDL
* ANSYS Workbench
* Finite Element Method

---

# Reference Report

Detailed project report uploaded by the author.

---

# License

This project is licensed under the MIT License.

