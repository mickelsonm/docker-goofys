FROM google/golang

# just some environment variables
ENV AWS_ACCESS_KEY YOUR_ACCESS_KEY
ENV AWS_SECRET_KEY YOUR_SECRET_KEY
ENV S3_BUCKET YOUR_S3_BUCKET_NAME
ENV MOUNT_PATH /data

# setup the fuse-utils system dependency
RUN apt-get -qq install fuse-utils

# setup a couple directories
RUN mkdir -p $MOUNT_PATH && mkdir /root/.aws

# setup/install the goofys
RUN go get github.com/kahing/goofys
RUN go install github.com/kahing/goofys

# setup the startup script
ADD startup.sh /usr/local/bin/startup.sh
RUN chmod +x /usr/local/bin/startup.sh

# the entry point is the startup script
ENTRYPOINT ["/usr/local/bin/startup.sh"]
