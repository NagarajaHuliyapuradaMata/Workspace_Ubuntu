FROM ubuntu:24.04
WORKDIR /home
RUN apt-get -y update && apt-get -y install
RUN apt-get -y install git
RUN apt-get -y install g++
RUN apt-get update
RUN apt-get -y install gdb
RUN apt-get -y install wget
RUN wget https://github.com/bazelbuild/bazelisk/releases/download/v1.20.0/bazelisk-linux-amd64
RUN chmod +x bazelisk-linux-amd64
RUN mv bazelisk-linux-amd64 /usr/local/bin/bazel
RUN mkdir NagarajaHuliyapuradaMata
WORKDIR /home/NagarajaHuliyapuradaMata
RUN git clone https://github.com/NagarajaHuliyapuradaMata/Workspace_Ubuntu.git
WORKDIR /home/NagarajaHuliyapuradaMata/Workspace_Ubuntu
RUN git submodule update --init --recursive
WORKDIR /home/NagarajaHuliyapuradaMata/Workspace_Ubuntu/repo_submodules/common
RUN git checkout main
WORKDIR /home/NagarajaHuliyapuradaMata/Workspace_Ubuntu/repo_submodules/aapFunctionalCluster_CommunicationManagement
RUN git checkout main
WORKDIR /home/NagarajaHuliyapuradaMata/Workspace_Ubuntu/repo_submodules/aapFunctionalCluster_Core
RUN git checkout main
WORKDIR /home/NagarajaHuliyapuradaMata/Workspace_Ubuntu/repo_submodules/aapFunctionalCluster_Cryptography
RUN git checkout main
WORKDIR /home/NagarajaHuliyapuradaMata/Workspace_Ubuntu/repo_submodules/aapFunctionalCluster_DiagnosticManagement
RUN git checkout main
WORKDIR /home/NagarajaHuliyapuradaMata/Workspace_Ubuntu/repo_submodules/aapFunctionalCluster_ExecutionManagement
RUN git checkout main
WORKDIR /home/NagarajaHuliyapuradaMata/Workspace_Ubuntu/repo_submodules/aapFunctionalCluster_Firewall
RUN git checkout main
WORKDIR /home/NagarajaHuliyapuradaMata/Workspace_Ubuntu/repo_submodules/aapFunctionalCluster_IntrusionDetectionSystemManager
RUN git checkout main
WORKDIR /home/NagarajaHuliyapuradaMata/Workspace_Ubuntu/repo_submodules/aapFunctionalCluster_LogAndTrace
RUN git checkout main
WORKDIR /home/NagarajaHuliyapuradaMata/Workspace_Ubuntu/repo_submodules/aapFunctionalCluster_NetworkManagement
RUN git checkout main
WORKDIR /home/NagarajaHuliyapuradaMata/Workspace_Ubuntu/repo_submodules/aapFunctionalCluster_Persistency
RUN git checkout main
WORKDIR /home/NagarajaHuliyapuradaMata/Workspace_Ubuntu/repo_submodules/aapFunctionalCluster_PlatformHealthManagement
RUN git checkout main
WORKDIR /home/NagarajaHuliyapuradaMata/Workspace_Ubuntu/repo_submodules/aapFunctionalCluster_RawDataStream
RUN git checkout main
WORKDIR /home/NagarajaHuliyapuradaMata/Workspace_Ubuntu/repo_submodules/aapFunctionalCluster_Registry
RUN git checkout main
WORKDIR /home/NagarajaHuliyapuradaMata/Workspace_Ubuntu/repo_submodules/aapFunctionalCluster_StateManagement
RUN git checkout main
WORKDIR /home/NagarajaHuliyapuradaMata/Workspace_Ubuntu/repo_submodules/aapFunctionalCluster_TimeSynchronization
RUN git checkout main
WORKDIR /home/NagarajaHuliyapuradaMata/Workspace_Ubuntu/repo_submodules/aapFunctionalCluster_UpdateAndConfigurationManagement
RUN git checkout main
WORKDIR /home/NagarajaHuliyapuradaMata/Workspace_Ubuntu/repo_submodules/aapFunctionalCluster_VehicleUpdateAndConfigurationManagement
RUN git checkout main
WORKDIR /home/NagarajaHuliyapuradaMata/Workspace_Ubuntu/repo_projects/pProjectFull
RUN git checkout main
WORKDIR /home/NagarajaHuliyapuradaMata/Workspace_Ubuntu
RUN bazel build -c dbg repo_projects/pProjectFull/main_LATEST/pProjectFull_main_LATEST

CMD [ "gdb bazel-bin/repo_projects/pProjectFull/main_LATEST/pProjectFull_main_LATEST" ]
#CMD [ "bash" ]

