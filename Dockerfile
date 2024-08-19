FROM ubuntu:24.04
WORKDIR /home
RUN apt-get -y update && apt-get -y install
RUN apt-get -y install git
RUN apt-get -y install g++
RUN apt-get -y install wget
RUN wget https://github.com/bazelbuild/bazelisk/releases/download/v1.20.0/bazelisk-linux-amd64
RUN chmod +x bazelisk-linux-amd64
RUN mv bazelisk-linux-amd64 /usr/local/bin/bazel
RUN mkdir NagarajaHuliyapuradaMata
WORKDIR /home/NagarajaHuliyapuradaMata
RUN git clone https://github.com/NagarajaHuliyapuradaMata/Workspace_Ubuntu.git
WORKDIR /home/NagarajaHuliyapuradaMata/Workspace_Ubuntu
RUN mkdir repo_submodules
RUN mkdir repo_projects
WORKDIR /home/NagarajaHuliyapuradaMata/Workspace_Ubuntu/repo_submodules
RUN git submodule add https://github.com/NagarajaHuliyapuradaMata/common.git
RUN git submodule add https://github.com/NagarajaHuliyapuradaMata/SwcServiceStartup.git
RUN git submodule add https://github.com/NagarajaHuliyapuradaMata/SwcServiceEcuM.git
WORKDIR /home/NagarajaHuliyapuradaMata/Workspace_Ubuntu/repo_projects
RUN git submodule add https://github.com/NagarajaHuliyapuradaMata/pProjectFull.git
WORKDIR /home/NagarajaHuliyapuradaMata/Workspace_Ubuntu
RUN bazel build repo_projects/pProjectFull/main_LATEST/pProjectFull_main_LATEST

CMD [ "./bazel-bin/repo_projects/pProjectFull/main_LATEST/pProjectFull_main_LATEST" ]
#CMD [ "bash" ]

