#!/bin/sh

# Getting the user id.
MYUID=`id -u`

TMP_INSTALL_DIR=`mktemp -d`
if [ ! -d $TMP_INSTALL_DIR ]
then
	echo "Create temp dir failed"
	exit 1
fi

# Copying the Dockerfile to set parameters.
cp -f Dockerfile $TMP_INSTALL_DIR && \
cp -f finalize_installation32.sh $TMP_INSTALL_DIR && \
cp -f finalize_installation64.sh $TMP_INSTALL_DIR

# Setting the right user id.
sed -i -e "s/1001/$MYUID/g" $TMP_INSTALL_DIR/Dockerfile

# Stripping the escapements of the end of lines to allow incremental build of the docker image (build testing vs size optimization).
#sed -i -e 's/ && \\//g' $TMP_INSTALL_DIR/Dockerfile
#sed -i -e 's/^	/RUN /g' $TMP_INSTALL_DIR/Dockerfile

# Building the image.
sudo docker build --no-cache -t webanck/docker-wine-steam $TMP_INSTALL_DIR

# Cleaning up.
rm -fr $TMP_INSTALL_DIR
