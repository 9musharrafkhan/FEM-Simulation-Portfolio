# 08_Failure_Analysis

# Failure Analysis of Mechanical Components

---

## Overview

This project presents a systematic study of **failure analysis of mechanical components and structures** subjected to static, cyclic, and compressive loading.

The project focuses on identifying different failure mechanisms and applying appropriate engineering criteria to determine whether a machine element can safely withstand an applied loading condition.

The study covers:

- Static failure
- Ductile and brittle material failure
- Failure theories
- Principal stress criteria
- Maximum shear stress theory
- Distortion energy / von-Mises theory
- Completely reversed and cyclic stresses
- Fatigue failure
- Fatigue life
- Fracture mechanics
- Crack initiation and crack propagation
- Fatigue design philosophies
- Stress-life (S–N) method
- Strain-life (ε–N) method
- Crack-growth approach
- Endurance limit
- Endurance strength
- Stress range and stress amplitude
- Mean stress
- Goodman criterion
- Soderberg criterion
- Gerber criterion
- Buckling failure
- Euler buckling load
- Safe load estimation

The concepts form an important foundation for **FEM-based structural failure assessment and mechanical design**.

---

# Objectives

The main objectives of this project are to:

- Understand the different modes of mechanical failure.
- Distinguish between static and fatigue failure.
- Understand failure behavior of ductile and brittle materials.
- Study classical theories of failure.
- Calculate allowable/failure stress using a factor of safety.
- Understand equivalent von-Mises stress.
- Analyze cyclic and completely reversed stresses.
- Understand fatigue-life estimation methods.
- Interpret S–N curves.
- Determine stress range, stress amplitude, and mean stress.
- Understand the effect of mean stress on fatigue strength.
- Apply Goodman, Soderberg, and Gerber criteria.
- Understand fracture mechanics and crack propagation.
- Understand buckling of slender structural members.
- Estimate critical buckling load and safe load.
- Relate classical failure criteria to FEM post-processing.

---

# 1. Introduction to Failure Analysis

Mechanical structures such as:

- Bridges
- Aircraft structures
- Machine components
- Shafts
- Beams
- Columns
- Connecting rods
- Structural members

can fail in several different ways.

Typical failure mechanisms include:

1. Static failure
2. Fatigue failure
3. Buckling failure
4. Fracture

A failure analysis determines the loading condition under which a component may lose its intended function or structural integrity.

**Figure 1** introduces the major categories of failure considered in this project.

![Introduction to Failure Analysis](figures/01_introduction_to_failure_analysis.png)

---

# 2. Static Failure

Under static loading conditions, failure can occur when the stress in a component exceeds the allowable or failure stress.

For a ductile material, excessive loading may cause:

- Permanent deformation
- Yielding
- Loss of structural functionality

For a brittle material, failure may occur primarily through fracture.

The basic engineering design requirement is:

$$
\sigma_{\mathrm{developed}} < \sigma_{\mathrm{allowable}}
$$

The allowable stress is generally obtained by applying a factor of safety.

**Figure 2** illustrates static failure and the concept of failure/design/working/allowable stress.

![Ductile Material Failure](figures/02_ductile_material_failure.png)

---

# 3. Failure Stress and Factor of Safety

For a ductile material, the allowable stress can be calculated from the yield strength:

$$
\sigma_{\mathrm{allowable}}
=
\frac{S_y}{N}
$$

where:

- $S_y$ = Yield strength
- $N$ = Factor of safety

Therefore, failure/design assessment is based on comparing the calculated stress with the allowable stress.

For example:

$$
\sigma_{\mathrm{calculated}}
<
\frac{S_y}{N}
$$

indicates that the component satisfies the specified stress criterion.

---

# 4. Ductile Material Behavior

Ductile materials can undergo significant plastic deformation before fracture.

A typical engineering stress-strain response contains:

- Proportional limit
- Elastic limit
- Yield point
- Plastic region
- Ultimate tensile strength
- Breaking point

The yield strength is particularly important for static failure analysis.

For a ductile material:

$$
\sigma_{\mathrm{allowable}}
=
\frac{S_y}{N}
$$

