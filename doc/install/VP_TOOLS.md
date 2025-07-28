# Tools installation
Here are the installation steps for all needed tools.

## Generic tools

To use buildroot repo you need to install the following packages:
```
sudo apt-get install libncurses5-dev libncursesw5-dev
```

These are for VP compiling:
```
sudo apt-get update
sudo apt-get install g++ cmake libboost-dev python-dev libglib2.0-dev libpixman-1-dev liblua5.2-dev lua5.2 swig libcap-dev libattr1-dev default-jdk flex bison
```

> TODO: is python2 installation needed?
> TODO: check for cmake version.

## SystemC library
Download the archive from the website, and extract:
```
wget -O systemc-2.3.0a.tar.gz http://www.accellera.org/images/downloads/standards/systemc/systemc-2.3.0a.tar.gz 
tar -xzvf systemc-2.3.0a.tar.gz
cd systemc-2.3.0a
```

Configure build steps, setting the installation directory (e.g. "/usr/local/systemc/systemc-2.3.0"):
```
sudo mkdir -p <inst_dir>
mkdir objdir
cd objdir
../configure --prefix=<inst_dir>
```

Build and install (with gcc/g++-4.8, if you followed the steps above):
```
make
sudo make install
```

## Perl packages
YAML package:
```
wget -O YAML-1.24.tar.gz http://search.cpan.org/CPAN/authors/id/T/TI/TINITA/YAML-1.24.tar.gz 
tar -xzvf YAML-1.24.tar.gz 
cd YAML-1.24
perl Makefile.PL
make
sudo make install
```

Tee package:
```
wget -O IO-Tee-0.65.tar.gz http://search.cpan.org/CPAN/authors/id/N/NE/NEILB/IO-Tee-0.65.tar.gz 
tar -xzvf IO-Tee-0.65.tar.gz
cd IO-Tee-0.65
perl Makefile.PL
make
sudo make install
```

Install last packages (Tiny and Simple) from Comprehensive Perl Archive Network:
```
sudo cpan -i Capture::Tiny
sudo cpan -i XML::Simple
```
