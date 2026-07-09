# xarm5-isaacsim
Documentation for the setup of the UFACTORY xArm5 robotic arm in Isaac Sim version 5.1.0.  

_To import the xarm5 into Isaac, see xacro_to_urdf.sh_


There will be instructions on how to setup various configurations within the Isaac Sim environment such as:

**1. Controlling the Arm With a Game Controller** (gamepad_vel_control.md)

**2. ROS2 integration** (ros2_joint_states.md)

**3. ROS2 Object detection with YOLO (v8)**

Enter the yolo_ros venv:

source venvs/yolo_ros/bin/activate


To launch default yolo:  

ros2 launch yolo_bringup yolo.launch.py input_image_topic:=/rgb



**Eventually, Pick and Place Reinforcement Learning with Isaac Lab**
