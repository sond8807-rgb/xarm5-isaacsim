"1. Install the xarm5 repo from the following git: https://github.com/xArm-Developer/xarm_ros2/tree/jazzy"

"2. Run the following command in a terminal (make sure to source ros2 before running) to turn it into an urdf"

ros2 run xacro xacro /root/dev_ws/src/xarm_ros2/xarm_description/urdf/xarm_device.urdf.xacro \
  dof:=5 add_gripper:=true \
  -o /root/xarm5_gripper.urdf

