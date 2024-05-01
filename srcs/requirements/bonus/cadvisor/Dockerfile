FROM debian:bookworm

RUN apt update -y
RUN apt install -y wget curl
RUN wget https://github.com/google/cadvisor/releases/download/v0.41.0/cadvisor 
RUN chmod +x cadvisor
RUN mv cadvisor /usr/local/bin/
CMD [ "/usr/local/bin/cadvisor" ]