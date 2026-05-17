# Truss Structure Analysis using ANSYS

---

# Overview

This project presents the structural analysis of a planar truss structure using ANSYS Mechanical.

The analysis includes:

- Static structural analysis
- Stress and deformation evaluation
- Truss member force investigation
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

- Roller and hinge supports
- Multiple inclined members
- External concentrated loads

The structure is modeled using truss/link elements.

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
| Joint D | 10 kN inclined load |
| Joint F | 20 kN inclined load |
| Joint E | 10 kN vertical downward |
| Joint G | 10 kN inclined load |

---

# Boundary Conditions

| Support | Type |
|---|---|
| Joint A | Roller Support |
| Joint G | Hinge Support |

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
| Element Type | LINK180 |
| Formulation | 3D Spar / Truss Element |
| Degrees of Freedom | Translational DOFs |
| Behavior | Axial Force Only |

---

# Mesh Information

Since LINK180 truss elements were used, each truss member was modeled using a single finite element.

| Parameter | Value |
|---|---|
| Mesh Type | Line Body Mesh |
| Number of Divisions | 1 |

---

# Boundary Conditions Setup

## Support Conditions

- Roller support at joint A
- Hinge support at joint G

## External Loads

- Inclined load at joint D
- Inclined load at joint F
- Inclined load at joint G
- Vertical load at joint E

---

# ANSYS Results

The following results were obtained from ANSYS:

| Quantity | ANSYS Result |
|---|---|
| Reaction Force at A | 14.8 kN |
| Force in Member BD | -29.7 kN |
| Force in Member CE | 25.7 kN |

---

# Member Force Interpretation

| Member | Force | Nature |
|---|---|---|
| BD | -29.7 kN | Compression |
| CE | 25.7 kN | Tension |

Negative sign indicates compressive axial force.

Positive sign indicates tensile axial force.

---

# Validation

The ANSYS results were compared with analytical truss calculations.

| Quantity | Analytical | ANSYS | Difference |
|---|---|---|---|
| Reaction at A | 14.9 kN | 14.8 kN | Very Small |
| Force in BD | 29.8 kN | 29.7 kN | Very Small |
| Force in CE | 25.8 kN | 25.7 kN | Very Small |

The ANSYS solution showed excellent agreement with analytical calculations.

---

# Key Observations

- Compression occurred in member BD.
- Tension occurred in member CE.
- Support reactions matched analytical equilibrium equations.
- LINK180 elements efficiently modeled axial truss behavior.
- Single element per member was sufficient for truss force prediction.

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
│   │   ├── truss.wbpj
│   │   └── truss_files/
│   │
│   ├── mesh/
│   │   └── mesh_size.PNG
│   │
│   ├── boundary_conditions/
│   │   └── boundary_conditions.PNG
│   │
│   ├── results/
│   │   ├── axial_force_in_truss_BD.PNG
│   │   ├── axial_force_in_truss_CE.PNG
│   │   ├── reaction_forces.PNG
│   │   └── directional_deformation.PNG
│   │
│   └── README_ANSYS.md
│
└── geometry/
    └── truss_geometry.pdf
```

---

# ANSYS Workflow

The ANSYS workflow includes:

1. Geometry creation  
2. Material assignment  
3. LINK180 element definition  
4. Mesh generation  
5. Boundary condition application  
6. Static structural solution  
7. Axial force extraction  
8. Reaction force evaluation  
9. Validation with analytical solution  

---

# Key Learnings

This project demonstrates:

- Truss structural analysis
- Static equilibrium validation
- Axial force prediction
- Compression and tension member identification
- LINK180 truss element formulation
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
