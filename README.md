# RabbitMQ in Cluster Mode with ETCD

To execute it is necessary to open the terminal in the project folder and execute the following command:

To ensure that the two nodes of RabbitMQ work in sync it is necessary that both have the same ``.erlang.cookie`` file, for that I created a secret in my Docker Swarm called ``rabbitmq_erl_cookie`` containing the value of my cookie and added the following block in docker-compose:

``secrets:
       - source: rabbitmq_erl_cookie
         target: /var/lib/rabbitmq/.erlang.cookie
         uid: '999'
         gid: '999'
         mode: 0400``
Informing that my secret was stored in ``/var/lib/rabbitmq/.erlang.cookie`` and I ensured that it was created with the necessary permissions assigned to user 999 (rabbitmq) and group 999 (rabbitmq).

User: guest
Pass: guest

# Enabling high availability and synchronization of all data.
Just create a policy within the RabbitMQ panel, as follows:
![Alt text](images/haproxy-stats.png?raw=true "Stats HAProxy")


# HAProxy
To access RabbitMQ's management panel just access the IP of any node of the Docker Swarm with port ``15672`` and HAProxy will be in charge of balancing the accesses to each request between the two nodes of RabbitMQ.

To connect with RabbitMQ to send messages just access with the IP of any node of the Docker Swarm with port ``5672`` and the HAProxy will make the TCP load balance between the nodes.

To collect statistics about RabbitMQ nodes just access port ``10000``, with username and password admin.

![Alt text](images/rabbitmq-policies-1.png?raw=true "RabbitMQ Policies")
![Alt text](images/rabbitmq-policies-2.png?raw=true "RabbitMQ Policies")