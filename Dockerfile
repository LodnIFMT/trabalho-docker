FROM ubuntu:resolute-20251101
RUN apt update
RUN apt upgrade -y
RUN apt install iputils-ping -y
RUN apt install curl -y
CMD ["tail", "-f", "/dev/null"]