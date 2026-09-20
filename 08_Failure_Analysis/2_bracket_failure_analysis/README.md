# 08_2 — Static and Fatigue Analysis of Bracket Section

## Overview

This project presents a combined **Static Structural Analysis** and **Fatigue Analysis** of a formed bracket section using **ANSYS Mechanical 2026 R1 Student**.

The bracket is analyzed under a prescribed **10 MPa pressure load** for both:

1. Static structural loading
2. Fully reversed cyclic fatigue loading

The analysis evaluates:

- Structural response of the bracket
- Equivalent von-Mises stress
- Total deformation
- Static factor of safety
- Fatigue life
- Fatigue factor of safety
- Loading-history sensitivity
- Mean-stress correction using the fatigue tool

---

# 1. Project Objectives

The main objectives of this project are:

1. Create the bracket geometry according to the supplied drawing.
2. Define structural steel material properties.
3. Apply a fixed support boundary condition.
4. Apply a 10 MPa pressure load.
5. Determine the equivalent von-Mises stress.
6. Determine total deformation.
7. Evaluate the static factor of safety.
8. Define the fatigue loading condition.
9. Perform fully reversed cyclic fatigue analysis.
10. Evaluate fatigue life.
11. Determine the fatigue factor of safety.
12. Investigate the effect of loading history on fatigue life.
13. Identify critical regions of the bracket.

---

# 2. Problem Definition

The component is a formed **bracket section** subjected to a cyclic load on its upper horizontal region.

The supplied problem statement defines:

- Material: Structural Steel
- Depth: 150 mm
- Young's Modulus: 200 GPa
- Poisson's Ratio: 0.3
- Static pressure: 10 MPa
- Fatigue pressure: 10 MPa
- Fatigue loading: Fully Reversed

---

# 3. Geometry

The bracket geometry is defined using the dimensions shown in the supplied drawing.

### Main dimensions

| Parameter | Value |
|---|---:|
| Overall width | 240 mm |
| Left base length | 80 mm |
| Central section width | 120 mm |
| Right base length | 80 mm |
| Overall height | 85 mm |
| Outer/transition radius | R30 mm |
| Thickness | 15 mm |
| Hole diameter | Ø16 mm |
| Model depth | 150 mm |

The geometry consists of:

- Two mounting/base flanges
- Curved vertical transitions
- Upper horizontal loading region
- Mounting holes
- Formed curved profile

The curved transitions are important because they can produce local stress concentrations.

---

# 4. Material Properties

The bracket is modeled using **Structural Steel**.

The supplied problem statement specifies:

| Material Property | Value |
|---|---:|
| Young's Modulus, $E$ | 200 GPa |
| Poisson's Ratio, $\nu$ | 0.30 |

The fatigue analysis uses the S-N fatigue definition available in the ANSYS fatigue setup.

---

# 5. Loading Conditions

Two analysis cases are considered.

## Case 1 — Static Loading

A pressure of:

$$
P = 10\ \text{MPa}
$$

is applied to the upper surface of the bracket.

---

## Case 2 — Fatigue Loading

The same nominal pressure magnitude is used for fatigue analysis:

$$
P = 10\ \text{MPa}
$$

The fatigue loading is specified as:

**Fully Reversed Cyclic Loading**

For fully reversed loading:

$$
R=-1
$$

and the mean stress is:

$$
\sigma_m=0
$$

---

# 6. Boundary Conditions

The bracket is constrained using a **Fixed Support** at the mounting/support region.

The fixed support prevents displacement at the selected mounting region.

The fixed support represents the attachment of the bracket to a rigid structure.

---

# 7. Applied Pressure

A pressure of:

$$
\boxed{P=10\ \text{MPa}}
$$

is applied to the upper horizontal surface.

The pressure acts downward on the loading surface.

---

# 8. Static Structural Analysis

The static structural analysis was performed using ANSYS Mechanical.

The primary results evaluated are:

- Equivalent von-Mises stress
- Total deformation
- Static factor of safety

---

# 9. Equivalent von-Mises Stress

