# 01_Linear_Cantilever

# Linear Cantilever Beam Analysis using FEM

## Overview

This project presents the Finite Element Analysis (FEM) of a cantilever beam subjected to a tip load.

The beam problem is solved using:

* MATLAB FEM implementation
* Python postprocessing and comparison scripts
* ANSYS Mechanical validation
* Analytical beam theory validation

The objective of this project is to:

* Implement FEM beam formulation from scratch
* Compare different boundary condition implementation methods
* Validate FEM results against analytical solution
* Compare MATLAB and ANSYS solutions
* Study computational efficiency
* Demonstrate professional FEM workflow

---

# Problem Description

A cantilever beam with fixed support at one end is subjected to a concentrated downward load at the free end.

## Geometry

| Parameter             | Value         |
| --------------------- | ------------- |
| Length                | 300 mm        |
| Cross Section         | 20 mm × 20 mm |
| Area                  | 400 mm²       |
| Second Moment of Area | 13333.33 mm⁴  |

---

## Material Properties

| Property            | Value            |
| ------------------- | ---------------- |
| Material            | Structural Steel |
| Young’s Modulus (E) | 210000 MPa       |
| Poisson Ratio       | 0.3              |

---

## Loading

| Parameter      | Value      |
| -------------- | ---------- |
| Load Type      | Point Load |
| Load Magnitude | 1000 N     |
| Load Location  | Free End   |

---

## Mesh Information

| Parameter          | Value |
| ------------------ | ----- |
| Element Size       | 5 mm  |
| Number of Elements | 60    |

The same mesh size is used for:

* MATLAB beam FEM
* ANSYS beam element model
* ANSYS solid element model

---

# Governing Equation

The Euler-Bernoulli beam equation is:

[
EI \frac{d^4w}{dx^4} = q(x)
]

Where:

* (E) = Young’s modulus
* (I) = second moment of area
* (w) = beam deflection
* (q(x)) = applied loading

---

# Analytical Solution

## Second Moment of Area

For a square cross section:

[
I = \frac{bh^3}{12}
]

Substituting:

[
I = \frac{20 \times 20^3}{12}
]

[
I = 13333.33 \ mm^4
]

---

## Maximum Deflection

For a cantilever beam with tip load:

[
\delta_{max} = \frac{PL^3}{3EI}
]

Substituting:

[
\delta_{max} = \frac{1000 \times 300^3}{3 \times 210000 \times 13333.33}
]

[
\delta_{max} = 3.2143 \ mm
]

---

## Maximum Bending Stress

Maximum bending stress:

[
\sigma_{max} = \frac{Mc}{I}
]

Where:

[
M = PL
]

[
M = 1000 \times 300
]

[
M = 300000 \ Nmm
]

[
c = 10 \ mm
]

Substituting:

[
\sigma_{max} = \frac{300000 \times 10}{13333.33}
]

[
\sigma_{max} = 225 \ MPa
]

---

# FEM Formulation
The cantilever beam problem is solved using the Finite Element Method (FEM) based on 3D linear elasticity formulation.

The implementation uses:

8-node hexahedral isoparametric elements (HEX8)
Gaussian numerical integration
Jacobian coordinate transformation
Strain-displacement matrix formulation
3D isotropic constitutive law

The element stiffness matrix is computed using:

K
e
	​

=∫
V
	​

B
T
CBdV

Where:

B = strain-displacement matrix
C = constitutive matrix
V = element volume
Isoparametric HEX8 Element

The solid element contains:

8 nodes
3 displacement DOFs per node

Total degrees of freedom per element:

24=8
times3

The nodal displacement vector becomes:

q
e
	​

=[w
1
	​

,u
1
	​

,v
1
	​

,...,w
8
	​

,u
8
	​

,v
8
	​

]
T
Shape Functions

The geometry and displacement field are interpolated using trilinear shape functions:

N
i
	​

