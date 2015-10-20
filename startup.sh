#!/bin/bash

cat <<- EOF > /root/.aws/credentials
   [default]
   aws_access_key_id = $AWS_ACCESS_KEY
   aws_secret_access_key = $AWS_SECRET_KEY
EOF

$GOPATH/bin/goofys $S3_BUCKET $MOUNT_PATH &
/bin/bash
