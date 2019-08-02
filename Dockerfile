FROM ubuntu:19.04

RUN apt update
RUN apt install -y nginx nodejs python3 python2 wget python-pip python3-pip npm

RUN mkdir /vol
COPY build-tezos-client.sh /vol
RUN bash /vol/build-tezos-client.sh

WORKDIR /vol
RUN for i in deploy contract file-server gateway passive-node; do \
  git clone https://github.com/ais3-2019-Soft-T2/$i; \
done

RUN pip install -r /vol/file-server/requirements.txt
RUN mkdir server_folder

CMD ["/bin/bash"]