The equivalent stress distribution obtained from ANSYS is shown below.

### Result

The maximum equivalent von-Mises stress is:

$$
\boxed{\sigma_{vm,\max}=947.03\ \text{MPa}}
$$

The minimum displayed stress is approximately:

$$
\sigma_{vm,\min}=0.033718\ \text{MPa}
$$

### Critical Region

The maximum stress is located around the **lower curved transition / mounting region** of the bracket.

This region contains a geometric transition where the curved wall connects to the mounting flange.

Such geometric transitions can generate significant local stress concentrations.

---

# 10. Static Factor of Safety

The static factor-of-safety result is shown below.

### Result

The minimum static factor of safety is:

$$
\boxed{FOS_{\min}=0.26398}
$$

The maximum displayed factor of safety is:

$$
FOS_{\max}=15
$$

### Interpretation

The minimum factor of safety obtained in the ANSYS result is below 1:

$$
FOS_{\min}<1
$$

The minimum value occurs in the high-stress region near the curved transition and mounting area.

---

# 11. Total Deformation

The total deformation distribution is shown below.

### Result

The maximum total deformation is:

$$
\boxed{u_{\max}=0.24126\ \text{mm}}
$$

The minimum deformation is:

$$
u_{\min}=0\ \text{mm}
$$

The zero-displacement region corresponds to the fixed support.

The maximum deformation occurs on the upper loading region of the bracket.

---

# 12. Static Analysis Summary

| Parameter | Result |
|---|---:|
| Applied pressure | **10 MPa** |
| Young's modulus | **200 GPa** |
| Poisson's ratio | **0.30** |
| Maximum equivalent stress | **947.03 MPa** |
| Minimum equivalent stress | 0.033718 MPa |
| Maximum deformation | **0.24126 mm** |
| Minimum deformation | 0 mm |
| Minimum static FOS | **0.26398** |
| Maximum displayed FOS | 15 |
| Critical stress region | Curved transition / mounting region |

---

# 13. Fatigue Analysis

The fatigue analysis is performed using a cyclic loading condition.

The supplied problem statement specifies:

$$
P=10\ \text{MPa}
$$

with:

**Fully Reversed Loading**

The fatigue tool uses a constant-amplitude loading waveform.

---

# 14. Fully Reversed Loading

The fatigue tool shows a sinusoidal constant-amplitude loading condition.

For fully reversed loading:

$$
\sigma_{\max}=-\sigma_{\min}
$$

Therefore:

$$
R=\frac{\sigma_{\min}}{\sigma_{\max}}=-1
$$

The mean stress is:

$$
\sigma_m=
\frac{\sigma_{\max}+\sigma_{\min}}{2}
=0
$$

The alternating stress is:

$$
\sigma_a=
\frac{\sigma_{\max}-\sigma_{\min}}{2}
$$

Thus, the fatigue analysis corresponds to a zero-mean-stress fully reversed condition.

---

# 15. Mean Stress Correction

The ANSYS fatigue tool provides several mean-stress correction approaches:

- SN-None
- Goodman
- Soderberg
- Gerber
- ASME Elliptical

The supplied fatigue-tool screenshot shows the comparison between these correction methods.

The **Goodman** curve is highlighted in the displayed fatigue tool.

For the Goodman relationship:

$$
\frac{1}{n}
\=
\frac{\sigma_m}{S_{ut}}
+
\frac{\sigma_a}{S_e}
$$

For the fully reversed condition:

$$
\sigma_m=0
$$

so the mean-stress term becomes zero.

---

# 16. Fatigue Life

The fatigue-life result obtained from ANSYS is shown below.

### Result

The displayed minimum fatigue life is:

$$
\boxed{N_{\min}=274.07\ \text{cycles}}
$$

The maximum displayed fatigue life is:

$$
\boxed{N_{\max}=1\times10^6\ \text{cycles}}
$$

### Interpretation

The lowest fatigue life occurs in the region experiencing the highest cyclic stress.

The critical area is located around the **curved transition near the mounting flange**.

