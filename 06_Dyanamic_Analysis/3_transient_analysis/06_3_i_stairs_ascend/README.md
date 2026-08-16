# 06_3_i_Stairs_Ascend

# Transient Structural Analysis of Staircase using ANSYS Mechanical

---

# Overview

This project demonstrates a **Transient Structural Analysis** of a staircase subjected to a time-dependent moving load using **ANSYS Mechanical**.

The staircase represents a structural component subjected to a person climbing the stairs. A load of **1000 N** is applied sequentially to individual steps, representing the movement of a person from one step to the next.

Unlike static structural analysis, transient analysis considers the variation of loading with time and therefore allows the structural response to be evaluated throughout the climbing process.

The analysis evaluates:

- Time-dependent structural response
- Equivalent (von-Mises) stress
- Total deformation
- Directional deformation
- Load movement from step to step
- Structural response at the final loading position

---

# Problem Statement

A staircase consisting of **13 steps** is subjected to a moving load representing a person climbing the staircase.

The person applies a load of:

```math
F=1000\;N
````

The load is applied sequentially to each step, with the person spending approximately **1 second on each step**.

Therefore, the complete loading sequence is approximately:

```math
T=19\;s
```

The objective is to determine the transient structural response of the staircase during the climbing process.

---

# Objectives

The objectives of this project are to:

* Model the staircase using ANSYS Mechanical.
* Define structural steel material properties.
* Apply a fixed support boundary condition.
* Simulate a person climbing the staircase.
* Apply a 1000 N load sequentially to the steps.
* Perform transient structural analysis.
* Determine equivalent von-Mises stress.
* Determine total deformation.
* Determine directional deformation.
* Identify the critical loading position.
* Evaluate the structural response throughout the loading period.

---

# Problem Parameters

| Parameter              | Value                            |
| ---------------------- | -------------------------------- |
| Number of Steps        | 19                               |
| Load                   | 1000 N                           |
| Loading Duration       | 19 s                             |
| Load Application       | Sequentially on each step        |
| Material               | Structural Steel                 |
| Young's Modulus        | 200 GPa                          |
| Poisson's Ratio        | 0.3                              |
| Density                | 7850 kg/m³                       |
| Tensile Yield Strength | 250 MPa                          |
| Factor of Safety       | 2                                |
| Allowable Stress       | 125 MPa                          |
| Analysis Type          | Transient Structural             |
| Software               | ANSYS Mechanical 2026 R1 Student |

---

# Material Properties

The staircase is modeled using **Structural Steel**.

## Young's Modulus

```math
E=200\;GPa
```

or

```math
E=200\times10^9\;Pa
```

Young's modulus represents the stiffness of the material.

---

## Poisson's Ratio

```math
\nu=0.3
```

Poisson's ratio defines the relationship between longitudinal and transverse deformation.

---

## Density

```math
\rho=7850\;kg/m^3
```

Density is particularly important in transient and dynamic analysis because the mass matrix depends on the material density.

---

## Yield Strength

```math
\sigma_y=250\;MPa
```

---

## Factor of Safety

```math
FOS=2
```

Therefore, the allowable stress is

```math
\sigma_{allow}=\frac{\sigma_y}{FOS}
```

```math
\sigma_{allow}=\frac{250}{2}=125\;MPa
```

The calculated equivalent stress can therefore be compared with the allowable stress of **125 MPa**.

---

# Geometry

The analyzed structure is a staircase consisting of **13 individual steps**.

The staircase is modeled as a continuous structural component with the lower/support region constrained while the load moves from one step to another.

The load application sequence represents a person ascending the staircase.

---

# Loading Concept

The person climbing the staircase is represented by a concentrated force of:

```math
F=1000\;N
```

The force is applied in the negative Z direction.

The load moves from one step to the next as time increases.

A simplified representation of the loading sequence is:

| Time (s) | Loaded Step |
| -------- | ----------- |
| 1        | Step 1      |
| 2        | Step 2      |
| 3        | Step 3      |
| 4        | Step 4      |
| 5        | Step 5      |
| 6        | Step 6      |
| 7        | Step 7      |
| 8        | Step 8      |
| 9        | Step 9      |
| 10       | Step 10     |
| 11       | Step 11     |
| 12       | Step 12     |
| 13       | Step 13     |
| 14       | Step 14     |
| 15       | Step 15     |
| 16       | Step 16     |
| 17       | Step 17     |
| 18       | Step 18     |
| 19       | Step 19     |

At each time interval, the force is transferred to the corresponding step.

---

# Boundary Conditions

## Fixed Support

The staircase is constrained using a **Fixed Support** boundary condition.

The fixed support prevents translational and rotational movement at the selected support region.

Therefore,

```math
u_x=u_y=u_z=0
```

at the fixed support.

The fixed support configuration is shown in the ANSYS model.

---

# Transient Structural Analysis

## Purpose

Transient structural analysis determines the structural response as a function of time.

The general equation of motion for the structure is:

```math
M\ddot{x}+C\dot{x}+Kx=F(t)
```

Where:

* (M) = Mass matrix
* (C) = Damping matrix
* (K) = Stiffness matrix
* (x) = Displacement vector
* (\dot{x}) = Velocity vector
* (\ddot{x}) = Acceleration vector
* (F(t)) = Time-dependent external force

In this project, the force position changes with time as the person moves from one step to another.

---

````markdown
# Time-Dependent Loading

The applied force can be represented as a piecewise time-dependent function.

For a particular step \(i\),

```math
F_i(t)=
\begin{cases}
1000\ \text{N}, & t_i \leq t < t_{i+1} \\
0, & \text{otherwise}
\end{cases}
````

