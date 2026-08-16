# 06_2_i_Bracket

# Harmonic Analysis of a Bracket using ANSYS Mechanical

---

# Overview

This project investigates the **dynamic response of a structural bracket** using **ANSYS Mechanical**. The bracket is fixed at the mounting holes and subjected to a harmonic pressure load on its upper surface.

The analysis combines **Modal Analysis** and **Harmonic Response Analysis** to determine the natural frequencies, corresponding mode shapes, and displacement response of the bracket over a selected frequency range.

The project demonstrates how the natural frequencies obtained from modal analysis can be used to identify resonance regions in harmonic response analysis.

---

# Problem Statement

A structural bracket with a depth of **120 mm** is fixed at its mounting holes.

The objective is to determine:

- Natural frequencies of the bracket.
- Corresponding normal mode shapes.
- Frequency response of displacement under harmonic pressure loading.

The bracket geometry is based on the dimensions given in the problem statement.

---

# Geometry

The main geometric dimensions are:

| Parameter | Value |
|-----------|-------|
| Overall height | 100 mm |
| Central width | 120 mm |
| Side length | 80 mm |
| Outer bend radius | R30 mm |
| Bracket depth | 120 mm |
| Wall thickness | 15 mm |
| Hole diameter | 15 mm |
| Hole offset | 12.5 mm |
| Inner height | 85 mm |

The bracket is fixed at the mounting holes.

---

# Material Properties

The bracket is modeled using **Structural Steel**.

| Property | Value |
|----------|-------|
| Young's Modulus | 200 GPa |
| Poisson's Ratio | 0.3 |
| Density | 7850 kg/m³ |

These material properties are used for both modal and harmonic analyses.

---

# Loading

A pressure load is applied to the upper surface of the bracket.

The problem statement specifies:

```math
p = 1000\;N/cm^2
````

This is equivalent to:

```math
p = 10\;MPa
```

The same pressure magnitude is used as the harmonic excitation in the ANSYS model.

---

# Boundary Conditions

The bracket is fixed at the mounting holes.

The fixed support constrains the bracket at the locations where it would be attached to a larger structural assembly.

The boundary condition is important because the natural frequencies and mode shapes depend strongly on the support conditions.

---

# Mesh

The bracket is discretized using **3D tetrahedral elements**.

The mesh is refined sufficiently to represent:

* Curved regions.
* Bending transitions.
* Mounting holes.
* The upper loading surface.
* The thin bracket sections.

The generated mesh contains a large number of **Tet10** elements.

---

# Mesh Quality

The mesh quality was evaluated using the element quality metric available in ANSYS Mechanical.

The mesh quality distribution indicates that the majority of the generated elements have acceptable quality for the structural dynamic analysis.

---

# Mesh

The mesh is locally refined around geometrical features such as holes and curved transitions where higher deformation gradients can occur.

---

# Analysis Methodology

The analysis consists of two main stages:

```text
Geometry
   ↓
Material Definition
   ↓
Mesh Generation
   ↓
Fixed Support
   ↓
Modal Analysis
   ↓
Natural Frequencies
   ↓
Mode Shapes
   ↓
Harmonic Response Analysis
   ↓
Frequency Response
   ↓
