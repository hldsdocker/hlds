FROM debian:12-slim AS build_stage

LABEL creator="Sergey Shorokhov <wopox1337@ya.ru>"

# Install required packages
RUN set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
       ca-certificates \
       curl \
       libarchive-tools \
    && rm -rf /var/lib/apt/lists/*

# Download and install DepotDownloader
ARG DepotDownloader_URL="https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.7.2/DepotDownloader-linux-x64.zip"
RUN curl -sSL ${DepotDownloader_URL} | bsdtar -xvf - -C /usr/local/bin/ \
    && chmod +x /usr/local/bin/DepotDownloader

ENV APPDIR=/root/hlds
WORKDIR ${APPDIR}

COPY --chmod=755 utils/* utils/

ARG APPID=90
ARG APPBRANCH="public"

ENV BASE_DEPOTS="1 4 1006"

# Download base depots
RUN for depot in ${BASE_DEPOTS}; do \
       DepotDownloader -dir ${APPDIR} -app ${APPID} -depot ${depot} -beta ${APPBRANCH}; \
    done

SHELL [ "/bin/bash", "-c" ]
ARG MOD="valve"

# Download mod depots
RUN MOD_DEPOTS=$(utils/getDepotsByMod.sh ${MOD}) \
    && MOD_DEPOTS=${MOD_DEPOTS//$BASE_DEPOTS/} && \
    if [ -n "$MOD_DEPOTS" ]; then \
        for depot in $MOD_DEPOTS; do \
            DepotDownloader -dir ${APPDIR} -app ${APPID} -depot ${depot} -beta ${APPBRANCH}; \
        done; \
    fi

# Fix first run crash and STEAM Validation rejected issue
RUN cp ${APPDIR}/${MOD}/steam_appid.txt ${APPDIR} \
    && touch ${APPDIR}/${MOD}/{banned,listip}.cfg

# Remove unnecessary files
RUN rm -rf linux64 .DepotDownloader utils/ \
    && find . \( \
        -name '*64.so'  -o \
        -name '*.dll'   -o \
        -name '*.dylib' \
    \) -exec rm -rf {} \;

FROM debian:12-slim AS run_stage

# Install required packages
RUN set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
       ca-certificates \
       gdb-minimal \
       lib32stdc++6 \
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

WORKDIR /home/${APPUSER}/${APPDIRNAME}

ARG MOD
ENV MOD=${MOD}

# Set default command
CMD ["bash", "-c", "./hlds_run -game ${MOD} +ip 0.0.0.0 +map $(grep -oE '^\\s*(\\w+)' ./${MOD}/mapcycle.txt | head -n 1 | xargs)"]
