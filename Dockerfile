FROM ubuntu:trusty

RUN apt-get update -y
RUN apt-get install -y nano
RUN apt-get install -y nmap
RUN apt-get install -y curl
RUN apt-get install -y software-properties-common
RUN apt-get install -y wget
RUN apt-get install -y tree
RUN apt-get install -y supervisor

RUN apt-add-repository -y "ppa:ubuntu-toolchain-r/ppa"
RUN apt-add-repository -y "deb http://llvm.org/apt/trusty/ llvm-toolchain-trusty-3.5 main"
RUN wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key | apt-key add -

RUN apt-get update -y

RUN apt-get install -y clang-3.5 lldb-3.5
RUN apt-get install -y libcap-dev
RUN apt-get install -y libseccomp-dev
RUN apt-get install -y pkg-config
RUN apt-get install -y xz-utils
RUN apt-get install -y imagemagick
RUN apt-get install -y build-essential

RUN curl -sL https://deb.nodesource.com/setup | bash -
RUN apt-get install -y nodejs

RUN mkdir --verbose --parents /opt/from_dockerfile

ENV CXX clang++-3.5
ENV CC clang-3.5

RUN npm install -g jsontool

ADD src/install_capnproto.sh /opt/from_dockerfile/install_capnproto.sh
RUN bash /opt/from_dockerfile/install_capnproto.sh

ADD src/install_libsodium.sh /opt/from_dockerfile/install_libsodium.sh
RUN bash /opt/from_dockerfile/install_libsodium.sh

RUN curl https://install.meteor.com/ | sh

ADD src/ /opt/from_dockerfile/
RUN adduser --system --home /opt/sandstorm --ingroup nogroup sandstorm
RUN chown --verbose --recursive sandstorm:nogroup /opt/from_dockerfile
RUN chmod +x /opt/from_dockerfile/*.sh

EXPOSE 6080 6081
CMD sudo -H -u sandstorm -- /opt/from_dockerfile/run.sh
