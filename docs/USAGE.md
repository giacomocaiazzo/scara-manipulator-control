# Usage

Use MATLAB R2025b or later with Simulink.

1. Set the MATLAB current folder to the repository root and open [SCARA_Study.mlx](../SCARA_Study.mlx).
2. Run the setup, SCARA parameters, and trajectory sections first. They add the project folders to the MATLAB path and create the reference signals used by the models.
3. Run the CLIK sections to compare the [inverse](../kinematics/CLIK_inversa.slx), [pseudoinverse](../kinematics/CLIK_pinversa.slx), [transpose](../kinematics/CLIK_trasposta.slx), and [second-order](../kinematics/CLIK_2_order.slx) methods.
4. Use the second-order CLIK results to run the [robust](../control/controllo_robusto.slx) and [adaptive](../control/Controllo_adattativo.slx) controllers. The [operational-space controller](../control/ControllOPspace.slx) tracks the operational-space reference directly.

For a full run, use **Run** in the Live Editor. Keep each simulation and its following plot sections together, since the script reuses the simulation output variable.

See the [technical report](SCARA_Technical_Report.pdf) for the robot model and controller derivations.
