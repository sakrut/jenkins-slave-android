FROM sakrut/android-sdk:11.0-6.7LF

MAINTAINER Dmitry Karikh <the.dr.hax@gmail.com>

USER root

# Install some useful packages
RUN apt-get update \
 && apt-get install -y socat android-tools-adb \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists /var/cache/apt

USER user

# Slave settings
ENV MASTER_URL="http://jenkins:8080" \
    SLAVE_NAME="" \
    SLAVE_SECRET="" \
    SLAVE_ROOT="/home/user/jenkins-slave" \
    AVD=""

# Install Jenkins slave (swarm)
ADD root/ /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/swarm.sh"]