# Usage

Use MATLAB R2025b or later with Simulink.

1. Set the MATLAB current folder to the repository root and open [SCARA_Study.mlx](../SCARA_Study.mlx).
2. Run the setup, SCARA parameters, and trajectory sections first. They add the project folders to the MATLAB path and create the reference signals used by the models.
3. Run the CLIK sections to compare the [inverse](../kinematics/clik_jacobian_inverse.slx), [pseudoinverse](../kinematics/clik_jacobian_pseudoinverse.slx), [transpose](../kinematics/clik_jacobian_transpose.slx), and [second-order](../kinematics/clik_second_order.slx) methods.
4. Use the second-order CLIK results to run the [robust](../control/robust_joint_space_control.slx) and [adaptive](../control/adaptive_joint_space_control.slx) controllers. The [operational-space controller](../control/operational_space_inverse_dynamics.slx) tracks the operational-space reference directly.

For a full run, use **Run** in the Live Editor. Keep each simulation and its following plot sections together, since the script reuses the simulation output variable.

See the [technical report](SCARA_Technical_Report.pdf) for the robot model and controller derivations.