**Figure 2** shows the stress-strain behavior of a ductile material and identifies the yield and ultimate points.

---

# 5. Brittle Material Behavior

Brittle materials generally exhibit considerably less plastic deformation before fracture.

For brittle materials, failure is often associated with the maximum principal stress reaching an allowable level.

A simplified criterion is:

$$
\sigma_1
\leq
\sigma_{\mathrm{allowable}}
$$

where $\sigma_1$ is the maximum principal stress.

The corresponding allowable stress can be expressed as:

$$
\sigma_{\mathrm{allowable}}
=
\frac{S_{ut}}{N}
$$

where:

- $S_{ut}$ = Ultimate tensile strength
- $N$ = Factor of safety

**Figure 3** illustrates the stress-strain behavior and breaking point of a brittle material.

![Brittle Material Failure](figures/03_brittle_material_failure.png)

---

# 6. Theories of Failure

Mechanical components are frequently subjected to combined:

- Axial loading
- Bending
- Torsion
- Shear
- Multiaxial stress states

Therefore, a suitable failure theory is required to convert the complex stress state into an appropriate failure criterion.

The main theories considered are:

1. Maximum principal stress theory
2. Maximum principal strain theory
3. Maximum shear stress theory
4. Distortion energy theory

**Figure 4** summarizes these theories and their typical applications.

![Theories of Failure](figures/04_theories_of_failure.png)

---

# 7. Maximum Principal Stress Theory

The maximum principal stress theory is also known as the **Rankine theory**.

For a tensile failure condition:

$$
\sigma_1
\geq
\frac{S_y}{N}
$$

For a safe condition:

$$
\sigma_1
<
\frac{S_y}{N}
$$

This criterion is particularly associated with brittle materials where tensile fracture is dominant.

---

# 8. Maximum Principal Strain Theory

The maximum principal strain theory is commonly associated with the **St. Venant theory**.

For plane stress, the principal strain can be related to the principal stresses by Hooke's law:

$$
\varepsilon_1
=
\frac{1}{E}
\left(
\sigma_1-\nu\sigma_2
\right)
$$

The corresponding failure condition compares the maximum principal strain with the allowable strain.

---

# 9. Maximum Shear Stress Theory

The maximum shear stress theory is also known as the **Tresca or Guest theory**.

The maximum shear stress is:

$$
\tau_{\max}
=
\frac{\sigma_1-\sigma_3}{2}
$$

For a ductile material, yielding according to Tresca occurs when:

$$
\sigma_1-\sigma_3
\geq
\frac{S_y}{N}
$$

or equivalently:

$$
\tau_{\max}
\geq
\frac{S_y}{2N}
$$

This criterion is generally conservative for ductile materials.

---

# 10. Distortion Energy Theory

The distortion energy theory is commonly known as the **von-Mises failure criterion**.

For a three-dimensional stress state:

$$
\sigma_{vm}
=
\sqrt{
\frac{1}{2}
\left[
(\sigma_x-\sigma_y)^2
+
(\sigma_y-\sigma_z)^2
+
(\sigma_z-\sigma_x)^2
+
6(\tau_{xy}^2+\tau_{yz}^2+\tau_{zx}^2)
\right]
}
$$

For principal stresses:

$$
\sigma_{vm}
=
\sqrt{
\frac{
(\sigma_1-\sigma_2)^2+
(\sigma_2-\sigma_3)^2+
(\sigma_3-\sigma_1)^2
}{2}
}
$$

The component is considered safe when:

$$
\sigma_{vm}
<
\frac{S_y}{N}
$$

This criterion is widely used in FEM post-processing for ductile metallic components.

---

# 11. Cyclic and Completely Reversed Stress

Mechanical components can experience stresses that vary with time.

For a completely reversed stress cycle:

$$
\sigma_{\max}
=
-\sigma_{\min}
$$

Therefore:

$$
\sigma_m
=
\frac{\sigma_{\max}+\sigma_{\min}}{2}
=
0
$$

where $\sigma_m$ is the mean stress.

The stress amplitude is:

$$
\sigma_a
=
\frac{\sigma_{\max}-\sigma_{\min}}{2}
$$

