# rebot-docker
Docker setup for [REBot](https://github.com/Cryptogenic/REBot).

I decided to set this up since the limit of 100 servers was reached for the public REBot, so I had to self-host it.

## Setup
Ensure you have a recent version of Docker installed before moving on. 

```shell
$ git clone https://github.com/nicolaipre/rebot-docker.git
$ cd rebot-docker

# insert your Discord Bot token in config.ini:
$ sed -i 's/token =/token = YOURTOKEN/g' config.ini

# build
$ make build
```

### Obtaining a bot token
- Create a bot @ https://discord.com/developers/applications
    - Ensure "Message Content Intent" is set to enabled
    - Copy the token from the "Bot" page.

- In the Discord Developer Portal:
    - Go to OAuth -> URL Generator
    - Make sure "bot" is checked
    - Give the bot appropriate permissions
    - Copy URL and paste in browser to invite bot to server

### Developer Commands
- To use these, simply replace the value `1337` in `Dockerfile:22` with your Discord user ID, and then rebuild.
