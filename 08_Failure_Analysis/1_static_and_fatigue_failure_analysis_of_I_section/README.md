# 08_1 — Static and Fatigue Analysis of an I-Section

## Overview

This project presents a combined **Static Structural Analysis** and **Fatigue Analysis** of a dog-bone-shaped **I-section specimen** using **ANSYS Mechanical 2026 R1 Student**.

The objective is to evaluate the structural response of the specimen under a prescribed **50 MPa load**, identify the critical stress locations, determine deformation and static safety factor, and subsequently evaluate the fatigue behavior under fully reversed cyclic loading.

The analysis includes:

- I-section geometry definition
- Structural steel material definition
- Fixed support boundary condition
- 50 MPa static pressure loading
- Equivalent von-Mises stress analysis
- Total deformation analysis
- Static factor-of-safety evaluation
- S-N curve definition
- Fully reversed cyclic loading
- Mean-stress correction
- Goodman fatigue criterion
- Fatigue life prediction
- Fatigue safety factor
- Fatigue sensitivity to loading history

---

# 1. Project Objectives

The main objectives of this analysis are:

1. Create the I-section specimen geometry.
2. Define structural steel material properties.
3. Apply a fixed support boundary condition.
4. Apply a 50 MPa static pressure load.
5. Determine the equivalent von-Mises stress.
6. Determine the total deformation.
7. Evaluate the static factor of safety.
8. Define an S-N curve for the material.
9. Perform fully reversed fatigue analysis.
10. Evaluate fatigue life.
11. Determine fatigue factor of safety.
12. Investigate the influence of loading history on predicted fatigue life.
13. Identify critical regions of the specimen.
14. Compare static and fatigue performance.

---

# 2. Problem Definition

The analyzed component is a **dog-bone-shaped I-section specimen**.

The geometry contains:

- Upper flange
- Lower flange
- Narrow central web
- Filleted transitions between flange and web

The fillets are particularly important because geometric discontinuities can produce local stress concentrations.

### Geometry shown in the supplied model

The supplied geometry drawing indicates approximately:

| Parameter | Value |
|---|---:|
| Overall flange width | 15 mm |
| Flange thickness | 8 mm |
| Central web height | 22 mm |
| Web width | 5 mm |
| Fillet radius | 2 mm |
| Thickness | 0.75 mm |

---

# 3. Material Properties

The specimen is modeled using **Structural Steel**.

The supplied problem definition gives:

| Material Property | Value |
|---|---:|
| Young's Modulus, $E$ | 200 GPa |
| Poisson's Ratio, $\nu$ | 0.30 |

The fatigue analysis additionally uses the supplied S-N data.

---

# 4. Loading Cases

Two loading conditions are considered.

## Case 1 — Static Loading

A pressure of:

$$
P = 50\ \text{MPa}
$$

is applied as the static load.

The specimen is fixed at the bottom support region.

---

## Case 2 — Cyclic Loading

A cyclic load with a nominal magnitude of:

$$
P = 50\ \text{MPa}
$$

is considered for fatigue analysis.

The fatigue loading is defined as **fully reversed cyclic loading**, meaning that the stress alternates between tensile and compressive states.

For fully reversed loading:

$$
R=\frac{\sigma_{\min}}{\sigma_{\max}}=-1
$$

and:

$$
\sigma_m=0
$$

where:

- $R$ = Stress ratio
- $\sigma_m$ = Mean stress

---

# 5. Boundary Conditions

The lower support region of the I-section is constrained using a **Fixed Support**.

The fixed support prevents the corresponding translational degrees of freedom and provides the structural constraint required for the static analysis.

---

# 6. Applied Pressure

A pressure of:

$$
P=50\ \text{MPa}
$$

is applied to the upper loading region.

The loading direction is shown in the ANSYS setup.

---

# 7. Static Structural Analysis

The static structural analysis was performed using ANSYS Mechanical.

The main outputs considered were:

- Equivalent von-Mises stress
- Total deformation
- Static factor of safety

---

# 8. Equivalent von-Mises Stress

The equivalent von-Mises stress distribution is shown below.

### Result

The maximum equivalent stress obtained from the ANSYS result is:

$$
\boxed{\sigma_{vm,\max}=277.49\ \text{MPa}}
$$

The displayed minimum value is approximately:

