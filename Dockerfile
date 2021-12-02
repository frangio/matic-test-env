FROM ubuntu
COPY install.sh config.json fix-matic-cli.patch matic/
RUN bash matic/install.sh
ENV PATH="${PATH}:/usr/local/go/bin"
WORKDIR matic/
