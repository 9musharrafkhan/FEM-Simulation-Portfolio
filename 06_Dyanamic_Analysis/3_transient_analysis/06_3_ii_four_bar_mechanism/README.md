# 06_3_ii — Transient Structural Analysis of Four-Bar Mechanism

## Problem Statement

A four-bar mechanism is analyzed using **ANSYS Mechanical 2026 R1 Student** to study its transient structural response during one complete revolution of the input link.

The mechanism consists of:

- Ground link
- Input link
- Coupler link
- Output link

The input link is rotated through **360°**, and the transient response of the mechanism is evaluated throughout the simulation.

### Input

| Parameter | Value |
|---|---:|
| Material | Structural Steel |
| Young's Modulus | 200 GPa |
| Poisson's Ratio | 0.3 |
| Density | 7850 kg/m³ |
| Tensile Yield Strength | 250 MPa |
| Factor of Safety | 2 |
| Allowable Stress | 125 MPa |
| Input Rotation | 360° |
| Total Simulation Time | 45 s |

The allowable stress is calculated as:

$$
\sigma_{allow}=\frac{\sigma_y}{FOS}
$$

$$
\sigma_{allow}=\frac{250}{2}=125\ MPa
$$

---

## Objective

The objectives of the transient analysis are:

1. Model the four-bar mechanism in ANSYS.
2. Define the revolute joints between the links.
3. Apply a prescribed rotational motion to the input link.
4. Perform transient structural analysis for one complete revolution.
5. Determine the time-dependent structural response.
6. Calculate equivalent stress and elastic strain.
7. Determine total deformation, velocity and acceleration.
8. Compare the calculated stress with the allowable stress.

---

## Four-Bar Mechanism

The four-bar mechanism consists of four interconnected links:

