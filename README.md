#docker-goofys

Just messing around with goofys.

    docker run -it --cap-add mknod --cap-add sys_admin --device=/dev/fuse goofys /bin/bash
