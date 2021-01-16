# Ensure source packages are accessible
cat /etc/apt/sources.list | sed -e 's/^deb/deb-src/' >> /etc/apt/sources.list
# Update package sources
apt-get update
# Use the information from debian to get most of the build dependencies
apt-get build-dep -yq --force-yes libjna-java
# Install the remaining utilities, that are needed
apt-get install -yq --force-yes zip unzip libtool automake libltdl-dev texinfo