$$
\sigma_{vm,\min}=0.12058\ \text{MPa}
$$

The maximum stress occurs near the **fillet/shoulder transition between the upper flange and the central web**.

This location represents a geometric stress-concentration region.

### Interpretation

The stress distribution shows that the highest stress is not located uniformly across the specimen. Instead, the stress concentrates near the transition between the flange and web.

This demonstrates the importance of:

- Fillet radius
- Geometric discontinuities
- Local stress concentration
- Mesh refinement around critical regions

---

# 9. Static Factor of Safety

The static factor of safety distribution is shown below.


### Result

The minimum static factor of safety shown by ANSYS is:

$$
\boxed{FOS_{\min}=0.90093}
$$

The maximum displayed value is:

$$
FOS_{\max}=15
$$

The minimum factor of safety occurs around the upper shoulder/fillet region where the equivalent stress reaches its maximum.

### Interpretation

The minimum factor of safety is below 1:

$$
FOS_{\min}<1
$$

Therefore, based on the displayed ANSYS result, the specified static loading condition produces a local stress exceeding the allowable strength criterion used by the analysis.

The critical region is the upper web-to-flange transition.

---

# 10. Total Deformation

The total deformation distribution is shown below.

### Result

The maximum total deformation is:

$$
\boxed{u_{\max}=0.033895\ \text{mm}}
$$

The minimum deformation is:

$$
u_{\min}=0\ \text{mm}
$$

The zero deformation occurs at the fixed support.

The maximum deformation is observed near the upper loaded flange region.

### Interpretation

The deformation magnitude is relatively small in absolute terms:

$$
u_{\max}\approx0.0339\ \text{mm}
$$

The deformation pattern is consistent with the fixed support at the lower end and applied loading at the upper end.

---

# 11. Static Analysis Summary

| Result | Value |
|---|---:|
| Applied pressure | 50 MPa |
| Maximum von-Mises stress | **277.49 MPa** |
| Minimum von-Mises stress | 0.12058 MPa |
| Maximum total deformation | **0.033895 mm** |
| Minimum deformation | 0 mm |
| Minimum static FOS | **0.90093** |
| Maximum displayed FOS | 15 |
| Critical stress region | Upper web/flange fillet |

---

# 12. S-N Curve

For the fatigue analysis, an S-N curve was defined using the supplied fatigue data.

The mean stress was specified as:

$$
\boxed{\sigma_m=0\ \text{Pa}}
$$

The supplied S-N data are:

| Number of Cycles, $N$ | Alternating Stress |
|---:|---:|
| 10 | 3999 MPa |
| 20 | 2827 MPa |
| 50 | 1896 MPa |
| 100 | 1413 MPa |
| 200 | 1069 MPa |
| 2,000 | 441 MPa |
| 10,000 | 262 MPa |
| 20,000 | 214 MPa |
| 100,000 | 138 MPa |
| 200,000 | 114 MPa |
| 1,000,000 | 86.2 MPa |

The S-N curve is plotted using logarithmic cycle information.

---

# 13. S-N Curve Characteristics

The supplied S-N curve shows the expected reduction in allowable alternating stress as the number of cycles increases.

For example:

$$
N=10
\Rightarrow
\sigma_a=3999\ \text{MPa}
$$

while:

$$
N=10^6
\Rightarrow
\sigma_a=86.2\ \text{MPa}
$$

Therefore, increasing the number of required fatigue cycles results in a lower allowable alternating stress.

The fatigue data are represented on a logarithmic cycle axis.

---

# 14. Fatigue Loading

The fatigue analysis uses a:

**Constant Amplitude — Fully Reversed** loading condition.

The fatigue loading waveform alternates between positive and negative stress.

For fully reversed loading:

$$
\sigma_{\max}=-\sigma_{\min}
$$

Therefore:

$$
\sigma_m=
\frac{\sigma_{\max}+\sigma_{\min}}{2}
=0
$$

and:

$$
\sigma_a=
\frac{\sigma_{\max}-\sigma_{\min}}{2}
$$

The supplied ANSYS fatigue tool shows the fully reversed cyclic loading waveform.

---

# 15. Mean Stress Correction

The fatigue analysis includes several mean-stress correction approaches:

- SN-None
- Goodman
- Soderberg
- Gerber
- ASME Elliptical

The supplied fatigue-tool result highlights the **Goodman** correction.

