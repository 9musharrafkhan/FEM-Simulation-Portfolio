# 05_2_Contact_Analysis_Knuckle_Joint

# Contact Analysis of a Knuckle Joint Assembly using ANSYS Mechanical

---

# Overview

This project presents the nonlinear finite element contact analysis of a knuckle joint assembly using **ANSYS Mechanical**.

A knuckle joint is a mechanical joint used to connect two rods subjected to tensile loading while allowing limited angular movement between them.

Unlike a bonded structural analysis, contact analysis accurately captures:

- Contact pressure
- Load transfer through the pin
- Frictional interaction
- Stress concentration
- Pin-bearing behavior
- Joint deformation

The objective of this project is to:

- Perform nonlinear contact analysis of a knuckle joint
- Study contact pressure distribution
- Evaluate von-Mises and shear stresses
- Verify the design using allowable stresses
- Investigate deformation of the assembly
- Demonstrate practical engineering contact analysis using ANSYS

---

# Applications of Knuckle Joints

Knuckle joints are commonly used in:

- Tie rods
- Suspension linkages
- Crane hooks
- Chain links
- Valve mechanisms
- Structural connections
- Mechanical linkages

---

# Geometry Description

The assembly consists of:

- Single Eye
- Double Eye (Fork)
- Knuckle Pin

The load is transferred through the pin by bearing action between the mating components.

---

# Material Properties

| Property | Value |
|----------|-------|
| Material | Structural Steel |
| Young's Modulus | 210 GPa |
| Poisson's Ratio | 0.30 |

---

# Design Allowable Stresses

| Property | Value |
|----------|-------|
| Allowable Tensile Stress | **75 MPa** |
| Allowable Shear Stress | **60 MPa** |
| Allowable Crushing Stress | **150 MPa** |

---

# Contact Definition

A **Frictional Contact** is defined between:

- Single Eye ↔ Double Eye

The pin transfers load through contact with the eye surfaces.

---

## Contact Type

| Contact Pair | Contact Type |
|--------------|--------------|
| Single Eye ↔ Double Eye | Frictional |

The frictional contact allows:

- Load transfer
- Sliding with friction resistance
- Realistic contact pressure
- Contact opening and closing depending on load

---

# Boundary Conditions

## Fixed Support

One end of the knuckle joint is completely fixed.

| Boundary | Condition |
|----------|-----------|
| Right End | Fixed Support |

---

## External Load

A tensile force is applied at the opposite end.

| Boundary | Value |
|----------|-------|
| Applied Force | **10000 N** |

---

# Analysis Type

| Parameter | Value |
|----------|-------|
| Analysis | Static Structural |
| Contact | Nonlinear Frictional |
| Solver | Direct Sparse |

---

# Mesh Information

| Parameter | Value |
|----------|-------|
| Element Type | SOLID187 |
| Mesh Type | Tetrahedral |
| Global Mesh Size | **5 mm** |

The mesh was refined around:

- Pin
- Contact regions
- Eye holes

to accurately capture contact pressure and stress concentration.

---

# Mesh Quality

Element quality was evaluated using the **Element Metric**.

Observations:

- Majority of elements have quality between **0.80–0.95**
- Very few poor-quality elements exist
- Suitable for nonlinear contact simulation

A high-quality mesh improves:

- Convergence
- Contact accuracy
- Stress prediction
- Numerical stability

---

# Contact Tool Results

ANSYS Contact Tool was used to verify the contact interaction.

The following quantities were evaluated:

- Contact Status
- Contact Pressure
- Contact Regions

---

# Contact Status

The contact status plot indicates:

- Sticking
- Sliding
- Near Contact
- Far Contact
- Over-Constrained Regions

The results confirm successful load transfer through the pin with proper frictional interaction.

---

# Contact Pressure

| Quantity | Value |
|----------|-------|
| Maximum Contact Pressure | **6.54 MPa** |
| Minimum Contact Pressure | **0 MPa** |

Maximum pressure occurs around the pin-hole interface where bearing stresses are developed.

