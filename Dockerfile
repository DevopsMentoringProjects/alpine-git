
FROM ubuntu:latest

RUN apt update && apt install  openssh-server sudo -y

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1001 test

RUN  echo 'test:test' | chpasswd

# Add test user to sudoers to skip sudo password asking
#RUN echo 'test ALL=(ALL) NOPASSWD: ALL' | tee -a /etc/sudoers

RUN service ssh start

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
