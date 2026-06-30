"1. Install the xarm5 repo from the following git: https://github.com/xArm-Developer/xarm_ros2/tree/jazzy"

"2. Run the following command in a terminal (make sure to source ros2 before running) to turn it into an urdf"

ros2 run xacro xacro /xarm_ros2/xarm_description/urdf/xarm_device.urdf.xacro \
  dof:=5 add_gripper:=true \
  -o /root/xarm5_gripper.urdf

"3. Fix the mesh paths. (you may need to change the destination to the xarm_description folder the after the '|' depending on where you installed it)"

sed -i 's|package://xarm_description|package://xarmros2/xarm_description|g' ~/xarm5_gripper.urdf

"4. Open Isaac Sim and import the URDF of the XARM5 into it."