The fatigue-life distribution demonstrates that the bracket does not experience a uniform fatigue response. Regions away from the critical stress concentration have substantially higher predicted life.

---

# 17. Fatigue Factor of Safety

The fatigue factor-of-safety result is shown below.

### Result

The minimum displayed fatigue factor of safety is:

$$
\boxed{FOS_{\text{fatigue,min}}=0.09102}
$$

The maximum displayed value is:

$$
FOS_{\text{fatigue,max}}=15
$$

### Interpretation

The critical fatigue factor of safety occurs near the region of maximum cyclic stress.

The result indicates a strong local fatigue demand at the curved/mounting transition.

---

# 18. Fatigue Sensitivity Analysis

A loading-history sensitivity analysis was performed.

The result shows the predicted available fatigue life as the loading-history parameter changes.

The displayed results show approximately:

| Loading History | Available Life (cycles) |
|---:|---:|
| 0.50 | 1662.2 |
| 0.55 | ~1350 |
| 0.60 | ~1120 |
| 0.65 | ~940 |
| 0.70 | ~790 |
| 0.75 | ~670 |
| 0.80 | ~570 |
| 0.85 | ~500 |
| 0.90 | ~440 |
| 0.95 | ~390 |
| 1.00 | ~330 |
| 1.05 | ~300 |
| 1.10 | ~260 |
| 1.20 | ~220 |
| 1.30 | ~180 |
| 1.40 | ~140 |
| 1.50 | **98.752** |

The exact intermediate values should be taken from the ANSYS sensitivity dataset if the project file is available.

### Observed Trend

The predicted fatigue life decreases continuously as the loading-history parameter increases.

The displayed range is approximately:

$$
1662.2
\rightarrow
98.752\ \text{cycles}
$$

This demonstrates a strong sensitivity of fatigue life to cyclic loading history.

---

# 19. Critical Regions

The ANSYS results consistently identify the **curved transition near the mounting flange** as a critical region.

The critical region is associated with:

- High equivalent stress
- Low static factor of safety
- Low fatigue life
- Low fatigue factor of safety

The geometry contains several curved transitions, and these regions act as potential stress-concentration locations.

---

# 21. Mesh Considerations

The supplied ANSYS result images show a relatively fine mesh across the bracket, including the curved regions.

Fine mesh resolution is particularly important near:

* Curved transitions
* Mounting regions
* Holes
* Loading regions
* High-stress areas

A mesh convergence study should be performed before using the numerical peak stress for final design decisions.

Recommended approach:

```text
Coarse Mesh
     ↓
Medium Mesh
     ↓
Fine Mesh
     ↓
Very Fine Mesh
     ↓
Compare Stress / Deformation / Fatigue Life
```

The result should be considered converged when further mesh refinement produces only a small change in the quantities of interest.

---

# 22. Static and Fatigue Results Comparison

| Parameter                      |  Static Analysis |      Fatigue Analysis |
| ------------------------------ | ---------------: | --------------------: |
| Loading                        |  10 MPa pressure | 10 MPa fully reversed |
| Material                       | Structural Steel |      Structural Steel |
| Young's modulus                |          200 GPa |               200 GPa |
| Poisson's ratio                |             0.30 |                  0.30 |
| Maximum equivalent stress      |   **947.03 MPa** |                     — |
| Maximum deformation            |   **0.24126 mm** |                     — |
| Minimum static FOS             |      **0.26398** |                     — |
| Minimum fatigue life           |                — |     **274.07 cycles** |
| Maximum displayed fatigue life |                — |    **1 × 10⁶ cycles** |
| Minimum fatigue FOS            |                — |           **0.09102** |
| Fatigue loading                |                — |        Fully reversed |
| Mean stress                    |                — |                     0 |
| Mean stress correction         |                — |         Goodman shown |

---

# 23. Static Analysis Results

The key static results are:

### Maximum Equivalent Stress

$$
\boxed{
\sigma_{vm,\max}=947.03\ \text{MPa}
}
$$

