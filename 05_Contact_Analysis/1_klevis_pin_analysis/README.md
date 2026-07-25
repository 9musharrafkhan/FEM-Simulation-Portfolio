# 05_1_Contact_Clevis_Pin_Analysis

# Contact Analysis of a Clevis Pin Assembly using ANSYS Mechanical

---

# Overview

This project presents the nonlinear contact analysis of a clevis pin assembly using **ANSYS Mechanical**.

The assembly consists of a clevis (U-shape), a connecting yoke, and a cylindrical pin.

Unlike conventional static structural analysis, contact analysis considers the interaction between multiple bodies, enabling accurate prediction of:

* Contact pressure
* Contact status
* Stress distribution
* Load transfer between components
* Relative motion between contacting surfaces

The objective of this project is to:

* Perform nonlinear contact analysis
* Investigate contact pressure distribution
* Study stress concentration around the pin
* Evaluate deformation of the assembly
* Verify proper load transfer between contacting parts
* Demonstrate practical contact modeling in ANSYS

---

# Geometry Description

The assembly consists of three components:

* Clevis (U-shaped bracket)
* Connecting Yoke
* Cylindrical Pin

The pin transfers load from the yoke to the clevis through contact interfaces.

---

# Material Properties

| Property               | Value            |
| ---------------------- | ---------------- |
| Material               | Structural Steel |
| Young's Modulus        | 210 GPa          |
| Poisson Ratio          | 0.30             |
| Tensile Yield Strength | 250 MPa          |

---

# Factor of Safety

| Parameter        | Value |
| ---------------- | ----- |
| Factor of Safety | 2     |

Allowable design stress:

```math
\sigma_{allowable}
=
\frac{\sigma_y}{FOS}
=
\frac{250}{2}
=
125 \ MPa
```

Since the maximum equivalent stress obtained is significantly below **125 MPa**, the assembly is considered **safe under the applied loading condition**.

---

# Contact Definitions

All interfaces are modeled using **No Separation Contact**.

## Contact Pair 1

Pin ↔ Clevis (U-Shape)

Contact Type:

* No Separation

---

## Contact Pair 2

Pin ↔ Yoke

Contact Type:

* No Separation

---

## Contact Pair 3

Clevis ↔ Yoke

Contact Type:

* No Separation

---

# Why No Separation Contact?

No Separation contact allows:

* Continuous contact between surfaces
* Sliding between components
* Load transfer through interfaces

while preventing bodies from separating during loading.

This contact formulation is commonly used for:

* Clevis joints
* Pin assemblies
* Mechanical hinges
* Revolute joints

---

# Boundary Conditions

## Fixed Support

One end of the assembly is completely fixed.

| Boundary | Condition     |
| -------- | ------------- |
| Left End | Fixed Support |

---

## External Load

Pressure is applied on the opposite end.

| Boundary         | Value |
| ---------------- | ----- |
| Applied Pressure | 1 MPa |

---

# Analysis Type

| Parameter          | Value             |
| ------------------ | ----------------- |
| Analysis           | Static Structural |
| Nonlinear Contacts | Yes               |
| Solver             | Direct Sparse     |

---

# Mesh Information

| Parameter        | Value                            |
| ---------------- | -------------------------------- |
| Mesh Type        | Tetrahedral                      |
| Element Type     | SOLID187 (Quadratic Tetrahedral) |
| Global Mesh Size | 5 mm                             |

A fine tetrahedral mesh was generated around the contact regions to accurately capture stress gradients and contact pressure.

---

# Mesh Quality

Mesh quality was evaluated using the **Element Metric**.

The majority of elements have a quality greater than **0.8**, indicating a well-conditioned mesh suitable for nonlinear contact analysis.

A good mesh quality improves:

* Stress prediction
* Contact pressure accuracy
* Nonlinear convergence
* Numerical stability

---

# Contact Tool Results

ANSYS Contact Tool was used to verify the contact behavior.

The following quantities were evaluated:

* Contact Status
* Contact Pressure
* Contact Regions

---

# Contact Status

The contact status indicates the interaction between contacting bodies.

Possible states include:

* Near
* Sliding
* Sticking
* Far
* Over Constrained

The obtained results confirm proper contact interaction with stable load transfer between all components.

---

# Contact Pressure

Maximum Contact Pressure:

```text
70.88 MPa
```

Minimum Contact Pressure:

```text
-33.74 MPa
```

The highest pressure occurs around the pin-hole interface where the external load is transferred through the joint.

---

# Equivalent (von Mises) Stress

| Quantity       | Value     |
| -------------- | --------- |
| Maximum Stress | 71.46 MPa |
| Minimum Stress | 0.002 MPa |

The maximum stress occurs around the pin-hole contact region due to localized stress concentration.

---

# Directional Deformation (X-Direction)

| Quantity | Value         |
| -------- | ------------- |
| Maximum  | 0.066689 mm   |
| Minimum  | -0.0047095 mm |

The largest deformation occurs at the loaded end, while the fixed support experiences negligible displacement.

---

# Safety Evaluation

Allowable stress:

```text
125 MPa
```

Maximum equivalent stress:

```text
71.46 MPa
```

Since

```text
71.46 MPa < 125 MPa
```

the design satisfies the required Factor of Safety.

---

# Engineering Observations

* Proper load transfer occurs through the pin.
* Highest stresses occur around the pin-hole interface.
* Contact pressure is concentrated near the loaded side.
* No Separation contact successfully prevents opening of interfaces.
* Deformation increases smoothly from the fixed end to the loaded end.
* Mesh quality is suitable for nonlinear contact analysis.

---

# Repository Structure

```text
05_Contact_Clevis_Pin_Analysis/
│
├── README.md
│
├── ansys/
│   ├── project_files/
│   │   └── clevis_pin_contact.wbpj
│   │
│   ├── contacts/
│   │   ├── pin_to_Ushape.png
│   │   ├── pin_to_york.png
│   │   └── Ushape_to_york.png
│   │
│   ├── mesh/
│   │   ├── mesh_quality.png
│   │   └── mesh_size.png
│   │
│   ├── boundary_conditions/
│   │   └── Boundary_conditions.png
│   │
│   ├── contact_tool/
│   │   ├── contact_pressure.png
│   │   └── contact_status.png
│   │
│   ├── results/
│   │   ├── equivalent_stress.png
│   │   └── x_directional_deformation.png
│   │
│   └── README_ANSYS.md
│
└── geometry/
    ├── geometry.png
    └── klevis_pin.stp
```

---

# ANSYS Workflow

1. Import Geometry
2. Assign Structural Steel Material
3. Define Contact Pairs
4. Specify Contact Formulation (No Separation)
5. Generate 5 mm Tetrahedral Mesh
6. Apply Fixed Support
7. Apply Pressure Load (1 MPa)
8. Solve Static Structural Analysis
9. Review Contact Tool Results
10. Evaluate Stress and Deformation
11. Verify Design Safety

---

# Key Learnings

This project demonstrates:

* Contact mechanics fundamentals
* Nonlinear finite element analysis
* Contact pressure evaluation
* Stress concentration analysis
* Pin-joint behavior
* Contact status interpretation
* Engineering safety assessment
* Practical ANSYS contact modeling

---

# Author

**Musharraf Khan**

M.Sc. Computational Methods in Engineering
Otto von Guericke University Magdeburg

---

# Tools Used

* ANSYS Mechanical
* Static Structural Analysis
* Contact Tool
* Nonlinear Finite Element Analysis

---

# License

This project is licensed under the MIT License.

