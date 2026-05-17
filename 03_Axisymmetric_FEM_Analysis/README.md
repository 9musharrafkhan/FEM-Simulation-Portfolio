# 03_Axisymmetric_FEM_Analysis

# Axisymmetric Finite Element Analysis using ANSYS

---

# Overview

This project presents the finite element analysis of axisymmetric structures using ANSYS Mechanical.

Axisymmetric analysis is used for structures whose:

- geometry
- loading
- material behavior
- boundary conditions

are symmetric about a central axis.

The project focuses on:

- efficient 2D axisymmetric modeling
- stress and deformation evaluation
- pressure loading
- validation of axisymmetric assumptions
- engineering simulation workflow

The objective of this project is to:

- understand axisymmetric FEM formulation
- reduce computational cost using symmetry
- evaluate radial and axial stresses
- investigate displacement behavior
- perform engineering validation using ANSYS

---

# Theory of Axisymmetric Analysis

Axisymmetric analysis assumes that:

- the geometry is rotationally symmetric
- loading does not vary circumferentially
- deformation is independent of angular position

Instead of modeling the full 3D structure, only a 2D cross-section is modeled.

The solver internally rotates the section about the axis of symmetry.

This significantly reduces:

- computational cost
- mesh size
- solution time

while maintaining accurate structural response.

---

# Governing Equations

The axisymmetric formulation is based on:

## Equilibrium Equations

```math
\nabla \cdot \sigma + b = 0
```

---

# Strain Components

The strain vector for axisymmetric problems becomes:

```math
\varepsilon =
\begin{bmatrix}
\varepsilon_r \\
\varepsilon_z \\
\varepsilon_\theta \\
\gamma_{rz}
\end{bmatrix}
```

Where:

- \( \varepsilon_r \) = radial strain
- \( \varepsilon_z \) = axial strain
- \( \varepsilon_\theta \) = hoop strain
- \( \gamma_{rz} \) = shear strain

---

# Constitutive Relation

For isotropic linear elasticity:

```math
\sigma = C \varepsilon
```

Where:

- \( \sigma \) = stress vector
- \( C \) = constitutive matrix
- \( \varepsilon \) = strain vector

---

# Typical Applications

Axisymmetric FEM is commonly used for:

- pressure vessels
- tanks
- foundations
- pipes
- cylinders
- tunnels
- shafts
- rotating structures
- nozzles
- seals

---

# Project Scope

This repository contains:

- geometry modeling
- material definition
- axisymmetric element formulation
- mesh generation
- pressure loading
- stress analysis
- deformation analysis
- convergence studies
- engineering validation

---

# Analysis Type

| Parameter | Value |
|---|---|
| Analysis Type | Static Structural |
| Formulation | Axisymmetric |
| Solver | Direct Sparse |
| Large Deflection | OFF / ON |

---

# Element Information

| Parameter | Value |
|---|---|
| Element Type | PLANE182 / PLANE183 |
| Formulation | 2D Axisymmetric |
| DOFs | Radial and Axial Displacement |

---

# Coordinate System

The axisymmetric formulation uses:

| Direction | Meaning |
|---|---|
| X-axis | Radial Direction |
| Y-axis | Axial Direction |

The axis of rotation is the vertical axis.

---

# Mesh Information

The model is discretized using structured quadrilateral elements.

Typical mesh controls include:

- mapped mesh
- inflation layers
- local refinement
- convergence refinement

---

# Boundary Conditions

Typical axisymmetric boundary conditions include:

- symmetry constraints
- fixed supports
- pressure loading
- displacement constraints
- contact interfaces

---

# Expected Results

The analysis evaluates:

- total deformation
- radial displacement
- axial displacement
- hoop stress
- von Mises stress
- contact pressure
- strain distribution

---

# Validation

Validation may include:

- analytical thick cylinder solutions
- pressure vessel equations
- mesh convergence studies
- comparison with literature
- reaction force equilibrium

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