For the Goodman relation:

$$
\frac{1}{N}
=
\frac{\sigma_m}{S_{ut}}
+
\frac{\sigma_a}{S_e}
$$

For the fully reversed condition:

$$
\sigma_m=0
$$

so the mean-stress contribution becomes zero.

The fatigue tool therefore evaluates the alternating stress against the supplied S-N data for the zero-mean-stress condition.

---

# 16. Fatigue Life Analysis

The ANSYS fatigue-life result is shown below.

### Result

The displayed fatigue-life range is approximately:

$$
\boxed{N_{\min}=8373\ \text{cycles}}
$$

to:

$$
\boxed{N_{\max}=1\times10^6\ \text{cycles}}
$$

The critical minimum fatigue life is located around the transition region between the upper flange and central web.

### Interpretation

The fatigue-life distribution indicates that different regions of the specimen experience significantly different fatigue lives.

The region with the highest local alternating stress has the lowest predicted fatigue life.

The central web and fillet transition therefore become important regions for fatigue assessment.

---

# 17. Fatigue Factor of Safety

The supplied fatigue safety-factor result is shown below.

### Result

The minimum displayed fatigue factor of safety is approximately:

$$
\boxed{FOS_{\text{fatigue,min}}=0.31064}
$$

The maximum displayed value is:

$$
FOS_{\text{fatigue,max}}=15
$$

### Interpretation

The minimum fatigue factor of safety is below 1:

$$
FOS_{\text{fatigue,min}}<1
$$

Under the conventional interpretation of a fatigue safety factor, this indicates that the applied cyclic loading exceeds the fatigue criterion at the critical location.

The critical region corresponds to the high-stress transition near the flange/web fillet.

---

# 18. Fatigue Sensitivity / Loading History

A fatigue sensitivity analysis was also performed by varying the loading history.

The resulting fatigue life decreases as the loading-history parameter increases.

The supplied result shows approximately:

| Loading History | Available Life |
|---:|---:|
| 0.50 | 98,041 cycles |
| 0.55 | ~73,000 cycles |
| 0.60 | ~60,000 cycles |
| 0.65 | ~43,000 cycles |
| 0.70 | ~35,000 cycles |
| 0.75 | ~27,500 cycles |
| 0.80 | ~23,000 cycles |
| 0.85 | ~19,000 cycles |
| 0.90 | ~16,000 cycles |
| 0.95 | ~14,000 cycles |
| 1.00 | ~10,000 cycles |
| 1.10 | ~7,000 cycles |
| 1.20 | ~5,000 cycles |
| 1.30 | ~3,800 cycles |
| 1.40 | ~3,000 cycles |
| 1.50 | 2,391.1 cycles |

### Observation

The result shows a strong reduction in predicted fatigue life as the loading-history parameter increases.

The displayed range is approximately:

$$
98,041
\rightarrow
2,391.1\ \text{cycles}
$$

This demonstrates the sensitivity of fatigue life to the magnitude/history of cyclic loading.

---

# 19. Critical Locations

The ANSYS results consistently identify the region around the **web-to-flange fillet transition** as a critical location.

This region experiences:

- High equivalent stress
- Low static factor of safety
- Low fatigue life
- Low fatigue factor of safety

The reason is the geometric transition from the wide flange to the narrow web.

A sharp or relatively small-radius transition can produce a local stress concentration.

### Critical Region

```text
        ┌───────────────────┐
        │      FLANGE       │
        └───────╮   ╭───────┘
                │ R │
                │   │
                │WEB│  ← Critical region
                │   │
                │ R │
        ┌───────╯   ╰───────┐
        │      FLANGE       │
        └───────────────────┘
````

The fillet radius therefore plays an important role in the structural and fatigue response.

---

# 20. Mesh Consideration

The ANSYS results show a relatively fine mesh around the web/flange transitions.

This is important because the critical stresses occur near the fillets.

For reliable stress evaluation, the following should be considered:

* Local mesh refinement around fillets
* Mesh convergence study
* Consistent element quality
* Adequate elements through the thickness
* Avoidance of excessively distorted elements

A coarse mesh may underestimate or poorly resolve the local stress concentration.

---

# 21. Analysis Workflow

The complete analysis workflow is:

```text
Geometry Creation
       |
       v
Material Definition
       |
       v
