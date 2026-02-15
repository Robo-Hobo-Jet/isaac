FROM nvcr.io/nvidia/isaac/ros:aarch64-ros2_humble_adc428c7077de4984a00b63c55903b0a

# Set non-interactive mode
ENV DEBIAN_FRONTEND=noninteractive

# # Install the Isaac ROS vSLAM packages
RUN apt-get install -y \
    ros-humble-isaac-ros-visual-slam
    # ros-humble-nvblox-ros

ENV ISAAC_ROS_WS=/opt/ros_ws/

# Install host setup script
COPY install_host.sh /usr/local/bin/install_host.sh

RUN bash /usr/local/bin/install_host.sh

RUN mkdir -p /opt/ros_ws/src
WORKDIR /opt/ros_ws/src

# Clone the exact ROS wrapper version
# Clone the repo without checking out HEAD
RUN git clone https://github.com/IntelRealSense/realsense-ros.git /opt/ros_ws/src/realsense-ros && \
    cd /opt/ros_ws/src/realsense-ros && \
    git checkout tags/4.51.1

RUN rm -f /etc/apt/sources.list.d/yarn.list

# Build the workspace, but ignore librealsense2 packages as they are built locally in the correct version
WORKDIR /opt/ros_ws/

RUN /bin/bash -c "source /opt/ros/humble/setup.bash && \
                  apt-get update --allow-releaseinfo-change && \
                  rosdep update && \
                  rosdep install --from-paths src --ignore-src -r -y --skip-keys='librealsense2 librealsense2-dev librealsense2-utils' && \
                  colcon build --symlink-install --executor sequential --cmake-args '-DCMAKE_BUILD_TYPE=RelWithDebInfo' '-DCMAKE_EXPORT_COMPILE_COMMANDS=On' '-DNVBLOX_ENABLE_REALSENSE=ON'"

# Install robot_localization
RUN apt-get update --allow-releaseinfo-change && apt-get install -y \
    ros-humble-robot-localization ros-humble-topic-tools \
    && rm -rf /var/lib/apt/lists/*

RUN echo "source /opt/ros/humble/setup.bash" >> /root/.bashrc
RUN echo "source /opt/ros_ws/install/setup.bash" >> /root/.bashrc

# Add fancy colors to bash for root user
SHELL ["/bin/bash", "-c"]
RUN cat <<'EOF' >> /root/.bashrc
# ---- colorful root prompt ----
if command -v dircolors >/dev/null 2>&1; then
  eval "$(dircolors -b)"
fi
export PS1="\[\e[1;31m\]\u@\h \[\e[1;34m\]\w \[\e[0m\]# "
EOF
