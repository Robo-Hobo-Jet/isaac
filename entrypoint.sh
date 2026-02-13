# echo "Starting nodes"

# source /opt/ros/humble/setup.bash
source /opt/ros_ws/install/setup.bash
source /workspace/install/setup.bash
ros2 launch launch_robot realsense_nvblox_nav.launch.py
#!/bin/bash
# set -e

# # Library Pfade zuerst
# export LD_LIBRARY_PATH=/usr/lib/aarch64-linux-gnu:/usr/local/lib:$LD_LIBRARY_PATH

# # ROS Setup
# source /opt/ros/humble/setup.bash
# source /opt/ros_ws/install/setup.bash
# source /workspace/install/setup.bash

# # Starte ROS Node
# exec ros2 launch launch_robot realsense_nvblox_nav.launch.py
