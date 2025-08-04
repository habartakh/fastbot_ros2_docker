#! /bin/bash 

echo "$(date +'[%Y-%m-%d %T]') Starting nginx server..."
# set -x
# nginx -g 'daemon off;'

# Run nginx in background
nginx 

# Run rosbridge
echo "$(date +'[%Y-%m-%d %T]') Launching rosbridge..."
ros2 launch rosbridge_server rosbridge_websocket_launch.xml &

# Optional: keep container alive
tail -f /dev/null
