# xarm5-isaacsim
Documentation for the setup of the UFACTORY xArm5 robotic arm (or any other robot) in Isaac Sim version 5.1.0. Also includes instructions for setting up Isaac Lab.  

_To import the xarm5 into Isaac, see https://github.com/sond8807-rgb/xarm5-isaacsim/blob/main/xacro_to_urdf.sh_

# Gamepad Control of xArm5 
See https://github.com/sond8807-rgb/xarm5-isaacsim/blob/main/gamepad_vel_control.md for instructions.

# ROS2-IsaacSim Joint Control 
See https://github.com/sond8807-rgb/xarm5-isaacsim/blob/main/ros2_joint_states.md for instructions.

**New terminal session setup**:
```
source /opt/ros/jazzy/setup.bash
```


# ROS2-YOLO
See https://github.com/sond8807-rgb/xarm5-isaacsim/blob/main/ros2_yolo.md for instructions.

**New terminal session setup:**
1. Enter the yolo_ros venv:
```
source venvs/yolo_ros/bin/activate
```

2. Launch yolo:  
```
#Yolo with only object detection (defaults to yolo_v8)
ros2 launch yolo_bringup yolo.launch.py input_image_topic:=/rgb

#Launch yolo_v12 with 3D depth:
ros2 launch yolo_bringup yolov12.launch.py input_image_topic:=/rgb input_depth_topic:=/depth input_depth_info_topic:=/camera_info use_3d:=True target_frame:=UF_ROBOT
```
# Isaac Lab Installation and Setup
See https://github.com/sond8807-rgb/xarm5-isaacsim/blob/main/isaaclab_setup.md for instructions.

**New terminal session setup:**
```
conda activate env_isaaclab
```

(curobo new terminal setup:

Go into /home/curobo/ and

source .venv/bin/activate

to activate the virtual environment for curobo. )

