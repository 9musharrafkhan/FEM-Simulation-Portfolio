# 06_Dynamic_Analysis_using_ANSYS

# Dynamic Analysis using ANSYS Mechanical

---

# Overview

This project demonstrates the dynamic behavior of engineering structures using **ANSYS Mechanical**. Unlike static analysis, dynamic analysis considers inertia and damping effects when loads vary with time.

Dynamic analysis is essential for components subjected to vibration, impact, rotating machinery, earthquakes, and cyclic loading. It helps engineers predict resonance, natural frequencies, deformation patterns, and the structural response under time-dependent loading.

This project covers the three primary dynamic analyses available in ANSYS:

- Modal Analysis
- Harmonic (Frequency Response) Analysis
- Transient Structural Analysis

---

# Objectives

The objectives of this project are to:

- Determine natural frequencies of structures.
- Identify vibration mode shapes.
- Predict resonance conditions.
- Evaluate structural response under harmonic loading.
- Analyze time-dependent responses under arbitrary loading.
- Improve structural reliability and fatigue life.

---

# Fundamentals of Vibration

## Frequency (f)

Frequency is the number of complete oscillations occurring per second.

```math
f=\frac{1}{T}
```

Where

- \(f\) = Frequency (Hz)
- \(T\) = Time period (s)

---

## Angular Frequency

```math
\omega=2\pi f
```

Where

- \(\omega\) = Angular frequency (rad/s)

---

## Amplitude

Amplitude is the maximum displacement from the equilibrium position.

---

## Damping

Damping is the mechanism by which vibration energy is dissipated.

The damping force is

```math
F_d=c\dot{x}
```

Where

- \(c\) = Damping coefficient
- \(\dot{x}\) = Velocity

---

## Free Vibration

Occurs without any external excitation.

The total mechanical energy remains constant for an undamped system.

---

## Forced Vibration

Occurs when an external force continuously excites the structure.

Example:

```math
F(t)=F_0\sin(\omega t)
```

---

## Damped Vibration

Oscillation gradually decreases due to energy dissipation.

---

## Resonance

Resonance occurs when

```math
\omega=\omega_n
```

or

```math
f=f_n
```

At resonance, vibration amplitude becomes maximum and may cause structural failure.

---

# Equation of Motion

The governing equation for a linear dynamic system is

```math
M\ddot{x}+C\dot{x}+Kx=F(t)
```

Where

- \(M\) = Mass matrix
- \(C\) = Damping matrix
- \(K\) = Stiffness matrix
- \(x\) = Displacement
- \(\dot{x}\) = Velocity
- \(\ddot{x}\) = Acceleration
- \(F(t)\) = External force

This equation forms the basis of all dynamic analyses.

---

# Types of Dynamic Analysis

ANSYS provides three primary dynamic analysis methods.

---

# 1. Modal Analysis

## Purpose

Modal analysis determines:

- Natural frequencies
- Mode shapes
- Dynamic characteristics

No external load is required.

---

## Governing Equation

For free undamped vibration,

```math
M\ddot{x}+Kx=0
```

Assume harmonic motion

```math
x=\phi e^{i\omega t}
```

Substituting,

```math
(K-\omega^2M)\phi=0
```

This represents the eigenvalue problem.

---

## Outputs

- Natural Frequencies
- Mode Shapes
- Participation Factors
- Effective Mass

---

## Significance

Modal analysis helps engineers:

- Avoid resonance
- Improve structural stiffness
- Modify geometry
- Change material selection
- Optimize structural design

---

# 2. Harmonic (Frequency Response) Analysis

## Purpose

Determines steady-state structural response under sinusoidal loading.

Suitable for:

- Rotating machinery
- Motors
- Pumps
- Compressors
- Turbines

---

## Harmonic Load

```math
F(t)=F_0\sin(\omega t)
```

---

## Governing Equation

```math
M\ddot{x}+C\dot{x}+Kx=F_0\sin(\omega t)
```

---

## Frequency Response Function

The displacement response is

```math
X(\omega)=\frac{F_0}{K-M\omega^2+iC\omega}
```

---

## Outputs