The complete loading condition is therefore a sequence of force functions:

```math
F(t)=F_1(t)+F_2(t)+F_3(t)+\cdots+F_{13}(t)
```

This allows the load to move progressively along the staircase.

```

# ANSYS Analysis Setup

The transient structural analysis consists of:

1. Geometry
2. Material assignment
3. Mesh generation
4. Fixed support
5. Time-dependent force
6. Transient analysis settings
7. Solution
8. Post-processing

---

# Mesh

The staircase was discretized using finite elements in ANSYS Mechanical.

The mesh contains both:

* Triangular elements
* Quadrilateral elements

The mesh is refined sufficiently to represent the geometry of the staircase and its individual steps.

Mesh quality was evaluated using the available element-quality metrics.

---

# Mesh Quality

The mesh-quality evaluation indicates that the majority of the generated elements have relatively high-quality metrics.

Good mesh quality is important because poor-quality elements can introduce numerical errors and reduce the accuracy of:

* Stress
* Deformation
* Load transfer
* Transient response

---

# Mesh Convergence Consideration

For reliable FEM results, the mesh should be refined until the important result quantities show negligible changes.

A typical mesh convergence procedure is:

1. Generate coarse mesh.
2. Solve the transient analysis.
3. Record maximum stress and deformation.
4. Refine the mesh.
5. Repeat the analysis.
6. Compare the results.
7. Continue until the results become sufficiently insensitive to mesh refinement.

The staircase model uses a structured/refined mesh suitable for resolving the step geometry.

---

# Transient Response

The structural response changes continuously as the load moves along the staircase.

The critical response depends on:

* Load position
* Structural stiffness
* Distance from the support
* Local geometry
* Mass distribution
* Dynamic effects

The maximum deformation and stress therefore do not necessarily occur at the same location for every load position.

---

# Equivalent Von-Mises Stress

The equivalent stress is used to evaluate the distortion-energy-based stress state.

For a three-dimensional stress state:

```math
\sigma_{vm}=
\sqrt{
\frac{1}{2}
\left[
(\sigma_x-\sigma_y)^2+
(\sigma_y-\sigma_z)^2+
(\sigma_z-\sigma_x)^2+
6(\tau_{xy}^2+\tau_{yz}^2+\tau_{zx}^2)
\right]
}
```

The maximum equivalent stress obtained from the ANSYS result shown is approximately:

```math
\sigma_{vm,max}=71.826\;MPa
```

---

# Stress Evaluation

The allowable stress is:

```math
\sigma_{allow}=125\;MPa
```

The calculated maximum equivalent stress is:

```math
\sigma_{vm,max}=71.826\;MPa
```

Therefore:

```math
\sigma_{vm,max}<\sigma_{allow}
```

The corresponding stress utilization is approximately:

```math
\frac{71.826}{125}\times100\approx57.46\%
```

Thus, based on the shown ANSYS result, the maximum von-Mises stress remains below the specified allowable stress.

---

# Total Deformation

Total deformation represents the magnitude of the displacement vector.

```math
u_{total}=
\sqrt{u_x^2+u_y^2+u_z^2}
```

The ANSYS result shown for the final loading condition gives:

```math
u_{total,max}=8.2643\;mm
```

The maximum deformation occurs near the loaded/support-critical region of the staircase.

---

# Directional Deformation

Directional deformation describes displacement along a selected coordinate direction.

For the Z direction:

```math
u_z
```

The ANSYS result shows:

```math
u_{z,max}=0.28361\;mm
```

and

```math
u_{z,min}=-8.2639\;mm
```

Therefore, the dominant displacement component for the shown result is in the negative Z direction.

---

# Result Summary

| Result                            | ANSYS Value |
| --------------------------------- | ----------- |
| Maximum Equivalent Stress         | 71.826 MPa  |
| Allowable Stress                  | 125 MPa     |
| Stress Utilization                | ≈ 57.46%    |
| Maximum Total Deformation         | 8.2643 mm   |
| Maximum Z Directional Deformation | 0.28361 mm  |
| Minimum Z Directional Deformation | -8.2639 mm  |
| Applied Load                      | 1000 N      |
| Total Loading Duration            | 13 s        |
| Number of Steps                   | 13          |

---

# Structural Safety Evaluation

The allowable stress based on the specified factor of safety is:

```math
\sigma_{allow}=125\;MPa
```

The maximum equivalent stress from the ANSYS result is:

```math
\sigma_{vm,max}=71.826\;MPa
```

Since:

```math
71.826<125
```

the staircase satisfies the specified stress criterion for the analyzed loading condition.

The stress margin relative to the allowable stress is approximately:

```math
125-71.826=53.174\;MPa
```

---

# Interpretation of Results

The transient analysis demonstrates that the structural response changes as the person moves upward through the staircase.

The applied 1000 N load produces the largest structural response when the load is located at a position that generates a high structural moment and deformation.

The ANSYS results indicate:

* The maximum equivalent stress is approximately **71.826 MPa**.
* The maximum stress is below the specified allowable stress of **125 MPa**.
* The maximum total deformation is approximately **8.2643 mm**.
* The deformation is dominated by the Z-direction response.
* The load position strongly influences the structural response.

---

# Transient Analysis Workflow

The complete ANSYS workflow is:

```text
Create Geometry
      │
      ▼
