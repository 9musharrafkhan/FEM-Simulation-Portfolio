# 06_3_iii — Simply Supported Beam with Time-Varying Load

## Problem Description

A simply supported beam of length **500 mm** is subjected to a sequence of four equal point loads. Each load has a magnitude of **1000 N** and acts at a different location for **1 second** before moving to the next location.

The load moves progressively from the left side toward the right side of the beam:

| Step | Time Interval (s) | Load Location | Load Magnitude |
| ---: | ----------------: | ------------: | -------------: |
|    1 |               0–1 |    x = 100 mm |         1000 N |
|    2 |               1–2 |    x = 200 mm |         1000 N |
|    3 |               2–3 |    x = 300 mm |         1000 N |
|    4 |               3–4 |    x = 400 mm |         1000 N |

At any given time, only one point load is active.

---

## Geometry

* **Beam length:** 500 mm
* **Cross-section:** 25 mm × 25 mm
* **Support condition:** Simply supported at both ends
* **Number of loading locations:** 4
* **Spacing between load locations:** 100 mm

![Beam Geometry](geometry.jpg)

---

## Material Properties

The beam is modeled using **Structural Steel** with the following properties:

| Property               |   Value |
| ---------------------- | ------: |
| Young's Modulus, $E$   | 200 GPa |
| Poisson's Ratio, $\nu$ |     0.3 |
| Load magnitude, $P$    |  1000 N |

---

## Loading Condition

The load is time-dependent and moves from one location to another.

For each loading step $i$, the force can be represented as

$$
F_i(t)=
\begin{cases}
1000\ \text{N}, & t_i \leq t < t_{i+1} \
0, & \text{otherwise}
\end{cases}
$$

The complete loading condition can therefore be written as

$$
F(t)=F_1(t)+F_2(t)+F_3(t)+F_4(t)
$$

where

$$
F_1(t): 0 \leq t < 1
$$

$$
F_2(t): 1 \leq t < 2
$$

$$
F_3(t): 2 \leq t < 3
$$

$$
F_4(t): 3 \leq t \leq 4
$$

The corresponding load locations are:

$$
x_1=100\ \text{mm},\qquad
x_2=200\ \text{mm},\qquad
x_3=300\ \text{mm},\qquad
x_4=400\ \text{mm}
$$

Thus, the load effectively **moves along the beam as a function of time**.

---

## Analysis Setup

A **Transient Structural Analysis** was performed in ANSYS Mechanical.

### Analysis Settings

* **Number of Steps:** 4
* **Total Analysis Time:** 4 s
* **Step Duration:** 1 s
* **Auto Time Stepping:** On
* **Initial Time Step:** 0.1 s
* **Minimum Time Step:** 0.1 s
* **Maximum Time Step:** 0.1 s
* **Transient Integration:** On

![Analysis Settings](analysis_setting\(1\).PNG)

---

## Boundary Conditions

The beam is supported at both ends to represent a simply supported condition.

![Support Conditions](fixed_support\(3\).PNG)

---

## Application of Time-Varying Loads

### Load — Step 1

A **1000 N downward force** is applied at:

$$
x=100\ \text{mm}
$$

during the first time interval:

$$
0\leq t<1\ \text{s}
$$

![Force 1](force1\(1\).PNG)

### Load — Step 2

The 1000 N load moves to:

$$
x=200\ \text{mm}
$$

during:

$$
1\leq t<2\ \text{s}
$$

![Force 2](force2\(1\).PNG)

### Load — Step 3

The load moves to:

$$
x=300\ \text{mm}
$$

during:

$$
2\leq t<3\ \text{s}
$$

![Force 3](force3.PNG)

### Load — Step 4

The load finally moves to:

$$
x=400\ \text{mm}
$$

during:

$$
3\leq t\leq4\ \text{s}
$$

![Force 4](force4\(1\).PNG)

---

## Mesh

The beam is discretized using a uniform line-element mesh along its length.

![Mesh](mesh_size\(4\).PNG)

The mesh provides sufficient spatial discretization to capture the bending response as the load moves along the beam.

---

# Modal Analysis

A modal analysis was also performed to determine the natural frequencies of the beam.

The first six extracted modal frequencies were:

| Mode | Frequency (Hz) |
| ---: | -------------: |
|    1 |         510.17 |
|    2 |         510.17 |
|    3 |         1376.8 |
|    4 |         1376.8 |
|    5 |         2627.3 |
|    6 |         2627.3 |

The repeated frequencies arise from the modal characteristics of the modeled beam system.

![Modal Deformation](modal_z_diection_deformation.PNG)

The first modal frequency is approximately:

$$
f_1=510.17\ \text{Hz}
$$

The corresponding angular natural frequency is

$$
\omega_1=2\pi f_1
$$

which gives approximately

$$
\omega_1\approx3205\ \text{rad/s}
$$

---

# Transient Structural Results

