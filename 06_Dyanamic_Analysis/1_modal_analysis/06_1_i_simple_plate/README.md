````markdown
# 06_1_i_Simple_Plate_Modal_Analysis

# Modal Analysis of a Simple Plate using ANSYS Mechanical

---

# Overview

This project demonstrates the **modal analysis of a simple plate with circular holes using ANSYS Mechanical**.

The objective of modal analysis is to determine the inherent dynamic characteristics of the structure, particularly its **natural frequencies and corresponding mode shapes**.

The analysis considers a thin structural steel plate that is fixed along its left side. The geometry contains one large circular hole and two smaller circular holes. The finite element model is created and solved using **ANSYS Mechanical 2026 R1 Student**.

The project also includes the mesh, boundary conditions, modal results, and frequency-response results obtained from ANSYS.

---

# Objectives

The main objectives of this project are:

- Determine the natural frequencies of the plate.
- Obtain the corresponding mode shapes.
- Understand the dynamic characteristics of the structure.
- Identify frequencies at which resonance may occur.
- Investigate the influence of geometry and boundary conditions on vibration behavior.
- Use the modal results as the basis for subsequent dynamic analysis.
- Perform a frequency-response/harmonic analysis using the modal solution.

---

# Problem Statement

A rectangular structural steel plate containing circular holes is fixed along its left side.

The dimensions of the plate are:

- Length = **40 cm**
- Height = **20 cm**
- Thickness = **3 mm**
- Large circular hole radius = **5 cm**
- Position of large circular hole = **10 cm from the vertical centerline**
- Small circular holes are positioned symmetrically about the horizontal centerline.

All dimensions in the original problem statement are given in centimeters, while the ANSYS model is displayed in millimeters.

The objective of the modal analysis is to determine the natural frequencies and corresponding mode shapes of the plate.

---

# Material Properties

The plate is modeled using **Structural Steel**.

| Property | Value |
|----------|-------|
| Young's Modulus, \(E\) | 200 GPa |
| Poisson's Ratio, \(\nu\) | 0.30 |
| Density, \(\rho\) | 7850 kg/m³ |
| Thickness | 3 mm |

---

# Geometry

The modeled plate consists of:

- Rectangular plate
- One large circular cut-out
- Two smaller circular cut-outs
- Fixed support along the complete left edge

The overall plate dimensions are:

```text
Length = 400 mm
Height = 200 mm
Thickness = 3 mm
````

The large circular hole has:

```text
Radius = 50 mm
```

---

# Boundary Conditions

The plate is **fixed at the left side**.

The fixed support constrains the structural degrees of freedom at the left edge.

For the modal analysis:

```text
Left edge → Fixed Support
External excitation → None
```

The fixed support is important because the natural frequencies depend strongly on the structural constraints.

---

# Finite Element Mesh

A structured/swept-style quadrilateral-dominant mesh is generated over the plate.

The mesh is refined around the circular holes to better capture the local geometry.

The mesh contains local refinement around:

* Large circular hole
* Upper small circular hole
* Lower small circular hole

The attached mesh image shows the final finite element discretization used for the analysis.

---

# Mesh Quality

The mesh quality was evaluated using the element metric available in ANSYS.

The mesh contains predominantly regular quadrilateral elements, with local distortion around the circular cut-outs.

The mesh refinement around the holes is important because the geometry introduces curvature and local stiffness variations.

---

# Governing Equation

The general equation of motion for a structural dynamic system is

```math
M\ddot{x}+C\dot{x}+Kx=F(t)
```

where:

* (M) = Mass matrix
* (C) = Damping matrix
* (K) = Stiffness matrix
* (x) = Displacement vector
* (\dot{x}) = Velocity vector
* (\ddot{x}) = Acceleration vector
* (F(t)) = External force vector

For modal analysis, there is no externally applied dynamic force.

Therefore,

```math
M\ddot{x}+Kx=0
```

---

# Modal Analysis

## Purpose

Modal analysis is used to determine:

* Natural frequencies
* Mode shapes
* Dynamic characteristics of the structure

Natural frequency is the frequency at which the structure tends to vibrate naturally after being disturbed.

The corresponding deformation pattern is called the **mode shape**.

---

# Modal Equation

For free, undamped vibration:

```math
M\ddot{x}+Kx=0
```

Assume harmonic motion in the form

```math
x=\phi e^{i\omega t}
```

where:

* (\phi) = Mode shape vector
* (\omega) = Natural angular frequency

Substitution into the equation of motion gives

```math
(K-\omega^2M)\phi=0
```

For a non-zero mode shape,

```math
\det(K-\omega^2M)=0
```

This is the eigenvalue problem solved during modal analysis.

The eigenvalues provide the natural frequencies, while the eigenvectors provide the corresponding mode shapes.

---

# Natural Frequency

The relationship between angular frequency and frequency is

```math
\omega_n=2\pi f_n
```

Therefore,

```math
f_n=\frac{\omega_n}{2\pi}
```

where:

* (f_n) = Natural frequency in Hz
* (\omega_n) = Natural angular frequency in rad/s

---

# Mode Shapes

A mode shape represents the deformation pattern of the structure when it vibrates at a particular natural frequency.

For the plate:

```text
Mode 1 → First natural frequency + first mode shape
Mode 2 → Second natural frequency + second mode shape
Mode 3 → Third natural frequency + third mode shape
Mode 4 → Fourth natural frequency + fourth mode shape
Mode 5 → Fifth natural frequency + fifth mode shape
```

The problem statement specifically requests the **five natural frequencies and their corresponding mode shapes**.

The ANSYS solution tree also contains multiple deformation results for the calculated modes.

---

# Modal Analysis Setup in ANSYS

The ANSYS modal analysis consists of:

```text
Geometry
   ↓
