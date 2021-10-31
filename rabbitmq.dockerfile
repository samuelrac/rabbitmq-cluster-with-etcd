FROM rabbitmq:3.9.5-management

ENV TZ=America/Sao_Paulo

COPY ./files/rabbitmq.conf /etc/rabbitmq/rabbitmq.conf
COPY ./files/enabled_plugins /etc/rabbitmq/enabled_plugins