(ξ,η,ζ)=
8
1
	​

(1+ξ
i
	​

ξ)(1+η
i
	​

η)(1+ζ
i
	​

ζ)

Where:

ξ,η,ζ are natural coordinates
N
i
	​

 are interpolation functions

The implementation computes derivatives of shape functions with respect to natural coordinates:

∂ξ
∂N
	​

,
∂η
∂N
	​

,
∂ζ
∂N
	​

Gaussian Integration

The stiffness matrix integration is performed numerically using 2×2×2 Gauss quadrature.

The Gauss points used are:

ξ
G
	​

=±
3
	​

1
	​


Total integration points:

2×2×2=8
Jacobian Transformation

The Jacobian matrix transforms natural coordinates into physical coordinates:

J=
∂(ξ,η,ζ)
∂(x,y,z)
	​


The Jacobian is computed as:

J=N
,xi
	​

cdotx

Where:

N
,xi
	​

 = derivatives of shape functions
x = nodal coordinates

The determinant of the Jacobian:

det(J)

is used for volume transformation during integration.

Constitutive Matrix

The constitutive matrix corresponds to 3D isotropic linear elasticity:

σ=Cε

The constitutive matrix is constructed using:

Young’s modulus E
Poisson ratio ν

The formulation includes:

Normal stresses
Shear stresses

for full three-dimensional elasticity.

Strain-Displacement Matrix (B-Matrix)

The strain-displacement matrix relates nodal displacements to strains:

ε=Bu

The B-matrix contains:

Normal strain terms
Shear strain terms

The matrix size is:

B∈R
6times24
Element Stiffness Matrix Computation

At each Gauss point, the element stiffness contribution is computed as:

K
e
	​

=∑
GP
	​

B
T
CBdet(J)w
i
	​


Where:

B
T
 = transpose of strain-displacement matrix
C = constitutive matrix
det(J) = Jacobian determinant
w
i
	​

 = Gauss integration weights

The final element stiffness matrix has size:

K
e
	​

∈R
24times24
Global Assembly

The global stiffness matrix is assembled using element connectivity:

K=∑K
e
	​


The final FEM system becomes:

Ku=F

Where:

K = global stiffness matrix
u = displacement vector
F = external force vector

# MATLAB Implementation

Two different approaches were implemented for applying boundary conditions.

---

## Method 1 — Delete Row and Column Method

Boundary conditions are imposed by deleting the rows and columns corresponding to constrained degrees of freedom.

### Results

| Quantity           | Value      |
| ------------------ | ---------- |
| Maximum Deflection | -3.2539 mm |
| Computation Time   | 14.835 s   |

---

## Method 2 — Higher Stiffness Method

Boundary conditions are imposed using a very large stiffness value at constrained DOFs.

### Results

| Quantity           | Value      |
| ------------------ | ---------- |
| Maximum Deflection | -3.2539 mm |
| Computation Time   | 1.58 s     |

---

## Total MATLAB Runtime

| Quantity   | Value   |
| ---------- | ------- |
| Total Time | 55.52 s |

---

# ANSYS Validation

The same cantilever beam problem was solved in ANSYS Mechanical using:

* Beam elements
* Solid elements

---

## ANSYS Solid Element Result

| Quantity           | Value      |
| ------------------ | ---------- |
| Maximum Deflection | -3.3705 mm |

---

## ANSYS Beam Element Result

| Quantity           | Value      |
| ------------------ | ---------- |
| Maximum Deflection | -3.3866 mm |

---

# Result Comparison

| Method                         | Maximum Deflection (mm) |
| ------------------------------ | ----------------------- |
| Analytical Solution            | -3.2143                 |
| MATLAB FEM (Delete Row/Column) | -3.2539                 |
| MATLAB FEM (Higher Stiffness)  | -3.2539                 |
| ANSYS Solid Element            | -3.3705                 |
| ANSYS Beam Element             | -3.3866                 |