Material Assignment
   ↓
Mesh Generation
   ↓
Fixed Support
   ↓
Modal Analysis
   ↓
Solution
   ↓
Natural Frequencies
   ↓
Mode Shapes
```

No external force is required for the modal analysis.

---

# Modal Analysis Results

The ANSYS solution provides the natural frequencies of the plate.

The frequency plot included with the project shows the calculated modal frequencies for the extracted modes.

The project results include:

* Natural frequency results
* Mode shape results
* Total deformation plots for individual modes
* Frequency plot

The extracted modal results should be reported directly from the ANSYS solution file to avoid rounding or transcription errors.

---

# Frequency Results

The ANSYS modal result contains frequency values for the calculated modes.

The result plot shows six extracted modal frequencies, while the original problem statement asks for the first five natural frequencies.

The modal frequency plot is included in the project files for reference.

| Mode | Natural Frequency |
| ---- | ----------------- |
| 1    | 26.6 Hz           |
| 2    | 110 Hz            |
| 3    | 152 Hz            |
| 4    | 330 Hz            |
| 5    | 426 Hz            |
| 6    | 628 Hz            |


---

# Interpretation of Modal Results

The natural frequencies represent the frequencies at which the plate can vibrate naturally.

The mode shapes show how different regions of the plate participate in each vibration mode.

As the mode number increases:

* The deformation pattern becomes more complex.
* The number of nodal regions generally increases.
* The natural frequency increases.
* The structure can respond to higher-frequency excitation.

The fixed left edge remains constrained in every mode.

---

# Resonance

Resonance occurs when the excitation frequency approaches one of the natural frequencies of the structure.

The resonance condition can be represented as

```math
f_{exc}\approx f_n
```

or

```math
\omega_{exc}\approx\omega_n
```

At resonance, the vibration amplitude can increase significantly.

Therefore, modal analysis is an important preliminary analysis before performing a forced-vibration analysis.

---

# Harmonic Response Extension

The modal solution can be used as the basis for a **Harmonic Response Analysis**.

The harmonic analysis included with the project investigates the response of the plate over a frequency range.

The ANSYS model uses:

```text
Solution Method = Mode Superposition
Minimum Frequency = 0 Hz
Maximum Frequency = 700 Hz
Solution Intervals = 50
```

A harmonic force is applied to the plate.

---

# Harmonic Load

The harmonic excitation can be represented as

```math
F(t)=F_0\sin(\omega t)
```

where:

* (F_0) = Force amplitude
* (\omega) = Excitation angular frequency
* (t) = Time

---

# Harmonic Response Equation

The governing equation is

```math
M\ddot{x}+C\dot{x}+Kx=F_0\sin(\omega t)
```

For a steady-state harmonic response, the displacement can be represented in complex form.

```math
X(\omega)=
\left[
K-\omega^2M+i\omega C
\right]^{-1}F_0
```

The magnitude of (X(\omega)) represents the vibration amplitude, while its argument represents the phase response.

---

# Frequency Response

The ANSYS frequency-response result contains:

* Amplitude vs Frequency
* Phase Angle vs Frequency

The frequency-response curve covers approximately:

```text
14 Hz – 700 Hz
```

The response curve contains peaks at specific frequencies, indicating frequencies where the structure exhibits a relatively higher dynamic response.

These peaks should be compared with the natural frequencies obtained from modal analysis.

---

# Relationship Between Modal and Harmonic Analysis

Modal analysis answers:

```text
"What are the natural frequencies and mode shapes of the structure?"
```

Harmonic response analysis answers:

```text
"How does the structure respond when it is excited over a range of frequencies?"
```

Therefore:

```text
Modal Analysis
       ↓
Natural Frequencies + Mode Shapes
       ↓
Harmonic Response Analysis
       ↓
