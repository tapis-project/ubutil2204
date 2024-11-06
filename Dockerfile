FROM ubuntu:22.04
RUN apt-get update
RUN apt-get install -y apt-utils
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
RUN ln -fs /usr/share/zoneinfo/America/Chicago /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata
RUN apt-get update
RUN apt-get -y --assume-yes install apt-utils python3-openstackclient git vim net-tools netcat-openbsd ansible curl iputils-ping jq gnupg
#RUN apt-get dist-upgrade -y --assume-yes
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update
RUN apt-get install -y kubectl
RUN apt-get install -y postgresql-client