Mesh Generation
       |
       v
Fixed Support
       |
       v
50 MPa Static Pressure
       |
       v
Static Structural Solution
       |
       +-----------------------+
       |                       |
       v                       v
Equivalent Stress       Total Deformation
       |
       v
Static Factor of Safety
       |
       v
S-N Curve Definition
       |
       v
Fully Reversed Cyclic Load
       |
       v
Mean Stress Correction
       |
       v
Goodman Fatigue Analysis
       |
       +-----------------------+
       |                       |
       v                       v
Fatigue Life           Fatigue Safety Factor
       |
       v
Sensitivity Analysis
```

---

# 22. Static vs Fatigue Results

| Parameter                      |  Static Analysis |      Fatigue Analysis |
| ------------------------------ | ---------------: | --------------------: |
| Loading                        |           50 MPa | Fully reversed cyclic |
| Material                       | Structural Steel |      Structural Steel |
| Young's modulus                |          200 GPa |               200 GPa |
| Poisson's ratio                |             0.30 |                  0.30 |
| Maximum von-Mises stress       |   **277.49 MPa** |                     — |
| Maximum deformation            |  **0.033895 mm** |                     — |
| Minimum FOS                    |      **0.90093** |           **0.31064** |
| Minimum fatigue life           |                — |      **8,373 cycles** |
| Maximum displayed fatigue life |                — |    **1 × 10⁶ cycles** |
| Mean stress                    |                — |              **0 Pa** |
| Mean-stress correction         |                — |         Goodman shown |

---

# 23. Engineering Interpretation

The static analysis produces a maximum von-Mises stress of:

$$
277.49\ \text{MPa}
$$

The corresponding minimum static factor of safety is:

$$
0.90093
$$

The critical stress is concentrated near the upper web/flange fillet.

The fatigue analysis predicts a minimum life of approximately:

$$
8,373\ \text{cycles}
$$

and a minimum fatigue safety factor of approximately:

$$
0.31064
$$

The fatigue results are therefore particularly sensitive to the local stress concentration at the flange/web transition.

The supplied fatigue sensitivity study also demonstrates that increasing the loading-history parameter substantially reduces the predicted available fatigue life.

---

# 24. Important Result Locations

### Static Equivalent Stress

**Critical location:** Upper web-to-flange fillet.

$$
\sigma_{vm,\max}=277.49\ \text{MPa}
$$

### Static Factor of Safety

**Critical location:** Upper web-to-flange fillet.

$$
FOS_{\min}=0.90093
$$

### Total Deformation

**Maximum location:** Upper loaded flange region.

$$
u_{\max}=0.033895\ \text{mm}
$$

### Fatigue Life

**Critical location:** Web/flange transition.

$$
N_{\min}=8373\ \text{cycles}
$$

### Fatigue Safety Factor

$$
FOS_{\text{fatigue,min}}=0.31064
$$

---

# 25. Results Summary

The principal results obtained from ANSYS are:

### Static Analysis

$$
\boxed{
\sigma_{vm,\max}=277.49\ \text{MPa}
}
$$

$$
\boxed{
u_{\max}=0.033895\ \text{mm}
}
$$

$$
\boxed{
FOS_{\min}=0.90093
}
$$

### Fatigue Analysis

$$
\boxed{
N_{\min}=8373\ \text{cycles}
}
$$

$$
\boxed{
N_{\max}=1\times10^6\ \text{cycles}
}
$$

$$
\boxed{
FOS_{\text{fatigue,min}}=0.31064
}
$$

### Sensitivity Analysis

$$
\boxed{
N_{\text{life}}\approx98,041
\rightarrow
2,391.1\ \text{cycles}
}
$$

over the displayed loading-history range.

---

# 26. Key Engineering Observations

1. The highest static stress occurs at the **web/flange fillet transition**.
2. The maximum von-Mises stress is **277.49 MPa**.
3. The maximum total deformation is **0.033895 mm**.
4. The minimum static factor of safety is **0.90093**.
5. The fatigue model uses a **fully reversed cyclic loading condition**.
6. The supplied S-N data use **zero mean stress**.
7. The fatigue analysis includes mean-stress correction options.
8. The supplied fatigue-tool result highlights the **Goodman** correction.
9. The minimum predicted fatigue life is approximately **8,373 cycles**.
10. The minimum displayed fatigue factor of safety is **0.31064**.
11. Fatigue life decreases significantly with increasing loading-history parameter.
12. The flange/web fillet is the dominant critical region in both static and fatigue results.

---

# 27. Design Improvement Considerations

Based on the locations shown in the supplied results, potential design variables for a future study include:

* Increasing the fillet radius
* Increasing web thickness
* Increasing flange thickness
* Increasing the web width
* Reducing local stress concentration
* Improving surface finish
* Selecting a material with higher fatigue strength
* Reducing the applied cyclic load
* Introducing a more gradual geometric transition

These modifications can be investigated using parametric FEM studies.

---

# 28. Suggested Future Work

The project can be extended through:

### 1. Mesh Convergence

Run the analysis using multiple mesh sizes around the fillet:

```text
Coarse Mesh
     ↓
