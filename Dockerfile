FROM ubuntu:20.04
WORKDIR /home
RUN mkdir NagarajaHuliyapuradaMata
WORKDIR /home/NagarajaHuliyapuradaMata
RUN apt-get -y update && apt-get -y install
RUN                      apt-get -y install git
RUN git clone --recurse-submodules https://github.com/NagarajaHuliyapuradaMata/Workspace_Ubuntu.git
CMD [ "ls -al" ]

