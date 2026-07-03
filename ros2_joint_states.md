The following are the instructions on how to set up ROS2 Joint States Publisher/Subscriber in Isaac Sim for the xarm5 or for any other robot.

1. **Setting Up the Articulation Roots**  
Before creating the Action Graph, it is important that you remove any articulation roots that are **NOT** on the main robot prim (for xarm5, it is _UF_ROBOT_). You can find which elements in the stage have an articulation element by clicking on the filter icon on the top right of your screen and clicking _Physics Articulation Roots_.
If there is no articulation root on the main robot prim, add it by right clicking the prim, then _Add -> Physics -> Articulation Root_.

2. **Create the Action Graph**  
Go to _Tools-> Robotics -> ROS 2 Omnigraphs -> Joint States_. A window should pop up. For the Articulation Root, click on _Add_, and select your robot's prim (for the xarm5, it's _UF_ROBOT_). This will create a an action graph including everything required for the robot to subscribe/publish its joint states.
Make sure to check the _Publisher_ and _Subscriber_ checkboxes as well as the _Move Robot?_ one, if they aren't checked.
