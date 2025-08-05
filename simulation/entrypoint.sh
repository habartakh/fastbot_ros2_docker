#! /bin/bash 
set -e

# Source ROS 2 else ros2 command is not recognized
source /opt/ros/humble/setup.bash
source /ros2_ws/install/setup.bash

echo "$(date +'[%Y-%m-%d %T]') Starting webpage container..."
python3 -m http.server 7000 & ros2 launch rosbridge_server rosbridge_websocket_launch.xml