Medium Mesh
     ↓
Fine Mesh
     ↓
Very Fine Mesh
     ↓
Compare Maximum Stress
```

The goal is to determine whether the critical stress has converged.

---

### 2. Fillet Radius Study

Perform a parametric study:

```text
R = 1 mm
R = 2 mm
R = 3 mm
R = 4 mm
R = 5 mm
```

and compare:

* Maximum stress
* Static FOS
* Fatigue life
* Fatigue FOS

---

### 3. Material Comparison

Compare different structural materials using their corresponding:

* Yield strength
* Ultimate strength
* S-N curves
* Fatigue strength

---

### 4. Fatigue Criterion Comparison

Compare:

* Goodman
* Soderberg
* Gerber
* ASME Elliptical

using identical loading conditions.

---

### 5. Nonlinear Analysis

A future analysis can include:

* Plasticity
* Large deformation
* Nonlinear material behavior
* Contact
* Geometric nonlinearity

---

# 29. ANSYS Analysis Setup

The analysis was performed using:

**Software:** ANSYS Mechanical
**Version:** ANSYS 2026 R1 Student

The general analysis tree can be represented as:

```text
Static Structural
|
+-- Engineering Data
|     |
|     +-- Structural Steel
|
+-- Geometry
|     |
|     +-- I-Section Specimen
|
+-- Mesh
|     |
|     +-- Refined region around fillets
|
+-- Static Structural
      |
      +-- Fixed Support
      |
      +-- Pressure = 50 MPa
      |
      +-- Solution
            |
            +-- Equivalent Stress
            +-- Total Deformation
            +-- Safety Factor
            |
            +-- Fatigue Tool
                  |
                  +-- S-N Curve
                  +-- Fully Reversed Loading
                  +-- Goodman Correction
                  +-- Fatigue Life
                  +-- Fatigue Safety Factor
```

---

# 34. Conclusion

This project demonstrates a complete workflow for evaluating both **static structural performance and fatigue behavior** of an I-section specimen using ANSYS.

The static analysis identified the flange/web fillet transition as the critical region, with a maximum von-Mises stress of **277.49 MPa** and maximum total deformation of **0.033895 mm**.

The corresponding minimum static factor of safety was **0.90093**.

The fatigue analysis was based on a supplied S-N curve and a fully reversed cyclic loading condition with zero mean stress. The analysis predicted a minimum fatigue life of approximately **8,373 cycles** and a minimum displayed fatigue factor of safety of **0.31064**.

The sensitivity analysis further demonstrated that the predicted fatigue life is strongly dependent on the loading history.

Overall, the project demonstrates the connection between:

```text
Geometry
    ↓
Material
    ↓
Mesh
    ↓
Boundary Conditions
    ↓
Static Structural Analysis
    ↓
Stress / Deformation / FOS
    ↓
S-N Curve
    ↓
Cyclic Loading
    ↓
Mean Stress Correction
    ↓
Fatigue Life / Fatigue FOS
    ↓
Sensitivity Analysis
```

The project provides a practical FEM-based example of **static failure assessment, fatigue-life prediction, and engineering post-processing** of a mechanical component.

---

## Author

**Musharraf Khan**

M.Sc. Computational Methods in Engineering
Otto von Guericke University Magdeburg

### Tools

* ANSYS Mechanical 2026 R1 Student
* Finite Element Method (FEM)
* Structural Mechanics
* Fatigue Analysis
* S-N Curve Analysis
* Goodman Mean-Stress Correction

```

