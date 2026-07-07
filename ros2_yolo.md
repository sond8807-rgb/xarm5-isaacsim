Instructions regarding the setup of the YOLOv8 object detection model by Ultralytics for the Intel Realsense D455 (or any camera) in Isaac Sim.

**yolo_ros AND YOLO v8 INSTALLATION**

1. Install yolo_ros from the following repo by following the installation instructions: https://github.com/mgonzs13/yolo_ros/tree/main

   _! Make sure you are installing yolo_ros inside of your ros2 workspace. Otherwise the installation will not work !_
   

2. Install Ultralytics YOLO v8: https://docs.ultralytics.com/quickstart#headless-server-installation


**Isaac Sim Camera Setup**

1. Open Isaac Sim. Click Create > Sensors > Camera and Depth Sensors > Intel > Intel Realsense D455.

2. Place the camera where you want on the scene. You may need to fiddle with the sensor's orientation/position values.

3. In the Stage panel, make sure to place the camera under your robot's prim. You can press play to make sure that the sensor does not fall.

4. To create the ROS2 action graph required, click on Tools > Robotics > ROS2 Omnigraphs > Camera.

5. A window should pop up. Make sure to select your camera's prim, that can be found under Realsense > RSD455 > ... (the camera prims are the ones with camera icons). Check RGB and Depth (and any others if required). When done, click on OK.

6. To test that the action graph is working, run the simulation. Then in a terminal, run the following:

   ros2 topic list
   
If you see "/rgb" and "/depth" then the action graph has been set up correctly!

7. You can see what the camera sees by openning rqt:

   rqt

From the topic list, choose /rgb or /depth. You should see a colored video feed or a black and white video feed respectively. 

**Yolo setup**

1. Now, launch yolo_ros:

    ros2 launch yolo_bringup yolo.launch.py input_image_topic:=/rgb
 

 "input_image_topic:=/rgb" forces yolo to use the "/rgb" topic as its image input.

2. In rqt, click on the topic /yolo/dbg_image to see YOLO in effect.

     
