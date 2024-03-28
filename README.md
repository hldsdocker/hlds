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
```bash
PORT="27016"
MAXPLAYERS="10"
MAP="crossfire"
SERVER_NAME="My HalfLife Server!"
SV_LAN="0"
RCON_PASSWORD=""
```