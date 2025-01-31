bazel build -c dbg repo_projects/pProjectVirtualEcu/b_calcFloatingPoint/pProjectVirtualEcu_b_calcFloatingPoint
bazel-bin/repo_projects/pProjectVirtualEcu/b_calcFloatingPoint/pProjectVirtualEcu_b_calcFloatingPoint -i log_pProjectVirtualEcu_DigitalTwinMotorPMSM_SampleInput.csv

bazel build -c dbg repo_projects/pProjectVirtualEcu/main_LATEST/pProjectVirtualEcu_main_LATEST
bazel-bin/repo_projects/pProjectVirtualEcu/main_LATEST/pProjectVirtualEcu_main_LATEST -i log_pProjectVirtualEcu_DigitalTwinMotorPMSM_SampleInput.csv

TBD:
1. Fine-tune fixedpoint.hpp(scale_x/scale_y/scale_output) (or worst-case fixed point types) to reduce error
2. More local structures from headers to source files
3. Log function to take structures
4. Motor control algorithm
5. Log files names to reach from command-line arg to end-points