### Maximum Total Deformation

$$
\boxed{
u_{\max}=0.24126\ \text{mm}
}
$$

### Minimum Static Factor of Safety

$$
\boxed{
FOS_{\min}=0.26398
}
$$

---

# 24. Fatigue Analysis Results

The key fatigue results are:

### Minimum Fatigue Life

$$
\boxed{
N_{\min}=274.07\ \text{cycles}
}
$$

### Maximum Displayed Fatigue Life

$$
\boxed{
N_{\max}=1\times10^6\ \text{cycles}
}
$$

### Minimum Fatigue Factor of Safety

$$
\boxed{
FOS_{\text{fatigue,min}}=0.09102
}
$$

---

# 25. Loading-History Sensitivity Results

The sensitivity study gives:

### Maximum displayed available life

$$
\boxed{
N_{\max,\text{sensitivity}}\approx1662.2\ \text{cycles}
}
$$

at a loading-history value of approximately:

$$
0.5
$$

### Minimum displayed available life

$$
\boxed{
N_{\min,\text{sensitivity}}\approx98.752\ \text{cycles}
}
$$

at a loading-history value of approximately:

$$
1.5
$$

Thus:

$$
1662.2
\rightarrow
98.752\ \text{cycles}
$$

over the displayed sensitivity range.

---

# 26. Analysis Workflow

The complete ANSYS workflow is:

```text
                     BRACKET GEOMETRY
                           |
                           v
                  MATERIAL DEFINITION
                           |
                           v
                      MESHING
                           |
                           v
                    FIXED SUPPORT
                           |
                           v
                   PRESSURE = 10 MPa
                           |
                           v
                STATIC STRUCTURAL SOLVE
                           |
              +------------+------------+
              |            |            |
              v            v            v
        Equivalent     Total        Static
          Stress     Deformation     FOS
              |            |            |
              +------------+------------+
                           |
                           v
                    FATIGUE TOOL
                           |
                           v
               FULLY REVERSED LOADING
                           |
                           v
                  S-N CURVE DEFINITION
                           |
                           v
                MEAN-STRESS CORRECTION
                           |
                           v
                   FATIGUE SOLUTION
                           |
                 +---------+---------+
                 |                   |
                 v                   v
            Fatigue Life       Fatigue FOS
                 |
                 v
             Sensitivity
               Study
```

---

# 27. Engineering Interpretation

The static analysis gives a maximum equivalent stress of:

$$
947.03\ \text{MPa}
$$

The maximum total deformation is:

$$
0.24126\ \text{mm}
$$

The minimum static factor of safety displayed by ANSYS is:

$$
0.26398
$$

The fatigue analysis predicts a minimum displayed life of:

$$
274.07\ \text{cycles}
$$

and a minimum fatigue factor of safety of:

$$
0.09102
$$

The same general regions associated with high local stresses are also associated with reduced fatigue life.

The sensitivity study further shows that increasing the loading-history parameter results in a reduction in predicted available fatigue life.

---

# 28. Important Engineering Observations

1. The bracket experiences the highest equivalent stress near a **curved mounting transition**.
2. The maximum von-Mises stress is **947.03 MPa**.
3. The maximum total deformation is **0.24126 mm**.
4. The minimum static factor of safety is **0.26398**.
5. The fatigue analysis uses **fully reversed cyclic loading**.
6. The fully reversed condition corresponds to zero mean stress.
7. The ANSYS fatigue tool provides Goodman, Soderberg, Gerber and ASME Elliptical mean-stress correction options.
8. The supplied fatigue-tool screenshot shows the **Goodman** correction highlighted.
9. The minimum displayed fatigue life is **274.07 cycles**.
10. The minimum displayed fatigue factor of safety is **0.09102**.
11. The loading-history sensitivity ranges from approximately **1662.2 cycles to 98.752 cycles**.
12. The curved transition and mounting region are important areas for fatigue assessment.
13. Mesh refinement around geometric transitions is important for reliable stress evaluation.

---

# 29. Design Improvement Study

