ARG APPDIR="/root/hlds"
ARG APPID="90"
ARG MOD="valve"

FROM debian:trixie-slim AS build_stage

ARG APPDIR
ARG APPID
ARG MOD
ARG APPBRANCH=""

LABEL creator="Sergey Shorokhov <wopox1337@ya.ru>"

# Install required packages
RUN set -x \
    && apt update \
    && apt install -y --no-install-recommends --no-install-suggests \
       ca-certificates=20240203 \
       curl=8.5.0-2 \
       libarchive-tools=3.7.2-1 \
    && rm -rf /var/lib/apt/lists/*

# Download and install DepotDownloader
ARG DepotDownloader_URL="https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.5.0/DepotDownloader-linux-x64.zip"
RUN curl -L# ${DepotDownloader_URL} | bsdtar -xvf - -C /usr/local/bin/ \
    && chmod +x /usr/local/bin/DepotDownloader

COPY --chmod=755 utils/* utils/

# Download mod depots
RUN DEPOTS=$(utils/getDepotsByMod.sh ${MOD}) \
    && for depot in ${DEPOTS}; do \
       DepotDownloader -dir ${APPDIR} -app ${APPID} -depot ${depot} -beta ${APPBRANCH}; \
   done \
    && rm -rf ${APPDIR}/.DepotDownloader

# Fix first run crash and STEAM Validation rejected issue
RUN cp ${APPDIR}/${MOD}/steam_appid.txt ${APPDIR}

# Remove unnecessary files
RUN rm -rf ${APPDIR}/linux64 \
    && find ${APPDIR} \( \
        -name '*64.so'  -o \
        -name '*.dll'   -o \
        -name '*.dylib' \
    \) -exec rm -rf {} \;

FROM debian:trixie-slim AS run_stage

# Install required packages
RUN set -x \
    && apt update \
    && apt install -y --no-install-recommends --no-install-suggests \
       ca-certificates=20240203 \
       gdb-minimal=13.2-1 \
       lib32stdc++6=14-20240201-3 \
    && rm -rf /var/lib/apt/lists/*

ARG APPDIR

# Copy HLDS files from build stage
COPY --from=build_stage ${APPDIR} ${APPDIR}

# Create symbolic links for steamclient.so
RUN mkdir -p ~/.steam/sdk32/ \
    && ln -s ${APPDIR}/steamclient.so ~/.steam/sdk32/steamclient.so \
    && ln -s ${APPDIR}/steamclient.so ${APPDIR}/steamservice.so

WORKDIR ${APPDIR}

EXPOSE 26900-27020/udp

ARG MOD
ENV MOD=${MOD}

# Set default command
CMD ["sh", "-c", "./hlds_run -game ${MOD} +ip 0.0.0.0 -port 27016 +map $(head -n 1 ./${MOD}/mapcycle.txt)"]
