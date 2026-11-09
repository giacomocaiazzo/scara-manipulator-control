# SCARA Manipulator Control

A MATLAB and Simulink study of a four-axis SCARA manipulator. It covers kinematics and manipulability, operational-space trajectory planning, four closed-loop inverse kinematics (CLIK) methods, and three motion controllers.

| File or folder | Contents |
| --- | --- |
| [SCARA_Study.mlx](SCARA_Study.mlx) | Main Live Script with the analysis, simulations, and plots. |
| [kinematics](kinematics) | Manipulability and inverse kinematics utilities, 3D visualization, and the four CLIK models. |
| [trajectory](trajectory) | Trapezoidal timing for straight and circular path segments. |
| [control](control) | Robust, adaptive, and operational-space inverse dynamics controllers. |
| [Technical report](docs/SCARA_Technical_Report.pdf) | Derivations and simulation results. |

Open the Live Script in MATLAB and run its sections in order. See the [usage guide](docs/USAGE.md) for requirements and the model sequence.

Course project by Giacomo Caiazzo and Marco Bartone, Università degli Studi di Napoli Federico II.