The stress range is:

$$
\sigma_r
=
\sigma_{\max}-\sigma_{\min}
$$

**Figure 5** illustrates completely reversed/cyclic stress and different types of fluctuating stress.

![Completely Reversed Stress](figures/05_completely_reversed_stress.png)

---

# 12. Fatigue Failure

Fatigue is a failure mechanism associated with repeated or cyclic loading.

A component may fail under cyclic loading even when the applied stress is below the static yield strength.

Fatigue failure is therefore strongly dependent on:

- Stress amplitude
- Mean stress
- Number of cycles
- Material
- Surface condition
- Geometry
- Stress concentration
- Loading history

The general fatigue process can be represented as:

```text
Cyclic Loading
      │
      ▼
Stress Concentration
      │
      ▼
Crack Initiation
      │
      ▼
Crack Propagation
      │
      ▼
Final Fracture
````

**Figure 6** introduces fatigue failure and explains delayed failure under repeated loading.

![Fatigue Failure](figures/06_fatigue_failure.png)

---

# 13. Fatigue Life

Fatigue life describes how long a component can withstand cyclic loading before failure.

Fatigue life can broadly be classified into:

* Finite life
* Infinite life

Finite-life fatigue can be further divided into:

* Low-cycle fatigue
* High-cycle fatigue

The uploaded reference material uses approximately **1000 cycles** as the distinction between low-cycle and high-cycle fatigue.

The simplified classification is:

```text
Fatigue Life
│
├── Finite Life
│   ├── Low-Cycle Fatigue
│   └── High-Cycle Fatigue
│
└── Infinite Life
    └── Endurance Strength
```

**Figure 7** illustrates the classification of fatigue life.

![Fatigue Life](figures/07_fatigue_life.png)

---

# 14. Fracture Mechanics

Fracture mechanics considers the effect of cracks and crack-like defects on structural integrity.

The basic concept is that real components may contain microscopic flaws or defects.

Under applied loading, the local stress near a crack can become significantly higher than the nominal stress.

The study of fracture mechanics therefore focuses on:

* Crack initiation
* Crack growth
* Crack propagation
* Fracture toughness
* Stress intensity

For Mode-I loading, the stress intensity factor can be expressed generally as:

$$
K_I
=
Y\sigma\sqrt{\pi a}
$$

where:

* $K_I$ = Mode-I stress intensity factor
* $Y$ = Geometry correction factor
* $\sigma$ = Applied nominal stress
* $a$ = Crack size

Crack growth becomes critical when:

$$
K_I
\geq
K_{IC}
$$

where $K_{IC}$ is the fracture toughness.

**Figure 8** presents the concept of fracture mechanics and crack propagation.

![Fracture Mechanics](figures/08_fracture_mechanics.png)

---

# 15. Fatigue Design Philosophies

Three major fatigue design philosophies are considered:

## Safe-Life Design

The component is designed to operate safely for a specified number of cycles.

The component is generally replaced before the expected fatigue life is exceeded.

## Fail-Safe Design

The structure is designed so that failure of one component does not immediately result in catastrophic failure.

The remaining structure should maintain sufficient load-carrying capability until repair.

## Damage-Tolerant Design

The design assumes that defects or cracks may already exist.

Periodic inspection is used to ensure that crack growth does not reach a critical size between inspections.

**Figure 9** illustrates these three fatigue design philosophies.

![Fatigue Design Philosophies](figures/09_fatigue_design_philosophies.png)

---

# 16. Fatigue Life Estimation Methods

Three important fatigue-life estimation approaches are:

### Stress-Life Method

Also known as the **S–N method**.

It relates stress amplitude to the number of cycles to failure.

### Strain-Life Method

Also known as the **ε–N method**.

It is particularly useful when local plastic deformation is significant.

### Crack-Growth Method

This approach assumes an existing crack and predicts its growth under cyclic loading.

The three methods can be summarized as:

```text
Fatigue Life Estimation
│
├── Stress-Life
│   └── S-N Method
│
├── Strain-Life
│   └── ε-N Method
│
└── Crack Growth
    └── Damage-Tolerant Design
