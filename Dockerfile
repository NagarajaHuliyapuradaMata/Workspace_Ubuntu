FROM ubuntu:20.04
WORKDIR /home
RUN mkdir NagarajaHuliyapuradaMata
WORKDIR /home/NagarajaHuliyapuradaMata
RUN apt-get -y update && apt-get -y install
RUN apt-get -y install git
RUN apt-get -y install wget
RUN apt-get -y install g++
RUN wget https://github.com/bazelbuild/bazelisk/releases/download/v1.20.0/bazelisk-linux-amd64
RUN chmod +x bazelisk-linux-amd64
RUN mv bazelisk-linux-amd64 /usr/local/bin/bazel
RUN git clone --recurse-submodules https://github.com/NagarajaHuliyapuradaMata/Workspace_Ubuntu.git
WORKDIR /home/NagarajaHuliyapuradaMata/Workspace_Ubuntu/repo_submodules/SwcServiceStartup
RUN git checkout main
RUN git pull
WORKDIR /home/NagarajaHuliyapuradaMata/Workspace_Ubuntu
RUN git checkout main
RUN git pull
RUN bazel build repo_projects/pProjectFull/main_LATEST/pProjectFull_main_LATEST

CMD [ "./bazel-bin/repo_projects/pProjectFull/main_LATEST/pProjectFull_main_LATEST" ]

