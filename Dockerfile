FROM ubuntu:24.04
WORKDIR /home
RUN apt-get -y update && apt-get -y install
RUN apt-get -y install git
RUN apt-get -y install g++
#RUN apt-get -y install gdb
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
RUN git submodule add https://github.com/NagarajaHuliyapuradaMata/aapFunctionalCluster_CommunicationManagement.git
RUN git submodule add https://github.com/NagarajaHuliyapuradaMata/aapFunctionalCluster_Core.git
RUN git submodule add https://github.com/NagarajaHuliyapuradaMata/aapFunctionalCluster_Cryptography.git
RUN git submodule add https://github.com/NagarajaHuliyapuradaMata/aapFunctionalCluster_DiagnosticManagement.git
RUN git submodule add https://github.com/NagarajaHuliyapuradaMata/aapFunctionalCluster_ExecutionManagement.git
RUN git submodule add https://github.com/NagarajaHuliyapuradaMata/aapFunctionalCluster_Firewall.git
RUN git submodule add https://github.com/NagarajaHuliyapuradaMata/aapFunctionalCluster_IntrusionDetectionSystemManager.git
RUN git submodule add https://github.com/NagarajaHuliyapuradaMata/aapFunctionalCluster_LogAndTrace.git
RUN git submodule add https://github.com/NagarajaHuliyapuradaMata/aapFunctionalCluster_NetworkManagement.git
RUN git submodule add https://github.com/NagarajaHuliyapuradaMata/aapFunctionalCluster_Persistency.git
RUN git submodule add https://github.com/NagarajaHuliyapuradaMata/aapFunctionalCluster_PlatformHealthManagement.git
RUN git submodule add https://github.com/NagarajaHuliyapuradaMata/aapFunctionalCluster_RawDataStream.git
RUN git submodule add https://github.com/NagarajaHuliyapuradaMata/aapFunctionalCluster_Registry.git
RUN git submodule add https://github.com/NagarajaHuliyapuradaMata/aapFunctionalCluster_StateManagement.git
RUN git submodule add https://github.com/NagarajaHuliyapuradaMata/aapFunctionalCluster_TimeSynchronization.git
RUN git submodule add https://github.com/NagarajaHuliyapuradaMata/aapFunctionalCluster_UpdateAndConfigurationManagement.git
RUN git submodule add https://github.com/NagarajaHuliyapuradaMata/aapFunctionalCluster_VehicleUpdateAndConfigurationManagement.git
WORKDIR /home/NagarajaHuliyapuradaMata/Workspace_Ubuntu/repo_projects
RUN git submodule add https://github.com/NagarajaHuliyapuradaMata/pProjectFull.git
WORKDIR /home/NagarajaHuliyapuradaMata/Workspace_Ubuntu
RUN bazel build -c dbg repo_projects/pProjectFull/main_LATEST/pProjectFull_main_LATEST

CMD [ "gdb ./bazel-bin/repo_projects/pProjectFull/main_LATEST/pProjectFull_main_LATEST" ]

