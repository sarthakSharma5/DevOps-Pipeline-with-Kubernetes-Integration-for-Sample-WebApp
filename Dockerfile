FROM centos:latest
RUN yum install wget -y
RUN yum install sudo -y
RUN yum install python38 -y
RUN sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
RUN sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
RUN yum install java-11-openjdk.x86_64 -y
RUN yum install jenkins -y
RUN yum install git -y
RUN yum install initscripts -y
RUN yum install /sbin/service -y

RUN sed -i  "102i jenkins ALL=(ALL) NOPASSWD: ALL" /etc/sudoers
CMD sudo service jenkins start -DFOREGROUND && /bin/bash

# RUN echo "jenkins ALL=(ALL)  NOPASSWD: ALL" >> /etc/sudoers
RUN chmod 0440 /etc/sudoers
# CMD sudo service jenkins start -DFOREGROUND && /bin/bash

RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/bin/

RUN mkdir /root/.kube
COPY ca.crt /root/
COPY client.crt /root/
COPY client.key /root/
COPY config /root/.kube

CMD ["java","-jar","/usr/lib/jenkins/jenkins.war"]
EXPOSE 8080
