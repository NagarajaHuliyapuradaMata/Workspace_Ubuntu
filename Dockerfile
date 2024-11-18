FROM ubuntu:24.04
WORKDIR /home
RUN apt-get -y update && apt-get -y install
RUN apt-get update
RUN apt-get -y install git
RUN apt-get -y install g++
#RUN apt-get -y install gdb
RUN apt-get -y install wget
RUN wget https://github.com/bazelbuild/bazelisk/releases/download/v1.20.0/bazelisk-linux-amd64
RUN chmod +x bazelisk-linux-amd64
RUN mv bazelisk-linux-amd64 /usr/local/bin/bazel
RUN mkdir nagarajahuliyapuradamata
WORKDIR /home/nagarajahuliyapuradamata
RUN git clone https://github.com/nagarajahuliyapuradamata/Workspace_Ubuntu.git
WORKDIR /home/nagarajahuliyapuradamata/Workspace_Ubuntu
RUN git submodule update --init --recursive
RUN ./m_git_checkout_WorkspaceUbuntu_mainLATEST.sh

WORKDIR /home/nagarajahuliyapuradamata/Workspace_Ubuntu
RUN bazel build -c dbg repo_projects/pProjectVirtualEcu/main_LATEST/pProjectVirtualEcu_main_LATEST

CMD [ "bazel-bin/repo_projects/pProjectVirtualEcu/main_LATEST/pProjectVirtualEcu_main_LATEST" ]
#CMD [ "gdb bazel-bin/repo_projects/pProjectVirtualEcu/main_LATEST/pProjectVirtualEcu_main_LATEST" ]
#CMD [ "bash" ]

