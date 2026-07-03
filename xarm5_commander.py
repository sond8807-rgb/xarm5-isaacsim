import rclpy
from rclpy.node import Node
from sensor_msgs.msg import JointState
import time

class XArm5Commander(Node):
    def __init__(self):
        super().__init__("xarm5_commander")
        # Ensure the topic matches your Isaac Sim 'ROS2 Subscribe Joint State' node
        self.pub = self.create_publisher(JointState, "/joint_command", 10)

    def send(self, positions):
        msg = JointState()
        
        # 1. Add the current time to the header
        msg.header.stamp = self.get_clock().now().to_msg()
        
        # 2. Match your USD joint names exactly (You correctly noted this!)
        msg.name = ["joint1", "joint2", "joint3", "joint4", "joint5"]  
        
        # Ensure positions are floats
        msg.position = [float(p) for p in positions] 
        
        self.pub.publish(msg)
        self.get_logger().info(f"Published joint positions: {positions}")

def main():
    rclpy.init()
    node = XArm5Commander()

    # 3. Wait for Isaac Sim to discover this publisher
    node.get_logger().info("Waiting for Isaac Sim subscriber...")
    while node.pub.get_subscription_count() == 0:
        rclpy.spin_once(node, timeout_sec=0.1)
    
    # Add a tiny sleep just to ensure the DDS handshake is fully completed
    time.sleep(0.5) 

    # Send the command
    node.send([-0.2, -0.5, 0.5, -0.5, 0.3])
    
    # Give ROS 2 time to physically send the message over the network before shutting down
    rclpy.spin_once(node, timeout_sec=1.0)
    
    node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