---

# Equivalent (von-Mises) Stress

| Quantity | Value |
|----------|-------|
| Maximum | **30.10 MPa** |
| Minimum | **0.0008 MPa** |

The highest stress occurs around the pin-hole contact region.

---

# Maximum Shear Stress

| Quantity | Value |
|----------|-------|
| Maximum | **16.02 MPa** |
| Minimum | **0.00044 MPa** |

Maximum shear stress develops near the contact interface between the pin and eye.

---

# Total Deformation

| Quantity | Value |
|----------|-------|
| Maximum | **0.01626 mm** |
| Minimum | **0 mm** |

The maximum deformation occurs at the loaded end of the joint.

---

# Design Validation

## Tensile Stress Check

Allowable Tensile Stress

```text
75 MPa
```

Obtained Maximum Stress

```text
30.10 MPa
```

Since

```text
30.10 < 75 MPa
```

✅ **Safe in Tension**

---

## Shear Stress Check

Allowable Shear Stress

```text
60 MPa
```

Obtained Maximum Shear Stress

```text
16.02 MPa
```

Since

```text
16.02 < 60 MPa
```

✅ **Safe in Shear**

---

## Crushing Stress Check

Maximum Contact Pressure

```text
6.54 MPa
```

Allowable Crushing Stress

```text
150 MPa
```

Since

```text
6.54 < 150 MPa
```

✅ **Safe in Bearing (Crushing)**

---

# Engineering Observations

- Load is transferred smoothly through the knuckle pin.
- Maximum von-Mises stress occurs around the pin-hole contact.
- Contact pressure is concentrated on the bearing surfaces.
- Frictional contact accurately represents the real joint behavior.
- Total deformation is very small.
- The joint satisfies all allowable stress criteria.
- The mesh quality is suitable for nonlinear contact analysis.

---

# Repository Structure

```text
05_2_Contact_Analysis_Knuckle_Joint/
│
├── README.md
│
├── ansys/
│   │
│   ├── project_files/
│   │   └── knuckle_joint.wbpj
│   │
│   ├── contacts/
│   │   └── frictional_contact.png
│   │
│   ├── mesh/
│   │   ├── mesh_quality.png
│   │   └── mesh_size.png
│   │
│   ├── boundary_conditions/
│   │   └── boundary_conditions
│   │
│   ├── contact_tool/
│   │   ├── contact_status.png
│   │   └── contact_pressure.png
│   │
│   ├── results/
│   │   ├── total_deformation.png
│   │   ├── equivalent_stress.png
│   │   └── maximum_shear_stress.png
│   │
│   └── README_ANSYS.md
│
└── geometry/
    ├── KNUCKLE_JOINT_ASSEMBLY.STEP
    └── mesh_quality.png
```

---

# ANSYS Workflow

1. Import knuckle joint geometry
2. Assign Structural Steel material
3. Define frictional contact pair
4. Generate tetrahedral mesh (5 mm)
5. Apply fixed support
6. Apply tensile force (10000 N)
7. Solve nonlinear static structural analysis
8. Evaluate contact status
9. Evaluate contact pressure
10. Evaluate equivalent stress
11. Evaluate maximum shear stress
12. Evaluate total deformation
13. Validate against allowable stresses

---

# Key Learnings

This project demonstrates:

- Frictional contact mechanics
- Nonlinear finite element analysis
- Contact pressure evaluation
- Bearing stress analysis
- Pin-joint structural behavior
- Stress concentration
- Engineering design verification
- Practical ANSYS Mechanical workflow

---

# Author

**Musharraf Khan**

M.Sc. Computational Methods in Engineering  
Otto von Guericke University Magdeburg

---

# Tools Used

- ANSYS Mechanical 2026 R1
- Static Structural
- Nonlinear Contact Analysis
- Finite Element Method

---

# License

This project is licensed under the MIT License.
````

This README follows the same professional style and structure as your previous FEM portfolio projects, making it consistent across your GitHub repository.