- Amplitude
- Phase Angle
- Stress vs Frequency
- Deformation vs Frequency

---

## Applications

- Engine components
- Fans
- Pumps
- Rotating shafts
- Electric motors

---

# 3. Transient Structural Analysis

## Purpose

Transient analysis calculates structural response when loads vary with time.

Suitable for:

- Impact loading
- Shock loading
- Earthquakes
- Drop tests
- Explosions
- Switching loads

---

## Governing Equation

```math
M\ddot{x}+C\dot{x}+Kx=F(t)
```

where

```math
F(t)
```

may be any arbitrary function of time.

---

## Typical Load Examples

Step Load

```math
F(t)=F_0
```

Pulse Load

```math
F(t)=
\begin{cases}
F_0,&0<t<T\\
0,&t>T
\end{cases}
```

Sinusoidal Load

```math
F(t)=F_0\sin(\omega t)
```

---

## Outputs

- Time-history deformation
- Velocity
- Acceleration
- Stress history
- Strain history

---

# Comparison of Dynamic Analyses

| Analysis | External Load | Main Output | Time Dependent |
|-----------|---------------|-------------|----------------|
| Modal | No | Natural Frequency, Mode Shape | No |
| Harmonic Response | Sinusoidal | Frequency Response | No |
| Transient Structural | Arbitrary | Time History Response | Yes |

---

# Why Dynamic Analysis is Important

Dynamic analysis helps engineers to:

- Prevent resonance.
- Predict vibration behavior.
- Improve structural durability.
- Reduce fatigue failure.
- Increase service life.
- Design quieter products.
- Validate rotating machinery.
- Improve safety.

---

# Applications

Dynamic analysis is widely used in:

- Automotive engineering
- Aerospace structures
- Wind turbines
- Railway vehicles
- Bridges
- Buildings
- Industrial machinery
- Robotics
- Marine structures
- Mechanical linkages

---

# Typical ANSYS Workflow

1. Import/Create Geometry
2. Assign Material Properties
3. Generate Mesh
4. Apply Boundary Conditions
5. Select Dynamic Analysis Type
6. Define Analysis Settings
7. Solve
8. Post-process Results
9. Interpret Dynamic Response

---

# Repository Structure

```text
06_Dynamic_Analysis/
│
├── README.md
│
├── ansys/
│   ├── modal_analysis/
│   │   ├── modal_project.wbpj
│   │   ├── mode_shapes.png
│   │   ├── natural_frequencies.csv
│   │   └── modal_summary.md
│   │
│   ├── harmonic_analysis/
│   │   ├── harmonic_project.wbpj
│   │   ├── frequency_response.png
│   │   ├── amplitude_vs_frequency.png
│   │   └── harmonic_summary.md
│   │
│   ├── transient_analysis/
│   │   ├── transient_project.wbpj
│   │   ├── displacement_time_history.png
│   │   ├── stress_time_history.png
│   │   └── transient_summary.md
│   │
│   └── material/
│       └── material_properties.txt
│
├── report/
│   └── dynamic_analysis_report.pdf
│
└── figures/
    ├── mode_shapes.png
    ├── resonance.png
    ├── harmonic_response.png
    ├── transient_response.png
    └── frequency_response_curve.png
```

---

# Key Learnings

This project demonstrates:

- Fundamentals of structural vibration
- Equation of motion
- Free and forced vibration
- Damping effects
- Resonance
- Modal analysis
- Harmonic response analysis
- Transient structural analysis
- Dynamic behavior prediction using ANSYS

---

# Future Extensions

Future work may include:

- Random vibration analysis
- Response spectrum analysis
- Rotor dynamics
- Nonlinear transient dynamics
- Explicit dynamics
- Earthquake simulation
- Fatigue life prediction under cyclic loading

---

# Author

**Musharraf Khan**

M.Sc. Computational Methods in Engineering  
Otto von Guericke University Magdeburg

---

# Tools Used

- ANSYS Mechanical
- Finite Element Method (FEM)
- Structural Dynamics
- Modal Analysis
- Harmonic Response Analysis
- Transient Structural Analysis

---

# License

This project is licensed under the MIT License.