```

**Figure 10** summarizes these fatigue-life estimation methods.

![Fatigue Life Estimation Methods](figures/10_life_estimation_methods.png)

---

# 17. Endurance Limit

The endurance limit represents the stress amplitude below which a material can theoretically sustain a very large number of completely reversed cycles without fatigue failure.

It is commonly represented by:

$$
S_e
$$

For an idealized infinite-life region:

$$
\sigma_a
\leq
S_e
$$

where:

* $\sigma_a$ = Stress amplitude
* $S_e$ = Endurance limit

The endurance limit is particularly relevant for high-cycle fatigue design.

**Figure 11** introduces the endurance limit and the S–N curve.

![Endurance Limit](figures/11_endurance_limit.png)

---

# 18. S–N Curve

The S–N curve represents the relationship between:

* Stress amplitude
* Number of stress cycles to failure

It is commonly plotted on a logarithmic scale.

The general relationship is:

$$
\sigma_a=f(N)
$$

where:

* $\sigma_a$ = Stress amplitude
* $N$ = Number of cycles

A typical S–N response contains:

```text
Stress Amplitude
      │
      │\
      │ \
      │  \
      │   \
      │    \________ Endurance Region
      │
      └────────────────────────────
             Number of Cycles
```

The curve generally distinguishes:

* Low-cycle fatigue
* High-cycle fatigue
* Infinite-life region

**Figure 12** shows a representative S–N curve and its infinite-life region.

![S-N Curve](figures/12_sn_curve.png)

---

# 19. Endurance Strength

Endurance strength is the maximum stress amplitude that can be sustained for a specified large number of cycles without fatigue failure.

The endurance strength depends on:

* Material
* Surface finish
* Geometry
* Loading condition
* Stress concentration
* Environmental conditions
* Manufacturing processes

For infinite-life operation:

$$
\sigma_a
\leq
S_e
$$

**Figure 13** illustrates the transition from the plastic/finite-life region to the endurance or infinite-life region.

![Endurance Strength](figures/13_endurance_strength.png)

---

# 20. Fatigue Stress Parameters

For a cyclic stress varying between $\sigma_{\max}$ and $\sigma_{\min}$:

## Stress Range

$$
\sigma_r
=
\sigma_{\max}
-
\sigma_{\min}
$$

## Stress Amplitude

$$
\sigma_a
=
\frac{
\sigma_{\max}-\sigma_{\min}
}{2}
$$

## Mean Stress

$$
\sigma_m
=
\frac{
\sigma_{\max}+\sigma_{\min}
}{2}
$$

## Stress Ratio

The stress ratio is:

$$
R
=
\frac{\sigma_{\min}}
{\sigma_{\max}}
$$

For completely reversed loading:

$$
R=-1
$$

and:

$$
\sigma_m=0
$$

**Figure 14** illustrates stress range, stress amplitude, and mean stress.

![Fatigue Stress Parameters](figures/14_fatigue_stress_criteria.png)

---

# 21. Mean Stress Effect

Mean stress has an important influence on fatigue life.

A tensile mean stress generally reduces fatigue strength, while compressive mean stress can improve fatigue resistance.

For a general fluctuating stress:

$$
\sigma_m
\neq
0
$$

Therefore, fatigue criteria are required to account for the combined effect of:

* Alternating stress
* Mean stress
* Ultimate strength
* Yield strength
* Endurance strength

---

# 22. Goodman Criterion

The Goodman relation provides a linear relationship between alternating stress and mean stress.

The factor-of-safety form is:

$$
\frac{1}{N}
=
\frac{\sigma_m}{S_{ut}}
+
\frac{\sigma_a}{S_e}
$$

where:

* $N$ = Factor of safety
* $\sigma_m$ = Mean stress
* $\sigma_a$ = Alternating stress
* $S_{ut}$ = Ultimate tensile strength
* $S_e$ = Endurance strength

For a specified factor of safety:

$$
\frac{\sigma_m}{S_{ut}}
+
\frac{\sigma_a}{S_e}
\leq
\frac{1}{N}
$$

The Goodman criterion is commonly used as a practical linear fatigue design criterion.

---

# 23. Soderberg Criterion

The Soderberg criterion uses the yield strength rather than the ultimate tensile strength.

The factor-of-safety form is:

$$
\frac{1}{N}
=
\frac{\sigma_m}{S_y}
+
\frac{\sigma_a}{S_e}
$$

where:

* $S_y$ = Yield strength
* $S_e$ = Endurance strength

Since:

$$
S_y<S_{ut}
$$

the Soderberg criterion is generally more conservative than the Goodman criterion.

---

# 24. Gerber Criterion

The Gerber criterion uses a parabolic relationship between mean stress and alternating stress.

A common form is:

$$
\frac{1}{N}
=
\left(
\frac{\sigma_m}{S_{ut}}
\right)^2
+
\frac{\sigma_a}{S_e}
$$

The Gerber curve generally provides a less conservative prediction than the Goodman and Soderberg relations.

---

# 25. Goodman Diagram

The Goodman diagram compares fatigue strength against mean stress.

The major criteria are:

* Goodman
* Soderberg
* Gerber

The general diagram can be interpreted as:

```text
Alternating
Stress
  │
  │\
