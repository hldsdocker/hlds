Usage:
```bash
docker build -t hlds-gameserver .
```

```bash
docker run -it --rm --name MyGreatHLDS \
    -p 27016:27016/udp \
    -e SERVER_NAME="MyServer :)" \
    hlds-gameserver
```

Usage with compose file:
```bash
docker-compose up
```

## Environment

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/0cd46f12183f40a4a11ecb53d048943e)](https://app.codacy.com/gh/hlds-docker/hlds?utm_source=github.com&utm_medium=referral&utm_content=hlds-docker/hlds&utm_campaign=Badge_Grade)

```bash
PORT="27016"
MAXPLAYERS="10"
MAP="crossfire"
SERVER_NAME="My HalfLife Server!"
SV_LAN="0"
RCON_PASSWORD=""
```