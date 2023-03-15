# Update package sources
apt-get update
# Use the information from debian to get most of the build dependencies
apt-get build-dep -yq --force-yes libjna-java
# Install the remaining utilities, that are needed
apt-get install -yq --force-yes zip unzip libtool automake libltdl-dev texinfo

cd autoconf-2.71
./configure; make; make install
cd ..
cd automake-1.16.5
./configure; make; make install
cd ..
cd libtool-2.4.7
./configure; make; make install
cd ..