Se│ \       Goodman
  │  \____  Gerber
  │   \
  │    \ Soderberg
  │
  └────────────────── Mean Stress
      Sy          Sut
```

The region below the appropriate design curve represents the nominal safe region according to the selected criterion.

**Figure 15** presents the Goodman diagram and compares the Goodman, Soderberg, and Gerber criteria.

![Goodman Diagram](figures/15_goodman_diagram.png)

---

# 26. Comparison of Fatigue Criteria

| Criterion | Mean Stress Reference              | General Behavior  |
| --------- | ---------------------------------- | ----------------- |
| Goodman   | Ultimate tensile strength $S_{ut}$ | Linear            |
| Soderberg | Yield strength $S_y$               | More conservative |
| Gerber    | Ultimate tensile strength $S_{ut}$ | Parabolic         |
| S–N       | Experimental fatigue data          | Life-based        |

For conservative design:

$$
\text{Soderberg}
>
\text{Goodman}
>
\text{Gerber}
$$

in terms of conservatism for many common tensile mean-stress cases.

The actual selection should depend on the material, loading, available fatigue data, and design requirements.

---

# 27. Buckling Failure

Buckling is a structural instability phenomenon that commonly occurs in slender members subjected to compression.

A component can buckle even when the material stress remains within the elastic range.

Typical examples include:

* Columns
* Slender rods
* Structural members
* Connecting components
* Thin structural elements

Buckling is therefore different from conventional material yielding.

**Figure 16** illustrates buckling failure and buckling modes.

![Buckling Failure](figures/16_buckling_failure.png)

---

# 28. Euler Critical Buckling Load

For an ideal slender column, Euler's critical buckling load is:

$$
P_{cr}
=
\frac{\pi^2EI}{(KL)^2}
$$

where:

* $P_{cr}$ = Critical buckling load
* $E$ = Young's modulus
* $I$ = Area moment of inertia
* $K$ = Effective length factor
* $L$ = Actual unsupported length

The effective length is:

$$
L_e=KL
$$

Therefore:

$$
P_{cr}
=
\frac{\pi^2EI}{L_e^2}
$$

Buckling becomes more critical as the effective length increases and the structural stiffness decreases.

---

# 29. Radius of Gyration and Slenderness

The radius of gyration is:

$$
r
=
\sqrt{\frac{I}{A}}
$$

The slenderness ratio is:

$$
\lambda
=
\frac{KL}{r}
$$

A large slenderness ratio generally indicates a greater susceptibility to elastic buckling.

Euler's criterion is primarily applicable to sufficiently slender columns where elastic buckling is the governing mode.

---

# 30. Safe Buckling Load

The critical buckling load is not normally used directly as the design load.

A factor of safety is introduced:

$$
P_{\mathrm{safe}}
=
\frac{P_{cr}}{N}
$$

where:

* $P_{cr}$ = Critical buckling load
* $N$ = Factor of safety
* $P_{\mathrm{safe}}$ = Safe load

The design condition is therefore:

$$
P_{\mathrm{applied}}
<
P_{\mathrm{safe}}
$$

or:

$$
P_{\mathrm{applied}}
<
\frac{P_{cr}}{N}
$$

**Figure 17** presents the concept of safe load and the relationship between buckling load and factor of safety.

![Safe Buckling Load](figures/17_safe_buckling_load.png)

---

# 31. Failure Analysis Workflow

The overall failure-analysis procedure can be represented as:

```text
Define Component
       │
       ▼
