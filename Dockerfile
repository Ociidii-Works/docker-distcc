FROM ubuntu:bionic

ARG DEBIAN_FRONTEND=noninteractive

#RUN echo 'deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-8 main' >> /etc/apt/sources.list
#RUN echo 'deb-src http://apt.llvm.org/bionic/ llvm-toolchain-bionic-8 main' >> /etc/apt/sources.list
#RUN apt-key add '6084 F3CF 814B 57C1 CF12 EFD5 15CF 4D18 AF4F 7421'

RUN apt update && apt install -y wget gnupg2 software-properties-common --no-install-recommends --no-install-suggests
RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt update && apt install -y gcc-8 g++-8 distcc
#RUN apt update && apt install -y clang-8

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 80 --slave /usr/bin/g++ g++ /usr/bin/g++-8
RUN update-alternatives --config gcc

RUN apt clean -y \
    && rm -rf /var/lib/apt/lists

RUN mkdir -p /home/distcc
RUN chmod a+rwx -R /home/distcc/
RUN cd /home/distcc/
COPY entrypoint.sh /home/distcc/entrypiont.sh

EXPOSE 3632
RUN echo Starting
ENTRYPOINT ["/home/distcc/entrypiont.sh"]
