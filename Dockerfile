FROM ubuntu:trusty

RUN apt-get update -y
RUN apt-get install -y nano nmap
RUN apt-get install -y curl tar
RUN apt-get install -y software-properties-common
RUN apt-get install -y wget
RUN apt-get install -y tree

RUN apt-add-repository -y "ppa:ubuntu-toolchain-r/ppa"
RUN apt-add-repository -y "deb http://llvm.org/apt/trusty/ llvm-toolchain-trusty-3.5 main"
RUN wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key | apt-key add -

RUN apt-get update -y

RUN apt-get install -y clang-3.5 lldb-3.5
RUN apt-get install -y supervisor
RUN apt-get install -y capnproto

RUN mkdir --verbose --parents /opt/from_dockerfile
ADD src/ /opt/from_dockerfile/
RUN chmod +x /opt/from_dockerfile/*.sh

RUN adduser --system --home /opt/sandstorm --ingroup nogroup sandstorm
RUN chown --verbose --recursive sandstorm:nogroup /opt/from_dockerfile

EXPOSE 6080 6081
CMD sudo -H -u sandstorm -- /opt/from_dockerfile/run.sh