Identify Loading
       │
       ▼
Determine Material
       │
       ▼
Identify Failure Mode
       │
       ├───────────────┐
       │               │
       ▼               ▼
Static Loading     Cyclic Loading
       │               │
       ▼               ▼
Failure Theory     Fatigue Analysis
       │               │
       ▼               ├── S-N
Stress Criterion      ├── ε-N
       │               └── Crack Growth
       ▼
Safety Evaluation
       │
       ▼
Buckling Check
       │
       ▼
Factor of Safety
       │
       ▼
Final Design Assessment
```

---

# 32. Relationship with FEM

Failure analysis is directly connected to FEM post-processing.

A typical FEM structural analysis provides:

* Stress
* Strain
* Displacement
* Principal stresses
* Equivalent von-Mises stress
* Reaction forces
* Contact pressure
* Natural frequencies
* Buckling modes

These results can then be evaluated using appropriate failure criteria.

For example:

### Static Ductile Failure

$$
\sigma_{vm}
<
\frac{S_y}{N}
$$

### Maximum Principal Stress

$$
\sigma_1
<
\frac{S_{\mathrm{allow}}}{}
$$

### Fatigue

$$
\sigma_a
\quad\text{and}\quad
\sigma_m
$$

are evaluated using an S–N curve or a mean-stress correction such as Goodman.

### Buckling

$$
P_{\mathrm{applied}}
<
\frac{P_{cr}}{N}
$$

This provides a link between **FEM simulation results and engineering design assessment**.

---

# 33. Failure Modes Covered

| Failure Mode      | Main Parameter               | Typical Criterion        |
| ----------------- | ---------------------------- | ------------------------ |
| Yielding          | Equivalent stress            | von-Mises                |
| Brittle fracture  | Principal stress             | Maximum principal stress |
| Shear yielding    | Maximum shear stress         | Tresca                   |
| Fatigue           | Stress amplitude             | S–N                      |
| Low-cycle fatigue | Strain amplitude             | ε–N                      |
| Crack propagation | Stress intensity             | Fracture mechanics       |
| Buckling          | Critical load                | Euler                    |
| Safe design       | Applied / allowable quantity | Factor of safety         |

---

# 34. Important Governing Equations

## Allowable Stress

$$
\sigma_{\mathrm{allow}}
=
\frac{S_y}{N}
$$

## von-Mises Stress

$$
\sigma_{vm}
=
\sqrt{
\frac{
(\sigma_1-\sigma_2)^2+
(\sigma_2-\sigma_3)^2+
(\sigma_3-\sigma_1)^2
}{2}
}
$$

## Maximum Shear Stress

$$
\tau_{\max}
=
\frac{\sigma_1-\sigma_3}{2}
$$

## Stress Range

$$
\sigma_r
=
\sigma_{\max}-\sigma_{\min}
$$

## Stress Amplitude

$$
\sigma_a
=
\frac{\sigma_{\max}-\sigma_{\min}}{2}
$$

## Mean Stress

$$
\sigma_m
=
\frac{\sigma_{\max}+\sigma_{\min}}{2}
$$

## Stress Ratio

$$
R
=
\frac{\sigma_{\min}}{\sigma_{\max}}
$$

## Crack Stress Intensity

$$
K_I
=
Y\sigma\sqrt{\pi a}
$$

## Euler Buckling Load

$$
P_{cr}
=
\frac{\pi^2EI}{(KL)^2}
$$

## Safe Buckling Load

$$
P_{\mathrm{safe}}
=
\frac{P_{cr}}{N}
$$

## Goodman Criterion

$$
\frac{1}{N}
=
\frac{\sigma_m}{S_{ut}}
+
\frac{\sigma_a}{S_e}
$$

## Soderberg Criterion

$$
\frac{1}{N}
=
\frac{\sigma_m}{S_y}
+
\frac{\sigma_a}{S_e}
$$

## Gerber Criterion

$$
\frac{1}{N}
=
\left(
\frac{\sigma_m}{S_{ut}}
\right)^2
+
\frac{\sigma_a}{S_e}
$$

---

# 35. Engineering Interpretation

The main engineering lesson from this study is that **failure cannot be evaluated using stress alone**.

Different loading conditions require different failure criteria.

For example:

* Static ductile loading → von-Mises/Tresca
* Brittle loading → principal stress criteria
* Repeated loading → fatigue analysis
* Existing cracks → fracture mechanics
* Slender compression members → buckling analysis

Therefore, the first step in a failure analysis is to correctly identify the dominant failure mechanism.

---

# 36. Design Considerations

A robust mechanical design should consider:

* Material strength
* Yield strength
* Ultimate strength
* Endurance strength
* Stress concentration
* Loading frequency
* Mean stress
* Surface finish
* Manufacturing defects
* Crack presence
* Component geometry
* Slenderness
* Boundary conditions
* Factor of safety

The selected criterion should be appropriate for the material and loading condition.

---

# 37. Applications

The concepts studied in this project are applicable to:

* Machine design
* Automotive components
* Aerospace structures
* Railway components
* Bridges
* Pressure vessels
* Shafts
* Connecting rods
* Crankshafts
* Gears
* Structural columns
* Aircraft components
* Rotating machinery
* Industrial equipment

---

# 38. FEM Simulation Applications

The failure-analysis concepts can be extended to FEM simulations involving:

### Static Structural Analysis

* Equivalent stress
* Principal stress
* Factor of safety
* Yielding assessment

### Fatigue Analysis

* Alternating stress
* Mean stress
* S–N curves
* Goodman correction
* Fatigue life

### Fracture Analysis

* Crack modeling
* Stress intensity factor
* J-integral
* Crack propagation

### Buckling Analysis

* Linear buckling
* Eigenvalue buckling
* Critical load factor
* Nonlinear post-buckling

---

# 39. Limitations

The equations presented in this study represent classical engineering failure models.

Actual component behavior can be influenced by:

* Material imperfections
* Residual stresses
* Manufacturing processes
* Surface roughness
* Corrosion
* Temperature
* Multiaxial fatigue
* Plastic deformation
* Contact effects
* Geometric nonlinearities
* Large deformation
* Crack interaction

Therefore, engineering failure assessment should use experimentally validated material data whenever possible.

---

# 40. Future Extensions

Future FEM projects can extend this study to:

* Static failure analysis using ANSYS Mechanical
* Nonlinear plasticity
* Tresca vs. von-Mises comparison
* Fatigue life prediction
* Goodman fatigue analysis
* Soderberg fatigue analysis
* Gerber fatigue analysis
* S–N curve implementation
* Crack modeling
* Stress intensity factor calculation
* J-integral evaluation
* Crack propagation simulation
* Linear buckling analysis
* Nonlinear buckling analysis
* Imperfection sensitivity
* Experimental validation

---

# 41. Project Structure

```text
08_Failure_Analysis/
│
├── README.md
│
├── theory/
│   ├── static_failure.md
│   ├── failure_theories.md
│   ├── fatigue.md
│   ├── fracture_mechanics.md
│   └── buckling.md
│
├── figures/
│   ├── 01_introduction_to_failure_analysis.png
│   ├── 02_ductile_material_failure.png
│   ├── 03_brittle_material_failure.png
│   ├── 04_theories_of_failure.png
│   ├── 05_completely_reversed_stress.png
│   ├── 06_fatigue_failure.png
│   ├── 07_fatigue_life.png
│   ├── 08_fracture_mechanics.png
│   ├── 09_fatigue_design_philosophies.png
│   ├── 10_life_estimation_methods.png
│   ├── 11_endurance_limit.png
│   ├── 12_sn_curve.png
│   ├── 13_endurance_strength.png
│   ├── 14_fatigue_stress_criteria.png
│   ├── 15_goodman_diagram.png
│   ├── 16_buckling_failure.png
│   └── 17_safe_buckling_load.png
│
├── ansys/
│   ├── static_failure/
│   ├── fatigue/
│   ├── fracture/
│   └── buckling/
│
└── results/
    ├── stress/
    ├── fatigue/
    ├── fracture/
    └── buckling/
