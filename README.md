# Fastbot Docker Images

This project consists of the creation of docker containers for the bringup of the FastBot robot both in a simulated and real environments. 

## Simulation

We have three docker files in the `simulation/` folder:
- `fastbot-ros2-gazebo`: This image contains everything necessary for starting the **Gazebo** simulation in **ROS2**. 
- `fastbot-ros2-slam`: This image contains everything necessary for starting the **Mapping** system.
- `fastbot-ros2-webapp`: This image contains everything necessary for starting the **Fastbot Web Application** that leads to a webpage **controlling** the robot and **visualizing the map** generated.

The images as well as their respective containers are started by a `docker-compose.yaml` file:
```
cd simulation/
docker-compose up
```

In order to verify if the containers are started, run:
```
docker ps
```

This should list the following containers: `fastbot-ros2-gazebo`, `fastbot-ros2-slam`and `fastbot-ros2-webapp`.

## Real Robot

There are two Docker files inside the `real/docker/` folder:
- `Dockerfile.fastbot-ros2-real`: This image contains everything necessary for **starting all the Real Robot System**s, including the Camera, Laser and Motor Drivers.
- `Dockerfile.fastbot-ros2-slam-real`: This image will contain everything necessary for **starting the Mapping system** for the real robot. 

The following section introduces the steps to build these Docker images and automatically start their containers after each reboot of the robot.
### Inside the robot

Please clone this repository:
```
git clone https://github.com/habartakh/fastbot_ros2_docker.git
```

Navigate to the following folder: 
```
cd fastbot_ros2_docker/real/docker
```
First start by installing docker: 
```
 ./install_docker.sh
```
Build the Docker images and start their containers by running: 
```
docker compose up
```
*Please note that there is no '-' in the `docker compose` command. That is because a newer version of docker-compose was installed by the `install_docker.sh` script.*

You can verify that all the containers are started by running:
```
docker ps
```
In order to start the containers automatically after each reboot, run: 
```
sudo systemctl enable docker
```

All of the docker services will run when you reboot your system if you run `docker compose` in detached mode only once:
```
docker compose up -d
```

### Outside the robot

In order to visualize the topics from an external computer, you should first set the ROS_DOMAIN_ID environment variable to the same value as the one in the containers:
```
export ROS_DOMAIN_ID=1
```
Then, you can run: 
```
ros2 topic list
```

You can also **visualize the map** generated in **RViz2**. You can also use the following configuration file `fastbot_ros2_docker/real/fastbot_navigation/fastbot_slam/rviz/nav.rviz`.