Assign Structural Steel
      │
      ▼
Generate Mesh
      │
      ▼
Check Mesh Quality
      │
      ▼
Apply Fixed Support
      │
      ▼
Define Transient Structural Analysis
      │
      ▼
Define Time Steps
      │
      ▼
Apply 1000 N Moving Load
      │
      ▼
Solve
      │
      ▼
Equivalent Stress
      │
      ▼
Total Deformation
      │
      ▼
Directional Deformation
      │
      ▼
Interpret Results
```

---

# Limitations

The present model represents the person using a simplified **1000 N load** applied sequentially to the steps.

The model does not explicitly include:

* Human body dynamics
* Foot contact mechanics
* Multiple simultaneous contact points
* Human acceleration and deceleration
* Variable body weight
* Damping characterization from experimental measurements
* Friction between shoes and steps

Therefore, the results represent a simplified engineering approximation of staircase loading.

---

# Repository Structure

```text
06_3_i_Stairs_Ascend/
│
├── README.md
│
├── ansys/
│   ├── project_files/
│   │   ├── stairs.wbpj
│   │   └── stairs.wbpj
│   │
│   ├── boundary_conditions/
│   │   ├── fixed_support.png
│   │   ├── force1.png
│   │   ├── forcei.png
│   │   └── force19.png
│   │
│   ├── mesh/
│   │   ├── mesh_size.png
│   │   └── mesh_quality.png
│   │
│   └── results/
│
└── geometry/
    ├── geometry.peg
    └── stairs.step
```

---

# Key Learnings

This project demonstrates:

* Transient structural analysis using ANSYS Mechanical.
* Time-dependent loading.
* Moving-load simulation.
* Sequential force application.
* Finite Element Modeling of staircase structures.
* Mesh generation and quality evaluation.
* Fixed-support boundary conditions.
* Equivalent von-Mises stress evaluation.
* Total deformation evaluation.
* Directional deformation evaluation.
* Structural safety assessment using allowable stress.
* Interpretation of time-dependent structural response.

---

# Conclusion

A transient structural analysis of a **19-step staircase** was performed using ANSYS Mechanical.

A **1000 N load** was applied sequentially to the steps to represent a person ascending the staircase over approximately **13 seconds**.

The final ANSYS results show a maximum equivalent stress of approximately **71.826 MPa**, which is below the specified allowable stress of **125 MPa** based on a yield strength of 250 MPa and a factor of safety of 2.

The maximum total deformation shown in the final result is approximately **8.2643 mm**, while the Z-directional deformation ranges from approximately **+0.28361 mm to -8.2639 mm**.

The analysis demonstrates how transient FEM can be used to evaluate structural behavior under a moving, time-dependent load.

---

# Author

**Musharraf Khan**

M.Sc. Computational Methods in Engineering
Otto von Guericke University Magdeburg

---

# Tools Used

* ANSYS Mechanical 2026 R1 Student
* Finite Element Method (FEM)
* Transient Structural Analysis
* Structural Dynamics
* Mesh Quality Analysis
* Equivalent Stress Analysis
* Deformation Analysis

---

# License

This project is licensed under the MIT License.

```
```