```text
Ground Link
     │
     ├── Input Link
     │       │
     │       └── Coupler Link
     │                    │
     │                    └── Output Link
     │
     └───────────────────────────────
````

The input link is connected to the ground through a revolute joint and is prescribed a rotation of 360°.

---

## Material Properties

Structural steel is used for all links.

| Property                |      Value |
| ----------------------- | ---------: |
| Young's Modulus, $E$    |    200 GPa |
| Poisson's Ratio, $\nu$  |        0.3 |
| Density, $\rho$         | 7850 kg/m³ |
| Tensile Yield Strength  |    250 MPa |
| Factor of Safety        |          2 |
| Design/Allowable Stress |    125 MPa |

---

## Connections

Four revolute joints are used to define the kinematic connections.

### Ground to Input

The input link is connected to the ground using a revolute joint.

![Ground to Input](Revolute_Ground_To_Input.PNG)

### Input to Coupler

The input link and coupler are connected using a revolute joint.

![Input to Coupler](Revolute_Input_To_Coupler.PNG)

### Coupler to Output

The coupler and output link are connected using a revolute joint.

![Coupler to Output](Revolute_Coupler_To_Output.PNG)

### Ground to Output

The output link is connected to the ground using a revolute joint.

![Ground to Output](Revolute_Ground_To_Output.PNG)

---

## Input Rotation

The input link is subjected to a prescribed rotational motion.

| Setting        | Value           |
| -------------- | --------------- |
| Joint          | Ground to Input |
| DOF            | Rotation Z      |
| Type           | Rotation        |
| Magnitude      | Tabular Data    |
| Final Rotation | 360°            |

![Input Joint Rotation](input_joint_rotation.PNG)

The input rotation is defined as a function of time:

$$
\theta=\theta(t)
$$

with the final condition:

$$
\theta(45)=360^\circ
$$

The corresponding angular velocity and angular acceleration are:

$$
\omega(t)=\frac{d\theta}{dt}
$$

$$
\alpha(t)=\frac{d^2\theta}{dt^2}
$$

---

## Transient Analysis Settings

The transient structural analysis was performed using the following settings:

| Parameter                      |              Value |
| ------------------------------ | -----------------: |
| Number of Steps                |                 45 |
| Step End Time                  |               45 s |
| Automatic Time Stepping        |                 On |
| Define By                      |               Time |
| Initial Time Step              |              0.5 s |
| Minimum Time Step              |              0.5 s |
| Maximum Time Step              |              0.5 s |
| Maximum Iterations per Substep | Program Controlled |

![Analysis Settings](analysis_setting.PNG)

The total simulation time is:

$$
t_{total}=45\ s
$$

---

## Mesh

The four-bar mechanism was discretized using finite elements before performing the transient analysis.

![Mesh](mesh_size\(3\).PNG)

The mesh was generated while maintaining the required connections at the revolute joints.

---

## Joint Probe

A joint probe was used to monitor the transient response of the mechanism.

![Joint Probe](joint_probe.PNG)

The probe results were evaluated over the complete 45-second simulation.

---

# Governing Equation

The general finite-element equation for transient structural analysis is:

$$
[M]{\ddot{u}}+[C]{\dot{u}}+[K]{u}={F(t)}
$$

where:

* $[M]$ = mass matrix
* $[C]$ = damping matrix
* $[K]$ = stiffness matrix
* ${u}$ = displacement vector
* ${\dot{u}}$ = velocity vector
* ${\ddot{u}}$ = acceleration vector
* ${F(t)}$ = time-dependent force vector

For the four-bar mechanism, the prescribed rotational motion at the input joint produces the transient motion of the connected links.

---

# Results

## Equivalent Stress

The maximum equivalent von-Mises stress obtained from the transient analysis is:

$$
\boxed{\sigma_{vm,max}=0.0003662\ MPa}
$$

Minimum reported stress:

$$
\sigma_{vm,min}=8.1438\times10^{-7}\ MPa
$$

![Equivalent Stress](transient_equivalent_stress.PNG)

### Stress Check

The allowable stress is:

$$
\sigma_{allow}=125\ MPa
$$

Therefore:

$$
\sigma_{vm,max}<\sigma_{allow}
$$

The reported maximum equivalent stress is significantly lower than the allowable stress.

---

## Equivalent Elastic Strain

The maximum equivalent elastic strain is:

$$
\boxed{\epsilon_{eq,max}=1.831\times10^{-9}}
$$

Minimum reported strain:

$$
\epsilon_{eq,min}=8.5536\times10^{-12}
$$

![Equivalent Elastic Strain](transient_equivalent_elastic_strain.PNG)

---

## Total Deformation

The maximum total deformation reported by ANSYS is:

$$
\boxed{u_{max}=439.78\ mm}
$$

Minimum reported deformation:

$$
u_{min}=1.4782\times10^{-9}\ mm
$$

![Total Deformation](transient_total_deformation.PNG)

The deformation represents the overall motion of the mechanism and should therefore be interpreted together with the prescribed joint motion.

---

## Total Velocity

The maximum total velocity reported is:

$$
\boxed{v_{max}=40.472\ mm/s}
$$

Minimum reported velocity:

$$
v_{min}=1.3481\times10^{-6}\ mm/s
$$

![Total Velocity](transient_total_velocity.PNG)

The velocity changes continuously as the input link rotates and transfers motion through the coupler and output links.

---

## Directional Velocity

The maximum reported directional velocity is:

$$
\boxed{v_{x,max}=5.3099\times10^{-6}\ mm/s}
$$

Minimum reported value:

$$
v_{x,min}=-5.0092\times10^{-7}\ mm/s
$$

![Directional Velocity](transient_directional_velocity.PNG)

---

## Total Acceleration

The maximum total acceleration obtained is:

$$
\boxed{a_{max}=3.9755\ mm/s^2}
$$

Minimum reported acceleration:

$$
a_{min}=1.0611\times10^{-7}\ mm/s^2
$$

![Total Acceleration](transient_total_acceleration.PNG)

---

# Result Summary

| Result                    |         Maximum Value | Unit  |
| ------------------------- | --------------------: | ----- |
| Equivalent Stress         |             0.0003662 | MPa   |
| Equivalent Elastic Strain |  $1.831\times10^{-9}$ | mm/mm |
| Total Deformation         |                439.78 | mm    |
| Total Velocity            |                40.472 | mm/s  |
| Directional Velocity      | $5.3099\times10^{-6}$ | mm/s  |
| Total Acceleration        |                3.9755 | mm/s² |

---

# Safety Evaluation

The yield strength of the structural steel is:

$$
\sigma_y=250\ MPa
$$

For a factor of safety of 2:

$$
\sigma_{allow}=125\ MPa
$$

The maximum calculated equivalent stress is:

$$
\sigma_{vm,max}=0.0003662\ MPa
$$

The ratio of calculated stress to allowable stress is:

$$
\frac{\sigma_{vm,max}}{\sigma_{allow}}
\approx2.93\times10^{-6}
$$

Therefore, based on the reported ANSYS result, the calculated equivalent stress is well below the allowable stress.

---

# Transient Response

The transient results demonstrate that the response of the mechanism varies with time.

The main quantities are:

$$
u=u(t)
$$

$$
v(t)=\frac{du}{dt}
$$

$$
a(t)=\frac{dv}{dt}
$$

The input rotation produces a corresponding time-dependent motion of the coupler and output links.

The transient plots can be used to observe the variation of velocity, acceleration, deformation, strain and stress throughout the 45-second simulation.

---

# Animation

The transient deformation animation can be used to visualize the motion of the four-bar mechanism during the complete input-link rotation.

```text
animations/
└── total_deformation.avi
```

---

# ANSYS Model Structure

```text
Model
│
├── Geometry
├── Materials
├── Coordinate Systems
├── Connections
│   ├── Revolute - Ground To Input
│   ├── Revolute - Input To Coupler
│   ├── Revolute - Coupler To Output
│   └── Revolute - Ground To Output
│
├── Mesh
│
└── Transient Structural
    ├── Initial Conditions
    ├── Analysis Settings
    ├── Joint - Rotation
    │
    └── Solution
        ├── Joint Probe
        ├── Equivalent Stress
        ├── Equivalent Elastic Strain
        ├── Total Deformation
        ├── Total Velocity
        ├── Directional Velocity
        └── Total Acceleration