---

# Error Comparison

## MATLAB FEM Error

[
\text{Error} = \frac{|3.2539 - 3.2143|}{3.2143} \times 100
]

[
\text{Error} = 1.23%
]

---

## ANSYS Solid Element Error

[
\text{Error} = \frac{|3.3705 - 3.2143|}{3.2143} \times 100
]

[
\text{Error} = 4.86%
]

---

## ANSYS Beam Element Error

[
\text{Error} = \frac{|3.3866 - 3.2143|}{3.2143} \times 100
]

[
\text{Error} = 5.36%
]

---

# Repository Structure

```text
01_Linear_Cantilever/
│
├── README.md
│
├── matlab/
│   ├── main.m
│   ├── beam_element.m
│   ├── assemble_global.m
│   ├── apply_boundary_conditions.m
│   ├── solve_system.m
│   ├── stress_recovery.m
│   ├── validation.m
│   └── postprocess.m
│
├── python/
│   ├── convergence_plot.py
│   ├── comparison_plot.py
│   ├── validation_analysis.py
│   └── postprocess.py
│
├── ansys/
│   ├── cantilever_beam.wbpj
│   ├── screenshots/
│   └── exported_results/
│
├── results/
│   ├── displacement_comparison.png
│   ├── stress_distribution.png
│   ├── convergence_plot.png
│   └── analytical_vs_FEM.png
│
├── report/
│   └── cantilever_report.pdf
│
└── data/
    ├── analytical_solution.csv
    └── FEM_results.csv
```

---

# MATLAB Files Description

| File                        | Purpose                               |
| --------------------------- | ------------------------------------- |
| main.m                      | Main simulation driver                |
| material.m                  | Contains Material Properties          |
| geometry.m                  | Defined length and cross-section      |
| mesh_hex8.m                 | Meshing definition                    |
| boundary.m                  | Contains dirichlet BC                 |
| force.m                     | Neumann Boundary condition            |
| element.m                   | Element Definition                    |
| assemble_global.m           | Assembles global stiffness matrix     |
| force_global.m              | Assembles force vector                |
| process_boundV1.m           | Delete rows and column                |
| process_boundV2.m           | Higher Stiffness Method               |
| Plot_Def_3D.m               | Plot Deformed Shape                   |
| postprocess.m               | Generates plots and output            |

---

# Python Files Description

| File                   | Purpose                        |
| ---------------------- | ------------------------------ |
| convergence_plot.py    | Mesh convergence visualization |
| comparison_plot.py     | MATLAB vs ANSYS comparison     |
| validation_analysis.py | Error analysis                 |
| postprocess.py         | Generates graphs and plots     |

---

# ANSYS Workflow

The ANSYS validation includes:

1. Geometry creation
2. Material assignment
3. Mesh generation
4. Static structural setup
5. Beam and solid element comparison
6. Postprocessing

---

# Key Learnings

This project demonstrates:

* FEM beam formulation
* Matrix assembly procedures
* Boundary condition implementation methods
* Computational efficiency comparison
* Validation against analytical solutions
* ANSYS verification workflow
* Professional FEM documentation

---

# Conclusions

* Both MATLAB methods produced identical displacement results.
* The higher stiffness method was computationally faster.
* MATLAB FEM showed very good agreement with analytical beam theory.
* ANSYS beam and solid models validated the numerical implementation.
* Small differences arise due to element formulation and numerical approximations.

---

# Future Extensions

Planned future extensions include:

* 2D elasticity formulation
* Geometric nonlinearity
* Contact mechanics
* Hyperelastic materials
* Modal analysis
* Parallel FEM implementation

---

# Author

Musharraf Khan

M.Sc. Computational Methods in Engineering
Otto von Guericke University Magdeburg

---

# Tools Used

* MATLAB
* Python
* ANSYS Mechanical

---

# License

This project is licensed under the MIT License.

