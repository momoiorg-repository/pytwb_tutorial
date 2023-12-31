FROM ros:humble
SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install -y --no-install-recommends \
 git python3-pip vim xterm less

RUN apt-get update && apt-get install -y --no-install-recommends \
 ros-humble-py-trees ros-humble-py-trees-ros

RUN pip install --upgrade numpy

WORKDIR /root
RUN echo "source /opt/ros/humble/setup.bash" >> .bashrc

WORKDIR /usr/local/lib
RUN git clone https://github.com/momoiorg-repository/pytwb.git
WORKDIR /usr/local/lib/pytwb
RUN source /opt/ros/humble/setup.bash && pip3 install -e .

WORKDIR /root
COPY ./tutorial tutorial