```

---

# 42. Figure Reference

All 17 figures used in this study are organized as follows:

| Figure    | Topic                                    |
| --------- | ---------------------------------------- |
| Figure 1  | Introduction to Failure Analysis         |
| Figure 2  | Ductile Material Failure                 |
| Figure 3  | Brittle Material Failure                 |
| Figure 4  | Theories of Failure                      |
| Figure 5  | Completely Reversed / Cyclic Stress      |
| Figure 6  | Fatigue Failure                          |
| Figure 7  | Fatigue Life                             |
| Figure 8  | Fracture Mechanics and Crack Propagation |
| Figure 9  | Fatigue Design Philosophies              |
| Figure 10 | Fatigue Life Estimation Methods          |
| Figure 11 | Endurance Limit                          |
| Figure 12 | S–N Curve                                |
| Figure 13 | Endurance Strength                       |
| Figure 14 | Fatigue Failure Criteria                 |
| Figure 15 | Goodman, Soderberg and Gerber Diagram    |
| Figure 16 | Buckling Failure                         |
| Figure 17 | Safe Buckling Load                       |

---

# 43. Key Learnings

This project demonstrates understanding of:

* Static structural failure
* Ductile material yielding
* Brittle fracture
* Principal stress theory
* Principal strain theory
* Tresca criterion
* von-Mises criterion
* Factor of safety
* Cyclic stress
* Completely reversed stress
* Fatigue failure
* Fatigue life
* S–N curves
* Endurance limit
* Endurance strength
* Mean stress
* Stress amplitude
* Stress range
* Goodman criterion
* Soderberg criterion
* Gerber criterion
* Fracture mechanics
* Crack initiation
* Crack propagation
* Safe-life design
* Fail-safe design
* Damage-tolerant design
* Buckling failure
* Euler buckling
* Safe load estimation
* FEM failure assessment

---

# Conclusion

Failure analysis is an essential part of mechanical and structural engineering because a component must not only withstand the applied load but also maintain its integrity throughout its intended service life.

This study covers the major failure mechanisms encountered in engineering components, beginning with static yielding and fracture and extending to fatigue, fracture mechanics, and buckling.

For ductile materials, criteria such as **von-Mises and Tresca** can be used to assess yielding. For cyclic loading, fatigue methods such as the **S–N and ε–N approaches** provide methods for estimating fatigue life. The influence of mean stress can be evaluated using **Goodman, Soderberg, and Gerber criteria**.

For components containing cracks, **fracture mechanics** provides a framework for evaluating crack growth and critical conditions. For slender compression members, **Euler's buckling equation** provides an initial estimate of critical load.

These classical engineering concepts provide the theoretical foundation for more advanced **FEM-based failure, fatigue, fracture, and buckling simulations**.

---

# Author

**Musharraf Khan**

M.Sc. Computational Methods in Engineering
Otto von Guericke University Magdeburg

---

# Tools and Technologies

* ANSYS Mechanical
* ANSYS APDL
* MATLAB
* Python
* Finite Element Method (FEM)
* Structural Mechanics
* Failure Analysis
* Fatigue Analysis
* Fracture Mechanics
* Buckling Analysis

---

# References

The theoretical concepts and figures in this project are based on the provided failure-analysis lecture/reference material covering:

* Static failure
* Ductile and brittle material behavior
* Theories of failure
* Fatigue failure
* Fatigue life
* Fracture mechanics
* Fatigue design philosophies
* S–N curves
* Endurance limit
* Goodman diagram
* Buckling failure
* Safe load estimation

The provided material also references engineering resources including:

* Simulate More / MSC Software material
* Engineering Solutions fatigue and failure-analysis material
* Classical strength-of-materials and machine-design failure criteria

---

# License

This project is licensed under the MIT License.

```
```

