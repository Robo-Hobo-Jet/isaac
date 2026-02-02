FROM nvcr.io/nvidia/isaac/ros:aarch64-ros2_humble_adc428c7077de4984a00b63c55903b0a

# Set non-interactive mode
ENV DEBIAN_FRONTEND=noninteractive

# # Install the Isaac ROS vSLAM packages
RUN apt-get install -y \
    ros-humble-isaac-ros-visual-slam

RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

# Set up auto-source of workspace for ros user
ARG WORKSPACE
RUN echo "if [ -f ${WORKSPACE}/install/setup.bash ]; then source ${WORKSPACE}/install/setup.bash; fi" >> ~/.bashrc