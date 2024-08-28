FROM rhasspy/wyoming-whisper:2.1.0
RUN apt update && apt install -y wget software-properties-common
RUN wget https://developer.download.nvidia.com/compute/cudnn/8.9.7.29/local_installers/12.2/cudnn-local-repo-debian11-8.9.7.29_1.0-1_amd64.deb
RUN dpkg -i cudnn-local-repo-debian11-8.9.7.29_1.0-1_amd64.deb
RUN cp /var/cudnn-local-repo-debian11-8.9.7.29/cudnn-*-keyring.gpg /usr/share/keyrings/
RUN wget https://developer.download.nvidia.com/compute/cuda/repos/debian11/x86_64/cuda-keyring_1.1-1_all.deb
RUN dpkg -i cuda-keyring_1.1-1_all.deb
RUN add-apt-repository contrib && apt --allow-releaseinfo-change update
RUN apt -y install libcudnn8 libcublas-12-0
RUN rm cudnn-local-repo-debian11-8.9.7.29_1.0-1_amd64.deb
