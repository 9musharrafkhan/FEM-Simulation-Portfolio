# ANSYS Validation — Linear Cantilever Beam

---

# Overview

This section presents the ANSYS Mechanical validation of the linear cantilever beam problem.

The objective is to:

- Validate MATLAB FEM implementation
- Compare beam and solid element formulations
- Perform mesh convergence study
- Evaluate displacement and stress distribution

The analysis was performed using ANSYS Mechanical Static Structural.

---

# Problem Description

A cantilever beam with fixed support at one end is subjected to a downward point load at the free end.

---

# Geometry

| Parameter | Value |
|---|---|
| Length | 300 mm |
| Cross Section | 20 mm × 20 mm |

---

# Material Properties

| Property | Value |
|---|---|
| Material | Structural Steel |
| Young's Modulus | 210000 MPa |
| Poisson Ratio | 0.3 |

---

# Analysis Type

| Parameter | Value |
|---|---|
| Analysis | Static Structural |
| Large Deflection | OFF |
| Solver | Direct Sparse |

---

# Element Information

## Beam Model

| Parameter | Value |
|---|---|
| Element Type | BEAM188 |
| Formulation | Timoshenko Beam |

---

## Solid Model

| Parameter | Value |
|---|---|
| Element Type | SOLID186 |
| Formulation | 3D Quadratic Solid |

---

# Boundary Conditions

## Fixed Support

Fixed support applied at left face of beam.

## External Load

1000 N downward force applied at free end.

---

# Mesh Information

| Mesh Size | Elements in Solid Model | Elements in Beam Model |
|---|---|---|---|
| 20 mm | 15 | 15 |
| 10 mm | 120 | 30 |
| 5 mm | 960 | 60 |

The final validation mesh size used was 5 mm.

---

# Results

## Beam Element Result

| Quantity | Value |
|---|---|
| Maximum Deflection | -3.3866 mm |

---

## Solid Element Result

| Quantity | Value |
|---|---|
| Maximum Deflection | -3.3705 mm |

---

# Convergence Study

A mesh refinement study was performed to ensure mesh-independent results.

The displacement converged as mesh density increased.

---

# Validation

The ANSYS results were compared with:

- MATLAB FEM implementation
- Analytical Euler-Bernoulli beam theory

The results showed good agreement.

---

# Key Observations

- Beam and solid element results were close.
- Small differences arise from element formulation.
- Mesh refinement improved numerical accuracy.
- ANSYS validation confirmed correctness of FEM implementation.

---

# Files Included

| Folder | Description |
|---|---|
| geometry/ | Geometry screenshots and CAD |
| mesh/ | Mesh screenshots and statistics |
| boundary_conditions/ | BC setup screenshots |
| results/ | Deformation and stress plots |
| convergence_study/ | Mesh convergence results |

---



