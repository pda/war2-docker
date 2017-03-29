FROM jess/wine

RUN apt-get update \
  && \
  apt-get -y install \
    libgl1-mesa-glx:i386 \
    libgl1-mesa-dri:i386 \
    && \
  rm -rf /var/lib/apt/lists/*