Amplitude + Phase vs Frequency
```

The modal results provide important information for interpreting the peaks in the frequency-response curve.

---

# Results Included

The project contains the following ANSYS results:

### 1. Geometry

The final plate geometry with:

* One large circular hole
* Two small circular holes
* Fixed left edge

### 2. Mesh

The final finite element mesh including local refinement around the circular holes.

### 3. Boundary Conditions

The fixed support applied to the left side of the plate.

### 4. Modal Results

The modal solution includes:

* Natural frequencies
* Mode shapes
* Total deformation for individual modes

### 5. Harmonic Response

The harmonic solution includes:

* Frequency response
* Amplitude vs frequency
* Phase angle vs frequency

---

# Attached Files

The following files/images are included with this project:

```text
06_1_i_simple_plate/
│
├── README.md
│
├── geometry/
│   └── simple_plate_geometry.png
│
├── mesh/
│   └── simple_plate_mesh.png
│
├── boundary_conditions/
│   └── fixed_support.png
│
├── modal_results/
│   ├── natural_frequencies.png
│   ├── mode_1.png
│   ├── mode_2.png
│   ├── mode_3.png
│   ├── mode_4.png
│   └── mode_5.png
│
├── harmonic_results/
│   ├── harmonic_setup.png
│   ├── frequency_response.png
│   └── phase_response.png
│
└── ansys/
    └── simple_plate_modal_analysis.wbpj
```

---

# ANSYS Model

The ANSYS model contains the following analysis systems:

```text
Engineering Data
      ↓
Geometry
      ↓
Model
      ↓
Modal Analysis
      ↓
Solution
      ↓
Natural Frequencies
      ↓
Mode Shapes
      ↓
Harmonic Response
      ↓
Frequency Response
```

---

# Important Observations

The following observations can be made from the analysis:

* The left-side fixed support significantly influences the natural frequencies.
* The circular holes modify the mass and stiffness distribution of the plate.
* The mode shapes become progressively more complex with increasing mode number.
* Higher modes occur at higher frequencies.
* The harmonic response contains frequency-dependent peaks.
* Modal frequencies are useful for identifying possible resonance regions.
* Mesh refinement around the circular holes improves representation of the curved geometry.

---

# Modal vs Harmonic Analysis

| Parameter                | Modal Analysis                      | Harmonic Response            |
| ------------------------ | ----------------------------------- | ---------------------------- |
| External Force           | Not required                        | Required                     |
| Main Purpose             | Natural frequencies and mode shapes | Forced steady-state response |
| Frequency                | Natural frequency                   | Excitation frequency         |
| Time Dependent           | No                                  | No                           |
| Main Output              | Frequency and mode shape            | Amplitude and phase          |
| Resonance Identification | Indirect                            | Directly from response peaks |
| Analysis Type            | Eigenvalue problem                  | Frequency-domain analysis    |

---

# Typical ANSYS Workflow

1. Create the plate geometry.
2. Define the material properties.
3. Generate the finite element mesh.
4. Refine the mesh around the circular holes.
5. Apply fixed support to the left edge.
6. Insert Modal Analysis.
7. Extract the required natural frequencies.
8. Obtain the corresponding mode shapes.
9. Use the modal solution for harmonic response analysis.
10. Define the harmonic excitation.
11. Perform the frequency sweep.
12. Plot amplitude and phase response.
13. Compare frequency-response peaks with modal frequencies.

---

# Engineering Significance

The analysis demonstrates how the dynamic characteristics of a component can be evaluated before physical testing.

Knowing the natural frequencies allows the designer to:

* Avoid operating near resonance.
* Modify structural stiffness.
* Modify mass distribution.
* Add structural stiffeners.
* Change material selection.
* Change geometry.
* Improve vibration resistance.
* Reduce the possibility of fatigue failure.

---

# Key Learnings

This project demonstrates:

* Fundamentals of structural vibration.
* Free and forced vibration.
* Natural frequency.
* Mode shapes.
* Eigenvalue formulation.
* Modal analysis using FEM.
* Fixed boundary conditions in dynamic analysis.
* Mesh refinement around geometric discontinuities.
* Harmonic response analysis.
* Frequency-response interpretation.
* Relationship between modal frequencies and resonance.

---

# Future Extensions

The project can be extended by performing:

* Mesh convergence study for natural frequencies.
* Comparison with analytical plate solutions.
* Experimental modal testing.
* Different boundary conditions.
* Different plate thicknesses.
* Different materials.
* Random vibration analysis.
* Transient structural analysis.
* Fatigue analysis under cyclic excitation.
* Optimization of hole geometry.
* Comparison of steel, aluminium, CFRP, and GFRP plates.

---

# Tools Used

* **ANSYS Mechanical 2026 R1 Student**
* Finite Element Method (FEM)
* Structural Dynamics
* Modal Analysis
* Harmonic Response Analysis

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