```

---

# Repository Structure

```text
06_3_ii_four_bar_mechanism/
│
├── README.md
│
├── geometry/
│   └── geometry(1).jpeg
│
├── images/
│   ├── analysis_setting.PNG
│   ├── input_joint_rotation.PNG
│   ├── Revolute_Coupler_To_Output.PNG
│   ├── Revolute_Ground_To_Input.PNG
│   ├── Revolute_Ground_To_Output.PNG
│   ├── Revolute_Input_To_Coupler.PNG
│   ├── mesh_size(3).PNG
│   ├── joint_probe.PNG
│   ├── transient_directional_velocity.PNG
│   ├── transient_equivalent_elastic_strain.PNG
│   ├── transient_equivalent_stress.PNG
│   ├── transient_total_acceleration.PNG
│   ├── transient_total_deformation.PNG
│   └── transient_total_velocity.PNG
│
└── animations/
    └── total_deformation.avi
```

---

# Conclusion

A transient structural analysis of a four-bar mechanism was successfully performed using **ANSYS Mechanical 2026 R1 Student**.

The input link was prescribed a **360° rotation over 45 seconds**, and revolute joints were used to define the connections between the four links.

The maximum reported equivalent stress was:

$$
\boxed{0.0003662\ MPa}
$$

which is considerably lower than the allowable stress:

$$
\boxed{125\ MPa}
$$

The analysis also provided the transient response in terms of:

* Equivalent stress
* Equivalent elastic strain
* Total deformation
* Total velocity
* Directional velocity
* Total acceleration

The results provide a numerical representation of the structural and kinematic response of the four-bar mechanism during one complete input-link revolution.

```
```

# Author

**Musharraf Khan**

M.Sc. Computational Methods in Engineering
Otto von Guericke University Magdeburg

# License

This project is licensed under the MIT License.
