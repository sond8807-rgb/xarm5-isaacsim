"The following are the instructions on how to import the URDF of the XARM5 into Isaac Sim."


"1. Install the xarm5 repo from the following git: https://github.com/xArm-Developer/xarm_ros2/tree/jazzy"

"2. Run the following command in a terminal (make sure to source ros2 before running) to turn it into an urdf file called xarm5_gripper.urdf
If you do not want the gripper, change 'add_gripper:=true' to 'add_gripper:=false' "

ros2 run xacro xacro /xarm_ros2/xarm_description/urdf/xarm_device.urdf.xacro \
  dof:=5 add_gripper:=true \
  -o /root/xarm5_gripper.urdf

"3. Fix the mesh paths by editing the xarm5.urdf file and redirecting it to the meshes. (you may need to change the destination to the xarm_description folder 'package://xarmros2/xarm_description' depending on where you installed it)"

sed -i 's|package://xarm_description|package://xarmros2/xarm_description|g' ~/xarm5_gripper.urdf

"4. Open Isaac Sim. Then click: File (top left corner of screen) -> Import -> xarm5_gripper.urdf
If Isaac crashes the moment you click on the file, this means that the xacro was not correctly created and is most likely empty. Try running the xacro command (2.) again.

If the app does not crash, select Create in Stage and then Import (I am not certain about the Joint Configuration, this will require more testing to find out the best values).

If there is no robot on the scene, this means that the path to the meshes was not correctly set up in the xarm5_gripper.urdf file. Modify the command of step 3. to redirect it to the actual location of the meshes."


"Once you see the robot on the scene, you're done!"
