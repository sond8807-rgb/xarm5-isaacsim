The following are the instructions on how to set up ROS2 Joint States Publisher/Subscriber in Isaac Sim for the xarm5 or for any other robot.

1. **Setting Up the Articulation Roots**  
Before creating the Action Graph, it is important that you remove any articulation roots that are **NOT** on the main robot prim (for xarm5, it is _UF_ROBOT_). Otherwise, the robot will not move from ROS2 commands.  
You can find which elements in the stage have an articulation element by clicking on the filter icon on the top right of your screen and clicking _Physics Articulation Roots_.  

_The main robot prim (UF_ROBOT)_:
<img width="1019" height="652" alt="Screenshot from 2026-07-03 14-46-17" src="https://github.com/user-attachments/assets/61e2e6c1-f9ec-4bdc-97f5-cc5ca08071a8" />

If there is no articulation root on the main robot prim, add it by right clicking the prim, then _Add -> Physics -> Articulation Root_.  
It is also a good idea to set it as the Default Prim, which is done by right clicking and selecting _Set as Default Prim_.

3. **Create the Action Graph**  
Go to _Tools-> Robotics -> ROS 2 Omnigraphs -> Joint States_. A window should pop up. For the Articulation Root, click on _Add_, and select your robot's prim (for the xarm5, it's _UF_ROBOT_). This will create a an action graph including everything required for the robot to subscribe/publish its joint states.
Make sure to check the _Publisher_ and _Subscriber_ checkboxes as well as the _Move Robot?_ one, if they aren't checked. Then click on _OK_.
This should create the Action Graph we need.  
Make sure that the Target Prim of the _Articulation Controller_ and _ROS2 Publish Joint States_ nodes are the main robot prim (UF_ROBOT).

4. **Verify ROS2 is Working**  
Run the simulation. After, in a terminal, source ROS2 and echo the joint positions:  
**source /opt/ros/jazzy/setup.bash**  
**ros2 topic echo /joint_states**  
You should see the positions of joints 1 to 5.  
You can also run the following in the terminal:  
**ros2 topic list**  
You should see /joint_command and /joint_states if ROS2 is working.

5. **Moving the Robot with Position Commands**

