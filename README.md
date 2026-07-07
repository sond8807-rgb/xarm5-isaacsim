# xarm5-isaacsim
Documentation for the setup of the UFACTORY xArm5 robotic arm in Isaac Sim.  

-To import the xarm5 into Isaac, see xacro_to_urdf.sh


-There will be instructions on how to setup various configurations inside the Isaac Sim environment such as:

**1. Controlling the Arm With a Game Controller** (gamepad_vel_control.md)

**2. ROS2 integration** (ros2_joint_states.md)

**3. ROS2 Object detection with YOLO (v8)**
Enter the following in a terminal to launch yolo (set the subcriber topic as /rgb):  
ros2 launch yolo_bringup yolo.launch.py input_image_topic:=/rgb

Enter the yolo_ros venv:
source venvs/yolo_ros/bin/activate




**Eventually. Pick and Place Reinforcement Learning with Isaac Lab**
