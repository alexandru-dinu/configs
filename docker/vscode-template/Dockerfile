# the base miniconda3 image
FROM continuumio/miniconda3:latest

# load in the environment.yml file - this file controls what Python packages we install
ADD environment.yml /

# install the Python packages we specified into the base environment
RUN conda update -n base conda -y && conda env update

# download the coder binary, untar it, and allow it to be executed
RUN wget https://github.com/cdr/code-server/releases/download/2.1692-vsc1.39.2/code-server2.1692-vsc1.39.2-linux-x86_64.tar.gz \
    && tar -xzvf code-server2.1692-vsc1.39.2-linux-x86_64.tar.gz && chmod +x code-server2.1692-vsc1.39.2-linux-x86_64/code-server

COPY docker_entrypoint.sh /usr/local/bin/

ADD ./code /code

ENTRYPOINT ["docker_entrypoint.sh"]
