# Truss Structure Analysis using ANSYS

---

# Overview

This project presents the structural analysis of a planar truss structure using ANSYS Mechanical.

The analysis includes:

- Static structural analysis
- Stress and deformation evaluation
- Truss member force investigation
- Mesh convergence study
- Validation using analytical calculations

The objective of this project is to:

- Analyze truss member behavior under external loading
- Evaluate structural deformation and stress distribution
- Validate ANSYS results using analytical truss equations
- Demonstrate engineering simulation workflow

---

# Problem Description

A planar truss structure subjected to multiple inclined loads is analyzed using ANSYS Mechanical.

The truss consists of:

- Pin and roller supports
- Multiple inclined members
- External concentrated loads

The structure is modeled using truss/beam elements.

---

# Geometry

## Truss Dimensions

| Parameter | Value |
|---|---|
| Total Span | 12 m |
| Segment Length | 4 m |
| Inclination Angle | 30° |

---

# Cross Section

L-Type Section

| Parameter | Value |
|---|---|
| Width | 60 mm |
| Height | 60 mm |
| Thickness | 10 mm |

Cross-sectional area:

```math
A = 1100 \ mm^2
```

---

# Material Properties

| Property | Value |
|---|---|
| Material | Structural Steel |
| Young’s Modulus | 200 GPa |
| Poisson Ratio | 0.3 |

---

# Loading Conditions

| Location | Load |
|---|---|
| Joint D | 10 kN |
| Joint F | 20 kN |
| Joint E | 10 kN |

---

# Boundary Conditions

| Support | Type |
|---|---|
| Joint A | Pinned Support |
| Joint G | Roller Support |

---

# Analytical Solution

---

# Support Reaction at A

Taking moments about point G:

```math
V_A \times 12
=
(10 \times 4)
+
(20 \times 4 \cos30^\circ)
+
(10 \times 8 \cos30^\circ)
```

Substituting:

```math
V_A \times 12
=
40
+
(80 \times 0.866)
+
(80 \times 0.866)
```

```math
V_A \times 12 = 178.6
```

```math
V_A = 14.9 \ kN
```

---

# Member Force \(P_{BD}\)

Taking moments about joint C:

```math
P_{BD} \times 2 = 14.9 \times 4
```

```math
P_{BD} = 29.8 \ kN
```

Member BD is in compression.

---

# Member Force \(P_{CE}\)

Taking moments about joint D:

```math
P_{CE} \times 6 \tan30^\circ
=
14.9 \times 6
```

```math
P_{CE}
=
\frac{89.4}{6 \times 0.5774}
```

```math
P_{CE} = 25.8 \ kN
```

Member CE is in tension.

---

# Governing Equations

The truss analysis is based on:

## Static Equilibrium

```math
\sum F_x = 0
```

```math
\sum F_y = 0
```

```math
\sum M = 0
```

---

# Stress Calculation

Axial stress in truss members:

```math
\sigma = \frac{F}{A}
```

Where:

- \(F\) = axial force
- \(A\) = cross-sectional area

---

# Deformation Relation

Axial deformation:

```math
\delta = \frac{FL}{AE}
```

Where:

- \(F\) = axial force
- \(L\) = member length
- \(A\) = cross-sectional area
- \(E\) = Young's modulus

---

# ANSYS Analysis

The truss structure was analyzed using ANSYS Mechanical Static Structural.

---

# Analysis Type

| Parameter | Value |
|---|---|
| Analysis | Static Structural |
| Solver | Direct Sparse |
| Large Deflection | OFF |

---

# Element Information

| Parameter | Value |
|---|---|
| Element Type | LINK180 / BEAM188 |
| Formulation | Linear Structural |

---

# Mesh Information

| Parameter | Value |
|---|---|
| Mesh Type | Structured |
| Element Size | XX mm |
| Number of Nodes | XXXX |
| Number of Elements | XXXX |

---

# Mesh Convergence Study

A mesh convergence study was performed using multiple mesh densities.

| Mesh Size | Elements | Maximum Deformation |
|---|---|---|
| Coarse | XXXX | XXXX |
| Medium | XXXX | XXXX |
| Fine | XXXX | XXXX |

The solution converged for the fine mesh.

---

# Boundary Conditions Setup

## Support Conditions

- Pinned support at joint A
- Roller support at joint G

## External Loads

- 10 kN at joint D
- 20 kN at joint F
- 10 kN at joint E

---

# Results

The following results were obtained from ANSYS:

- Total deformation
- Axial stress distribution
- Reaction forces
- Member force distribution

---

# Validation

The ANSYS results were compared with analytical truss calculations.

The comparison showed good agreement for:

- Support reactions
- Member forces
- Structural behavior

---

# Key Observations

- Maximum stresses occurred in inclined members near load application.
- Compression and tension members matched analytical predictions.
- Deformation pattern matched expected truss behavior.
- Numerical results converged with mesh refinement.

---

# Repository Structure

```text
Truss_Structure_Analysis/
│
├── README.md
│
├── ansys/
│   │
│   ├── project_files/
│   │   ├── truss_analysis.wbpj
│   │   └── solver_files/
│   │
│   ├── geometry/
│   │   ├── truss_geometry.png
│   │   ├── dimensions.png
│   │   └── truss_geometry.step
│   │
│   ├── mesh/
│   │   ├── coarse_mesh.png
│   │   ├── medium_mesh.png
│   │   ├── fine_mesh.png
│   │   ├── mesh_quality.png
│   │   └── mesh_statistics.txt
│   │
│   ├── boundary_conditions/
│   │   ├── pinned_support.png
│   │   ├── roller_support.png
│   │   ├── load_application.png
│   │   └── BC_summary.txt
│   │
│   ├── results/
│   │   ├── total_deformation.png
│   │   ├── axial_stress.png
│   │   ├── reaction_forces.png
│   │   ├── member_forces.png
│   │   └── probe_results.csv
│   │
│   ├── convergence_study/
│   │   ├── convergence.csv
│   │   ├── convergence_plot.png
│   │   └── convergence_summary.md
│   │
│   └── README_ANSYS.md
│
├── report/
│   └── truss_structure_report.pdf
│
└── figures/
    ├── analytical_solution.png
    ├── stress_distribution.png
    └── deformation_plot.png
```

---

# ANSYS Workflow

The ANSYS workflow includes:

1. Geometry creation  
2. Material assignment  
3. Element selection  
4. Mesh generation  
5. Boundary condition application  
6. Static structural solution  
7. Postprocessing  
8. Convergence study  
9. Validation with analytical solution  

---

# Files Included

| Folder | Description |
|---|---|
| geometry/ | Geometry screenshots and CAD |
| mesh/ | Mesh screenshots and statistics |
| boundary_conditions/ | Boundary condition setup |
| results/ | Deformation and stress results |
| convergence_study/ | Mesh convergence analysis |
| report/ | Final engineering report |

---

# Key Learnings

This project demonstrates:

- Truss structural analysis
- Static equilibrium validation
- FEM structural simulation
- Mesh convergence study
- Stress and deformation evaluation
- ANSYS Mechanical workflow
- Engineering result interpretation

---

# Future Extensions

Future improvements may include:

- Dynamic loading
- Nonlinear truss analysis
- Buckling analysis
- Fatigue analysis
- Topology optimization

---

# Author

Musharraf Khan

M.Sc. Computational Methods in Engineering  
Otto von Guericke University Magdeburg

---

# Tools Used

- ANSYS Mechanical
- Engineering Mechanics
- Structural Analysis

---

# License

This project is licensed under the MIT License.
