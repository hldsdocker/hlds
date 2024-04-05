[![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/hldsdocker/hlds/CI.yml?logo=github&logoColor=white)](https://github.com/hldsdocker/hlds/actions/workflows/CI.yml)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/110aad918e184a51956adf55f6e770b3)](https://app.codacy.com/gh/hldsdocker/hlds/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)

<p align="center">
    <img src="https://avatars.githubusercontent.com/u/165314416" alt="Half-Life Docker logo" width=200>
</p>

## About
Automated builder of Docker images for Half-Life Dedicated Server (HLDS).

[DepotsDownloader](https://github.com/SteamRE/DepotDownloader/) is used to download HLDS. It has advantages over [SteamCMD](https://developer.valvesoftware.com/wiki/SteamCMD), has a minimum of dependencies, [easy installation](https://github.com/hldsdocker/hlds/blob/67b4583a400a210b87198b923be6c6fa128bc0d4/Dockerfile#L23-L26), doesn't have the [issues](https://developer.valvesoftware.com/wiki/SteamCMD#Only_the_HLDS_Engine_is_Downloaded) that SteamCMD users are experiencing.

The base image is [Debian](https://hub.docker.com/_/debian).

### Images
| Image | Tags | Pulls | Image size |
| - | - | - | - |
| HLDS valve | [`public`, `steam_legacy`](https://hub.docker.com/r/hldsdocker/valve/tags) | [![Docker Pulls](https://img.shields.io/docker/pulls/hldsdocker/valve?logo=docker&logoColor=blue)](https://hub.docker.com/r/hldsdocker/valve) | [![Docker Image Size](https://img.shields.io/docker/image-size/hldsdocker/valve?logo=docker&logoColor=blue)](https://hub.docker.com/r/hldsdocker/valve) |
| HLDS cstrike | [`public`, `steam_legacy`](https://hub.docker.com/r/hldsdocker/cstrike/tags) | [![Docker Pulls](https://img.shields.io/docker/pulls/hldsdocker/cstrike?logo=docker&logoColor=blue)](https://hub.docker.com/r/hldsdocker/cstrike) | [![Docker Image Size](https://img.shields.io/docker/image-size/hldsdocker/cstrike?logo=docker&logoColor=blue)](https://hub.docker.com/r/hldsdocker/cstrike) |
| HLDS czero | [`public`, `steam_legacy`](https://hub.docker.com/r/hldsdocker/czero/tags) | [![Docker Pulls](https://img.shields.io/docker/pulls/hldsdocker/czero?logo=docker&logoColor=blue)](https://hub.docker.com/r/hldsdocker/czero) | [![Docker Image Size](https://img.shields.io/docker/image-size/hldsdocker/czero?logo=docker&logoColor=blue)](https://hub.docker.com/r/hldsdocker/czero) |
| HLDS dod | [`public`](https://hub.docker.com/r/hldsdocker/dod/tags) | [![Docker Pulls](https://img.shields.io/docker/pulls/hldsdocker/dod?logo=docker&logoColor=blue)](https://hub.docker.com/r/hldsdocker/dod) | [![Docker Image Size](https://img.shields.io/docker/image-size/hldsdocker/dod?logo=docker&logoColor=blue)](https://hub.docker.com/r/hldsdocker/dod) |
| HLDS gearbox | [`public`](https://hub.docker.com/r/hldsdocker/gearbox/tags) | [![Docker Pulls](https://img.shields.io/docker/pulls/hldsdocker/gearbox?logo=docker&logoColor=blue)](https://hub.docker.com/r/hldsdocker/gearbox) | [![Docker Image Size](https://img.shields.io/docker/image-size/hldsdocker/gearbox?logo=docker&logoColor=blue)](https://hub.docker.com/r/hldsdocker/gearbox) |

### Tags
| Name | Description |
| - | - |
| `public` | Latest depots update |
| `steam_legacy` | Pre-25th Anniversary Build |

### How it works
At [00:00 on Sunday](https://github.com/hldsdocker/hlds/blob/67b4583a400a210b87198b923be6c6fa128bc0d4/.github/workflows/CI.yml#L12C3-L13C24) using [GitHub Actions](https://github.com/hldsdocker/hlds/actions), all images are automatically [rebuilt and published](https://github.com/hldsdocker/hlds/blob/67b4583a400a210b87198b923be6c6fa128bc0d4/.github/workflows/CI.yml#L54-L66) to Docker Hub (https://hub.docker.com/u/hldsdocker). 

The description for Docker Hub repositories (of each mod) is dynamically generated [using CI](.github\workflows\dockerhub-description.yml) from the [template](.github/.teamplate-README.md). 

## Technical Definitions
### Depots
A depot is a logical grouping of files which are all delivered to a customer as a single group.

| Content files | URL |
| - | - |
| Base Goldsrc Shared Content | https://steamdb.info/depot/1/   |
| Counter-Strike Base Content | https://steamdb.info/depot/11/  |
| Condition Zero Base Content | https://steamdb.info/depot/81/  |

[Read more about depots](https://partner.steamgames.com/doc/store/application/depots) in Steamworks documentation.

### Branches
An application can have multiple branches. Other than the "public" branch, there can be other branches. Other branches are often used for storing an older version of the game for people to downgrade to, or for testing new patches/content. These can often be found in the "Betas" tab in the app's properties in the Steam client. Some branches might require a password, and they won't be visible in the drop-down list until the correct password is entered.

A list of possible branches and depots can be found here:
| Game | Depots link |
| - | - |
| valve     | https://steamdb.info/app/70/depots/ |
| cstrike   | https://steamdb.info/app/10/depots/ |
| сzero     | https://steamdb.info/app/80/depots/ |


[Read more about branches](https://partner.steamgames.com/doc/store/application/branches) in Steamworks documentation.

## Secrets and Variables for GitHub Actions
| Type | Key | Description |
| - | - | - |
| Variable  | `DOCKER_USERNAME` | DockerHub user account |
| Secret    | `DOCKER_PASSWORD` | DockerHub user password |

Read more about [secrets](https://docs.github.com/en/actions/learn-github-actions/variables#using-the-vars-context-to-access-configuration-variable-values) and [variables](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions)
 in GitHub Docs.