FROM openjdk:23-slim-bullseye
RUN apt update && apt install -y wget unzip grep && rm -rf /var/lib/apt/lists/* 
RUN wget https://software.verapdf.org/releases/verapdf-installer.zip && unzip verapdf-installer.zip -d verapdf-installer && rm verapdf-installer.zip
COPY ./assets/verapdf-install-args.xml /tmp/verapdf-install-args.xml
RUN ./verapdf-installer/verapdf*/verapdf-install /tmp/verapdf-install-args.xml
RUN rm /tmp/verapdf-install-args.xml && rm -r verapdf-installer
ENV PATH="${PATH}:/programs/verapdf"
ENV LANG en_US.utf-8
ENTRYPOINT ["/bin/bash"]
