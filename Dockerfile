ARG STEAMAPPDIR="/root/hlds"

FROM debian:bookworm-slim AS build_stage

LABEL creator "Sergey Shorokhov <wopox1337@ya.ru>"

# Install, update & upgrade packages
RUN set -x  \
    && apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
    ca-certificates curl \
    libarchive-tools \
    && rm -rf /var/lib/apt/lists/*ls

ENV DepotDownloader_URL="https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.5.0/DepotDownloader-linux-x64.zip"
ENV STEAMAPPID="90"
ARG STEAMAPPDIR

RUN curl -sSL ${DepotDownloader_URL} | bsdtar -xf - ;\
    chmod +x DepotDownloader &&\
    \
    # Base Goldsrc Shared Content
    ./DepotDownloader -app ${STEAMAPPID} -depot 1 -manifest 8474943113327689461     -dir ${STEAMAPPDIR} &&\
    # Linux dedicated server
    ./DepotDownloader -app ${STEAMAPPID} -depot 4 -manifest 8690279432129063737     -dir ${STEAMAPPDIR} &&\
    # Steamworks SDK Redist (LINUX32)
    ./DepotDownloader -app ${STEAMAPPID} -depot 1006 -manifest 4444585935428744334  -dir ${STEAMAPPDIR} &&\
    # First run crash fix (also STEAM Validation rejected fix)
    echo "70" > ${STEAMAPPDIR}/steam_appid.txt &&\
    # Cleanup
    rm -rf ${STEAMAPPDIR}/.DepotDownloader

# Cleanup HLDS
RUN rm -rf ${STEAMAPPDIR}/linux64 &&\
    find ${STEAMAPPDIR} \( \
        -name '*64.so'  -o \
        -name '*.dll'   -o \
        -name '*.dylib' \
    \) -exec rm -rf {} \;


FROM debian:bookworm-slim AS run_stage

# Install, update & upgrade packages
RUN set -x  \
    && apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
    ca-certificates \
    gdb-minimal \
    lib32stdc++6 \
    && rm -rf /var/lib/apt/lists/*ls

ARG STEAMAPPDIR

COPY --from=build_stage ${STEAMAPPDIR} ${STEAMAPPDIR}

# Make steamclient.so link
RUN mkdir -p ~/.steam/sdk32/ &&\
    ln -s ${STEAMAPPDIR}/steamclient.so ~/.steam/sdk32/steamclient.so &&\
    ln -s ${STEAMAPPDIR}/steamclient.so ${STEAMAPPDIR}/steamservice.so

WORKDIR ${STEAMAPPDIR}

# TODO: make env usable for CMD
ENV PORT="27016"
ENV MAXPLAYERS="10"
ENV MAP="crossfire"
ENV SERVER_NAME="My HalfLife Server!"
ENV SV_LAN="0"
ENV RCON_PASSWORD=""

EXPOSE 27016/udp
ENTRYPOINT ["./hlds_run"]
CMD [ "-game valve -debug +ip 0.0.0.0 -port 27016 -maxplayers 10 +map crossfire" ]