Potential design variables for a future parametric study include:

### Geometry

* Increase transition radius
* Increase bracket thickness
* Increase flange width
* Modify the curved profile
* Increase the distance from the hole to the curved transition
* Modify hole diameter/location

### Material

Investigate materials with different:

* Yield strengths
* Ultimate strengths
* Fatigue strengths
* S-N characteristics

### Loading

Investigate the influence of:

* Reduced pressure
* Different stress ratios
* Different cyclic amplitudes
* Different loading histories

---

# 30. Suggested Parametric Study

A useful future study would vary the transition radius.

For example:

```text
R = 20 mm
R = 25 mm
R = 30 mm
R = 35 mm
R = 40 mm
```

For each geometry, record:

```text
Maximum Stress
       ↓
Maximum Deformation
       ↓
Static FOS
       ↓
Fatigue Life
       ↓
Fatigue FOS
```

This would quantify the effect of geometric stress concentration on bracket performance.

---

# 31. Suggested Mesh-Convergence Study

Perform at least three mesh levels:

| Mesh   | Element Size | Maximum Stress | Deformation | Fatigue Life |
| ------ | -----------: | -------------: | ----------: | -----------: |
| Coarse |            — |              — |           — |            — |
| Medium |            — |              — |           — |            — |
| Fine   |            — |              — |           — |            — |

The values should be extracted from ANSYS after each refinement.

The final mesh should be selected based on convergence rather than simply using the smallest available element size.

---

# 35. Skills Demonstrated

This project demonstrates practical experience with:

* ANSYS Mechanical
* Finite Element Analysis
* Static Structural Analysis
* Fatigue Analysis
* Structural Steel modeling
* CAD geometry interpretation
* FEM preprocessing
* Mesh generation
* Boundary-condition definition
* Pressure loading
* von-Mises stress analysis
* Total deformation analysis
* Factor-of-safety evaluation
* S-N fatigue analysis
* Fully reversed cyclic loading
* Mean-stress correction
* Goodman criterion
* Fatigue-life prediction
* Fatigue sensitivity analysis
* Engineering post-processing
* Interpretation of critical stress regions

---

# 37. Conclusion

This project demonstrates a complete FEM workflow for the **static and fatigue assessment of a formed bracket section**.

The static analysis produced:

$$
\boxed{\sigma_{vm,\max}=947.03\ \text{MPa}}
$$

$$
\boxed{u_{\max}=0.24126\ \text{mm}}
$$

$$
\boxed{FOS_{\min}=0.26398}
$$

The fatigue analysis using fully reversed cyclic loading produced:

$$
\boxed{N_{\min}=274.07\ \text{cycles}}
$$

$$
\boxed{FOS_{\text{fatigue,min}}=0.09102}
$$

The sensitivity analysis showed a reduction in available fatigue life from approximately:

$$
\boxed{1662.2\ \text{cycles}}
$$

to:

$$
\boxed{98.752\ \text{cycles}}
$$

over the displayed loading-history range.

The ANSYS results consistently identify the **curved transition/mounting region** as an important critical area because of its high local stress and corresponding fatigue demand.

The project therefore demonstrates the complete relationship between:

```text
CAD Geometry
     ↓
Material Definition
     ↓
Meshing
     ↓
Boundary Conditions
     ↓
Static Pressure Loading
     ↓
Static Structural Analysis
     ↓
Stress / Deformation / FOS
     ↓
S-N Fatigue Definition
     ↓
Fully Reversed Cyclic Loading
     ↓
Mean Stress Correction
     ↓
Fatigue Life / Fatigue FOS
     ↓
Sensitivity Analysis
```

---

## Author

**Musharraf Khan**

M.Sc. Computational Methods in Engineering
Otto von Guericke University Magdeburg

### Software & Methods

* ANSYS Mechanical 2026 R1 Student
* Finite Element Method (FEM)
* Static Structural Analysis
* Fatigue Analysis
* S-N Curve
* Goodman Mean-Stress Correction
* Fatigue Sensitivity Analysis

```
```

