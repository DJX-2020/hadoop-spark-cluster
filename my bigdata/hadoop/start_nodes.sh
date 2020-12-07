#!/bin/bash

echo start containers

echo "start hadoop-node1 container ..."
docker run -itd --restart=always --net hadoop --ip 172.18.0.2 --privileged -p 8080:8080 -p 50070:50070 -p 9000:9000 --name hadoop-node1 --hostname hadoop-node1  --add-host hadoop-node2:172.18.0.3 --add-host hadoop-node3:172.18.0.4 hadoop /bin/bash
echo "start hadoop-node2 container..."
docker run -itd --restart=always --net hadoop --ip 172.18.0.3 --privileged -p 8042:8042 -p 51010:50010 -p 51020:50020 --name hadoop-node2 --hostname hadoop-node2 --add-host hadoop-node1:172.18.0.2 --add-host hadoop-node3:172.18.0.4 hadoop  /bin/bash
echo "start hadoop-node3 container..."
docker run -itd --restart=always --net hadoop --ip 172.18.0.4 --privileged -p 8043:8042 -p 51011:50011 -p 51021:50021 --name hadoop-node3 --hostname hadoop-node3 --add-host hadoop-node1:172.18.0.2 --add-host hadoop-node2:172.18.0.3  hadoop /bin/bash

sleep 5
docker exec -it hadoop-node1 /usr/sbin/sshd
docker exec -it hadoop-node2 /usr/sbin/sshd
docker exec -it hadoop-node3 /usr/sbin/sshd

echo finished
docker ps