Displacement vs Frequency
```

The modal analysis provides the natural frequencies required to understand the dynamic behavior of the bracket.

The harmonic response analysis then evaluates the steady-state displacement response over the selected frequency range.

---

# 1. Modal Analysis

## Purpose

Modal analysis is performed to determine the natural frequencies and corresponding vibration mode shapes of the bracket.

The analysis is performed without applying the external pressure load.

The fixed support is retained from the structural model.

---

## Governing Equation

The free vibration of an undamped finite element system is described by:

```math
M\ddot{x}+Kx=0
```

Assuming harmonic motion:

```math
x=\phi e^{i\omega t}
```

the governing eigenvalue equation becomes:

```math
(K-\omega^2M)\phi=0
```

where:

* (M) = Mass matrix
* (K) = Stiffness matrix
* (\omega) = Natural angular frequency
* (\phi) = Mode shape

The natural frequency is related to angular frequency by:

```math
\omega=2\pi f
```

---

# Natural Frequencies

The ANSYS modal analysis produced the following approximate natural frequencies visible in the modal results:

| Mode   | Natural Frequency |
| ------ | ----------------- |
| Mode 1 | ≈ 620 Hz          |
| Mode 2 | ≈ 1400 Hz         |
| Mode 3 | ≈ 1650 Hz         |
| Mode 4 | ≈ 1750 Hz         |
| Mode 5 | ≈ 2100 Hz         |
| Mode 6 | ≈ 2420 Hz         |

The first five modes are the primary modes considered for the project objectives.

> **Note:** The values above are read from the ANSYS modal-frequency plot and should be replaced by the exact solver values if the numerical frequency table from ANSYS is available.

---

# Modal Frequency Results

The modal results show that the bracket has several closely spaced modes in the higher-frequency region.

In particular, the third and fourth modes occur in the region of approximately **1650–1750 Hz**. This region is therefore important for the harmonic response analysis.

---

# Mode Shapes

The corresponding eigenvectors represent the normal mode shapes of the bracket.

Mode shapes describe the relative deformation pattern of the structure during free vibration.

They are useful for identifying:

* Bending modes.
* Torsional modes.
* Local deformation.
* Regions of high dynamic displacement.
* Possible resonance-sensitive regions.

---

# 2. Harmonic Response Analysis

## Purpose

Harmonic response analysis determines the steady-state response of the bracket when subjected to a sinusoidal excitation.

The pressure is applied to the upper surface of the bracket.

The response is evaluated as a function of excitation frequency.

---

# Harmonic Loading

The harmonic pressure can be represented as:

```math
p(t)=p_0\sin(\omega t)
```

where:

* (p_0) = Pressure amplitude
* (\omega) = Excitation angular frequency
* (t) = Time

For this project:

```math
p_0=10\;MPa
```

---

# Governing Equation

The general equation of motion for a linear dynamic system is:

```math
M\ddot{x}+C\dot{x}+Kx=F(t)
```

For harmonic excitation:

```math
F(t)=F_0\sin(\omega t)
```

Therefore:

```math
M\ddot{x}+C\dot{x}+Kx=F_0\sin(\omega t)
```

where:

* (M) = Mass matrix
* (C) = Damping matrix
* (K) = Stiffness matrix
* (x) = Displacement vector
* (F_0) = Harmonic force vector

---

# Harmonic Analysis Settings

The frequency response analysis was performed in the frequency range:

```text
1700 Hz – 1800 Hz
```

This frequency range was selected because it covers the region around the higher modal frequencies identified in the modal analysis, particularly the modes around approximately **1650–1750 Hz**.

The harmonic analysis uses **Mode Superposition** to calculate the dynamic response efficiently.

---

# Harmonic Pressure Boundary Condition

The harmonic pressure is applied to the upper horizontal surface of the bracket.

The applied pressure is:

```text
Pressure = 10 MPa
```

The fixed mounting locations remain constrained during the harmonic analysis.

---

# Static Pressure Reference

A static structural analysis was also used to verify the pressure application and obtain the corresponding static deformation.

The static pressure load is applied to the same upper surface used for the dynamic excitation.

---

# Static Deformation Reference

The static structural solution produced a maximum total deformation of approximately:

```text
Maximum deformation ≈ 0.24288 mm
```

The static result provides a useful reference for the structural response under the applied pressure before considering dynamic amplification.

---

# Frequency Response

The harmonic response was evaluated in the **Y direction**, which corresponds to the principal displacement direction investigated in this project.

The frequency response plot shows the displacement amplitude as a function of excitation frequency.

---

# Frequency Response Results

The calculated displacement response shows a strong peak around approximately:

```text
f ≈ 1720 Hz
```

with a displacement amplitude of approximately:

```text
Y-displacement amplitude ≈ 212 mm
```

This large response indicates a strong dynamic amplification in the investigated frequency range.

The response decreases as the excitation frequency moves away from the resonance region.

---

# Resonance Behavior

The modal analysis identifies natural frequencies close to the harmonic excitation range.

The harmonic response shows a pronounced peak near **1720 Hz**, indicating that the excitation frequency is close to a natural frequency of the bracket.

In general, resonance occurs when:

```math
f\approx f_n
```

At resonance, the dynamic response can become significantly larger than the corresponding static response.

---

# Phase Response

The harmonic analysis also provides the phase angle of the displacement response.

The phase changes significantly around the resonance region.

This phase variation is characteristic of the dynamic response of a structure passing through a resonance condition.

---

# Modal and Harmonic Results Correlation

The relationship between modal and harmonic analyses can be summarized as follows:

| Analysis               | Result                                 |
| ---------------------- | -------------------------------------- |
| Modal Analysis         | Natural frequencies and mode shapes    |
| Harmonic Analysis      | Displacement response versus frequency |
| Important modal region | ≈ 1650–1750 Hz                         |
| Harmonic sweep         | 1700–1800 Hz                           |
| Major response peak    | ≈ 1720 Hz                              |
| Response direction     | Y direction                            |

The modal analysis therefore provides the basis for selecting the frequency range for the harmonic analysis.

---

# Results Summary

| Quantity                   | Result           |
| -------------------------- | ---------------- |
| Material                   | Structural Steel |
| Young's Modulus            | 200 GPa          |
| Poisson's Ratio            | 0.3              |
| Density                    | 7850 kg/m³       |
| Applied Pressure           | 10 MPa           |
| Bracket Depth              | 120 mm           |
| Harmonic Frequency Range   | 1700–1800 Hz     |
| Response Direction         | Y                |
| Major Response Peak        | ≈ 1720 Hz        |
| Peak Y Displacement        | ≈ 212 mm         |
| Static Maximum Deformation | ≈ 0.24288 mm     |

---

# Important Observation

The harmonic displacement amplitude is much larger than the static deformation.

The static analysis gives approximately:

```text
0.24288 mm
```

while the harmonic response plot reaches approximately:

```text
212 mm
```

This difference represents very strong dynamic amplification near the resonance region.

However, such a very large harmonic displacement should be interpreted carefully. It can be strongly influenced by the **damping assumptions, frequency resolution, mode-superposition settings, and proximity of the excitation frequency to a natural frequency**.

For a physically realistic engineering prediction, damping should be appropriately defined and the resonance region should be investigated using a sufficiently fine frequency resolution.

---

# Why Harmonic Analysis is Important

Harmonic response analysis helps engineers to:

* Identify resonance conditions.
* Determine vibration amplitudes.
* Predict frequency-dependent deformation.
* Evaluate dynamic amplification.
* Identify critical operating frequencies.
* Improve structural reliability.
* Optimize structural design.

---

# Typical ANSYS Workflow

1. Create/import bracket geometry.
2. Define Structural Steel material.
3. Generate 3D tetrahedral mesh.
4. Apply fixed support at mounting holes.
5. Perform modal analysis.
6. Extract natural frequencies.
7. Identify important frequency ranges.
8. Create harmonic response analysis.
9. Apply harmonic pressure to the upper surface.
10. Define frequency range.
11. Solve using mode superposition.
12. Obtain Y-direction displacement response.
13. Plot amplitude versus frequency.
14. Identify resonance peaks.
15. Compare dynamic and static deformation.

---

# Repository Structure

```text
06_2_i_Bracket/
│
├── README.md
│
├── ansys/
│   ├── results/
│   ├── priject_files/
│   │   ├── bracket_files
│   │   └── bracket_files/
│   │
│   ├── mesh/
│   │
│   └── boundary_conditions/
│
└── geometry/
    └── geometry.png
```

---

# Tools Used

* ANSYS Mechanical 2026 R1
* Finite Element Method (FEM)
* Modal Analysis
* Harmonic Response Analysis
* Static Structural Analysis
* Mode Superposition
* Structural Dynamics

---

# Author

**Musharraf Khan**

M.Sc. Computational Methods in Engineering
Otto von Guericke University Magdeburg

---

# License

This project is licensed under the MIT License.

```
```

