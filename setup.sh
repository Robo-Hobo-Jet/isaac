#!/bin/bash
set -e

vcs import < src/packages/ros2.repos src/packages
sudo apt-get update --allow-releaseinfo-change
rosdep update --rosdistro=$ROS_DISTRO
rosdep install --from-paths src --ignore-src -y --rosdistro=$ROS_DISTRO
