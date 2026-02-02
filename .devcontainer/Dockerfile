FROM nvcr.io/nvidia/isaac/ros:aarch64-ros2_humble_adc428c7077de4984a00b63c55903b0a

# Set non-interactive mode
ENV DEBIAN_FRONTEND=noninteractive

# # Install the Isaac ROS vSLAM packages
RUN apt-get install -y \
    ros-humble-isaac-ros-visual-slam

RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

# Add fancy colors to bash for root user
SHELL ["/bin/bash", "-c"]
RUN cat <<'EOF' >> /root/.bashrc
# ---- colorful root prompt ----
if command -v dircolors >/dev/null 2>&1; then
  eval "$(dircolors -b)"
fi
export PS1="\[\e[1;31m\]\u@\h \[\e[1;34m\]\w \[\e[0m\]# "
EOF
