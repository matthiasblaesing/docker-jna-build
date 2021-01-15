# Make automake 2.69 available on debian squeeze
wget http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz
tar xzvf autoconf-2.69.tar.gz
cd autoconf-2.69
./configure; make; make install