Here are the instructions on how to control the xarm5 (with/without gripper) inside of IsaacSim by using a gamepad controller.
We will be utilizing the omnigraph to control the velocity of the joints of the robot. Here are the steps:

**1. Have the XARM5 URDF imported into IsaacSim.**

Add a floor by selecting _Create -> Environments -> Flat Grid_.

The robot should look like this:
<img width="847" height="700" alt="Screenshot from 2026-06-23 13-48-48" src="https://github.com/user-attachments/assets/2cc25db5-1f7e-45f0-b8f4-67fa4bb8735d" />

_!! There is an issue with the joints of the gripper of the XARM5. It seems to be missing two joints, one on each finger. So, when you run the simulation by clicking on the Play Icon (or by pressing spacebar), the gripper's fingers do not work as intended !!_

**2. Creating the Omnigraph**

Click on: _Tools -> Robotics -> OmniGraph Controllers -> Joint Velocity_. 
For the Robot Prim, make sure to click on _Add_ and select _UF_ROBOT_. Then click _OK_.

This should create a Graph called _Velocity_Controller_ inside your stage. To find it, go to _Stage -> Graphs -> Velocity_Controller_. To open the graph, right click on _Velocity_Controller_ and click _Open Graph_.
You should see the Action Graph tab open, with some nodes already set up for you:
<img width="1486" height="1065" alt="Screenshot from 2026-07-03 10-37-18" src="https://github.com/user-attachments/assets/6b295418-050b-4af9-8f5e-f182b62efbdf" />

The "Make Array" nodes are arrays with certain types of values inside them. The one with green circles contain "Double" numbers (or Double-precision floating-point format) which are used to determine Velocities of the joints. You can see that the node is connected to the "Velocity Command" input of the "Articulation Controller" node.

The other "Make Array" node with pink circles is the array containing all the joint names of the arm that we want to control: joint1, joint2, joint3, joint4, joint5 and drive_joint. Isaac Sim already set this up for us. You can see that the array is sent to the input "Joint Names" of the "Articulation Controller" node.

The "On Playback Tick" node allows the "Articulation Controller" to execute its velocity commands on a set tick rate.

**3. Adding the required nodes for control via the gamepad**
Isaac Sim has already set up most of the nodes. All we need is to create values for the velocities of the joints.

Add the _Read Gamepad State_, _To Double_, _Constant Double_ and _Multiply_ nodes to the graph.
Then, connect them together like this:
<img width="1362" height="543" alt="Screenshot from 2026-07-03 11-01-47" src="https://github.com/user-attachments/assets/b5340701-db88-4498-92d4-a68460cb0e63" />

-_Read Gamepad State_ reads the gamepad's inputs. Click on the node and set the "Element" to the button you want it to receive values from. This node will output a float.

-_To Double_ turns the gamepad input, a float, into a double. This is so that we can put the value inside the array which only allows for doubles.

-_Multiply_ multiplies two values together. Here we are multiplying the received input (A) of the gamepad with a constant (B) from the _Constant Double_ node to create the final velocity value that is executed by the joint.

-_Constant Double_ allows us to set a constant (double) to multiply our controller value with. Click on the node and set the "Value" to a number like 10000 (you can change this value as you see fit through trial and error).

