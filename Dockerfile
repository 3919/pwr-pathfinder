from ubuntu:rolling

RUN apt update && apt upgrade -y;

RUN apt install -y
	openjdk-8-jdk && \
	ant && \
	ca-certificates-java && \
	man-db && \
	manpages && \
	git && \
	apt && \
	clean && \
	update-ca-certificates -f;

RUN ln -sf /bin/bash /bin/sh

# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME && apt -qq -y install curl unzip zip
RUN curl -s https://get.sdkman.io | bash
RUN chmod a+x "$HOME/.sdkman/bin/sdkman-init.sh"
RUN source "$HOME/.sdkman/bin/sdkman-init.sh" && sdk install kotlin

