ARG APPID="90"
ARG MOD="valve"

FROM debian:trixie-slim AS build_stage

ARG APPID
ARG MOD
ARG APPBRANCH=""

LABEL creator="Sergey Shorokhov <wopox1337@ya.ru>"

# Install required packages
RUN set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
       ca-certificates=20240203 \
       curl=8.5.0-2 \
       libarchive-tools=3.7.2-1 \
    && rm -rf /var/lib/apt/lists/*

# Download and install DepotDownloader
ARG DepotDownloader_URL="https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.5.0/DepotDownloader-linux-x64.zip"
RUN curl -L# ${DepotDownloader_URL} | bsdtar -xvf - -C /usr/local/bin/ \
    && chmod +x /usr/local/bin/DepotDownloader

ENV APPDIR=/root/hlds
WORKDIR ${APPDIR}

COPY --chmod=755 utils/* utils/

# Download mod depots
RUN DEPOTS=$(utils/getDepotsByMod.sh ${MOD}) \
    && for depot in ${DEPOTS}; do \
       DepotDownloader -dir ${APPDIR} -app ${APPID} -depot ${depot} -beta ${APPBRANCH}; \
   done

# Fix first run crash and STEAM Validation rejected issue
RUN cp ${APPDIR}/${MOD}/steam_appid.txt ${APPDIR}

# Remove unnecessary files
RUN rm -rf linux64 .DepotDownloader utils/ \
    && find . \( \
        -name '*64.so'  -o \
        -name '*.dll'   -o \
        -name '*.dylib' \
    \) -exec rm -rf {} \;

FROM debian:trixie-slim AS run_stage

# Install required packages
RUN set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
       ca-certificates=20240203 \
       gdb-minimal=13.2-1 \
       lib32stdc++6=14-20240201-3 \
    && rm -rf /var/lib/apt/lists/*

ARG APPUSER="hlds_user"
ENV APPUSER=${APPUSER}
ENV APPDIRNAME="hlds"

# Create a new user
RUN useradd -m -s /bin/bash ${APPUSER}
USER ${APPUSER}

# Copy HLDS files from build stage
COPY --chown=${APPUSER}:${APPUSER} --from=build_stage /root/hlds home/${APPUSER}/${APPDIRNAME}

# Create symbolic links for steamclient.so
RUN mkdir -p ${HOME}/.steam/sdk32/ \
    && ln -s ${HOME}/${APPDIRNAME}/steamclient.so /home/${APPUSER}/.steam/sdk32/steamclient.so \
    && ln -s ${HOME}/${APPDIRNAME}/steamclient.so ${HOME}/${APPDIRNAME}/steamservice.so

EXPOSE 26900-27020/udp

ARG MOD
ENV MOD=${MOD}

WORKDIR /home/${APPUSER}/${APPDIRNAME}

# Set default command
CMD ["bash", "-c", "./hlds_run -game ${MOD} +ip 0.0.0.0 -port 27016 +map $(head -n 1 ./${MOD}/mapcycle.txt)"]