The transient analysis was used to determine the structural response as the load moved from $x=100$ mm to $x=400$ mm.

The primary quantities evaluated were:

* Directional deformation
* Direct stress
* Maximum combined stress
* Minimum combined stress

---

## Directional Deformation

The deformation in the global **Z-direction** was evaluated throughout the 4-second simulation.

The maximum downward deformation shown in the transient result is approximately:

$$
u_{z,\min}=-0.09411\ \text{mm}
$$

The maximum deformation occurs while the load is acting on the beam and varies as the load moves between the four positions.

![Transient Directional Deformation](z_directional_transient_deformation.PNG)

The deformation follows the expected bending response of a simply supported beam, with the largest downward displacement occurring near the region of the applied load.

---

## Direct Stress

The transient direct stress response was also evaluated.

The ANSYS result shows a maximum direct stress of approximately:

$$
\sigma_{\text{direct,max}}\approx0.003933\ \text{MPa}
$$

at the displayed final time step.

![Direct Stress](direct_stress.PNG)

The stress distribution changes with time as the position of the applied load changes.

---

## Maximum Combined Stress

The maximum combined stress obtained during the transient analysis is approximately:

$$
\sigma_{\text{combined,max}}=24.509\ \text{MPa}
$$

![Maximum Combined Stress](maximum_transient_combined_stress.PNG)

The maximum value occurs near the highly stressed region of the beam associated with the moving load.

---

## Minimum Combined Stress

The minimum combined stress obtained from the transient solution is approximately:

$$
\sigma_{\text{combined,min}}=-24.502\ \text{MPa}
$$

![Minimum Combined Stress](minimum_transient_combined_stress.PNG)

The negative value represents the opposite stress state generated by bending on the other side of the beam cross-section.

---

# Theoretical Bending Stress

For comparison, the bending stress can be estimated from

$$
\sigma=\frac{Mc}{I}
$$

where:

* $M$ = bending moment
* $c$ = distance from the neutral axis
* $I$ = second moment of area.

For the rectangular cross-section,

$$
I=\frac{bh^3}{12}
$$

With

$$
b=h=25\ \text{mm}
$$

the second moment of area is

$$
I=\frac{25(25)^3}{12}
\approx32552.1\ \text{mm}^4
$$

and

$$
c=\frac{25}{2}=12.5\ \text{mm}
$$

For a point load $P$ acting at a distance $a$ from the left support and $b=L-a$ from the right support, the maximum bending moment is

$$
M_{\max}=\frac{Pab}{L}
$$

The theoretical bending stress can therefore be estimated using

$$
\sigma_{\max}=
\frac{Pab}{L}\frac{c}{I}
$$

This expression provides a useful reference for evaluating the ANSYS transient stress results at each load position.

---

# Load Movement and Structural Response

The load progression can be summarized as:

```text
Time:       0       1       2       3       4 s
            |-------|-------|-------|-------|
Load:         ↓       ↓       ↓       ↓
Position:   100     200     300     400 mm
```

The transient analysis captures the change in structural response as the load moves along the beam.

The load positions are symmetric about the beam center:

* 100 mm and 400 mm
* 200 mm and 300 mm

Therefore, the structural response at corresponding symmetric positions can be used to evaluate the symmetry of the numerical solution.

---

# Results Summary

| Result                          |  ANSYS Value |
| ------------------------------- | -----------: |
| Beam Length                     |       500 mm |
| Cross-section                   |   25 × 25 mm |
| Load Magnitude                  |       1000 N |
| Total Analysis Time             |          4 s |
| Number of Load Steps            |            4 |
| First Natural Frequency         |    510.17 Hz |
| Maximum Z-direction Deformation |   0.09411 mm |
| Maximum Combined Stress         |   24.509 MPa |
| Minimum Combined Stress         |  -24.502 MPa |
| Maximum Direct Stress shown     | 0.003933 MPa |

---

# Conclusion

The transient structural analysis successfully models a **1000 N point load moving sequentially along a simply supported 500 mm beam**.

The load is active at four locations, with each position maintained for one second. The transient formulation allows the deformation and stress response to be evaluated as a function of time rather than considering only a single static load position.

The main results obtained from ANSYS are:

* The first natural frequency is approximately **510.17 Hz**.
* The maximum observed Z-direction deformation is approximately **0.09411 mm**.
* The maximum combined stress is approximately **24.509 MPa**.
* The minimum combined stress is approximately **−24.502 MPa**.
* The stress and deformation distributions change as the point load moves from **100 mm to 400 mm** along the beam.

This project demonstrates the application of **transient finite element analysis to a moving/time-varying load problem**, including load definition, transient time stepping, modal characterization, and evaluation of the resulting structural response.

---

# Author
**Musharraf Khan**

M.Sc. Computational Methods in Engineering Otto von Guericke University Magdeburg

---

License
This project is licensed under the MIT License.

---

