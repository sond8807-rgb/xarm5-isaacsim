Instructions regarding the setup of the YOLOv8 object detection model by Ultralytics for the Intel Realsense D455 (or any camera) in Isaac Sim.

# yolo_ros and YOLO v8 Installation

1. Install yolo_ros from the following repo by following the installation instructions: https://github.com/mgonzs13/yolo_ros/tree/main

   _! Make sure you are installing yolo_ros inside of your ros2 workspace. Otherwise the installation will not work !_
   

( 2. Install Ultralytics YOLO v8: https://docs.ultralytics.com/quickstart#headless-server-installation ) _Optional, yolo_ros automatically installs the yolo version needed for a specific launch_ 


# Isaac Sim Camera Setup

1. Open Isaac Sim. Click Create > Sensors > Camera and Depth Sensors > Intel > Intel Realsense D455.

2. Place the camera where you want on the scene. You may need to fiddle with the sensor's orientation/position values.

3. In the Stage panel, make sure to place the camera under your robot's prim. You can press play to make sure that the sensor does not fall.

4. To create the ROS2 action graph required, click on Tools > Robotics > ROS2 Omnigraphs > Camera.

5. A window should pop up. Make sure to select your camera's prim, that can be found under Realsense > RSD455 > ... (the camera prims are the ones with camera icons). Check RGB and Depth (and any others if required). When done, click on OK.

6. To test that the action graph is working, run the simulation. Then in a terminal, run the following:
```
ros2 topic list
```   
If you see "/rgb" and "/depth" then the action graph has been set up correctly!

7. You can see what the camera sees by opening rqt:
```
rqt
```
Then, ppen the Image Viewer plugin. From the topic list, choose /rgb or /depth. You should see a colored video feed or a black and white video feed respectively. 

# yolo_ros Setup 

1. Now, launch yolo_ros
```
ros2 launch yolo_bringup yolo.launch.py input_image_topic:=/rgb
```
2. Have rqt open. 
```
rqt
```
3. You should now be able to see the object detection working when you select the yolo/dbg_image topic from the list.

The object detection should look like this (I added a couple meshes to the scene just to test YOLO):
<img width="607" height="814" alt="Screenshot from 2026-07-07 15-43-19" src="https://github.com/user-attachments/assets/c9b58731-ac7c-4471-b36c-3d12ae903c02" />

_Note that Isaac Sim may drop in FPS from publishing camera data to ROS2. You can lower the workload by changing the output image's resolution within the RenderProduct node. I set mine to 640x480._

# Yolo-rviz Setup 

To see visualizations in 3D, rqt will not be enough. We will need to use rviz2.
Before that, we have to set up the TF Publisher inside of Isaac Sim. We'll be using another ROS2 Omnigraph preset.

1. In Isaac Sim, click Tools > Robotics ROS 2 Omnigraphs > TF Publisher. A window should pop up. For the target prim, add the Camera_Pseudo_Depth prim from /UF_ROBOT/link4/Realsense/RSD455/Camera_Pseudo_Depth. For the parent prim, add UF_ROBOT. Pres OK.

2. Click on the _Isaac Read Simulation Time_ node. Make sure to check _Reset On Stop_. This will make the simulation time reset on stop just like our ROS_CAMERA Action Graph. Not doing so will lead to errors in rviz.

3. Next, go back to our _ROS_CAMERA_ action graph. Change all the frameIDs of all your publisher nodes (_CameraInfoPublish, RGBPublish, DepthPublish, ...Publish_) to Camera_Pseudo_Depth. 

4. Launch YOLOv12 with 3D object detection. Enter the following in your terminal:
```
ros2 launch yolo_bringup yolov12.launch.py input_image_topic:=/rgb input_depth_topic:=/depth input_depth_info_topic:=/camera_info use_3d:=True target_frame:=UF_ROBOT
```

Notice the "input_depth_topic:=/depth input_depth_info_topic:=/camera_info" and "target_frame:=UF_ROBOT" that are added.

5. In another terminal, launch rviz2:
```
rviz2
```
This should open rviz2. Under "Global Options", change the Fixed Frame from "map" to "UF_ROBOT". Then, to visualize the depth point cloud, click on Add > By Topic > /depth_pcl > PointCloud2. Click OK.

Let's also see the 2D image feed outputted by YOLO. Click on Add > By topic > /yolo > /dbg_image > Image. Click OK. An image window will appear in rviz. It will be the same as the image viewer we had in rqt.

Now, run the simulation in Isaac Sim. RVIZ should look something like this:

<img width="4423" height="1827" alt="Screenshot from 2026-07-09 15-22-39" src="https://github.com/user-attachments/assets/e727bcde-8c22-4626-9b3f-38f71dd89f63" />


 
     
