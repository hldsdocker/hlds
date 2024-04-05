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
<table>
    <thead>
        <tr>
            <th>Image</th>
            <th>Tags</th>
            <th>Pulls</th>
            <th>Image size</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>HLDS valve</td>
            <td><a href="https://hub.docker.com/r/hldsdocker/valve/tags"><code>public</code>,
                    <code>steam_legacy</code></a></td>
            <td><a href="https://hub.docker.com/r/hldsdocker/valve"><img
                        src="https://img.shields.io/docker/pulls/hldsdocker/valve?logoColor=blue"
                        alt="Docker Pulls"></a></td>
            <td><a href="https://hub.docker.com/r/hldsdocker/valve"><img
                        src="https://img.shields.io/docker/image-size/hldsdocker/valve?logoColor=blue"
                        alt="Docker Image Size"></a></td>
        </tr>
        <tr>
            <td>HLDS cstrike</td>
            <td><a href="https://hub.docker.com/r/hldsdocker/cstrike/tags"><code>public</code>,
                    <code>steam_legacy</code></a></td>
            <td><a href="https://hub.docker.com/r/hldsdocker/cstrike"><img
                        src="https://img.shields.io/docker/pulls/hldsdocker/cstrike?logoColor=blue"
                        alt="Docker Pulls"></a></td>
            <td><a href="https://hub.docker.com/r/hldsdocker/cstrike"><img
                        src="https://img.shields.io/docker/image-size/hldsdocker/cstrike?logoColor=blue"
                        alt="Docker Image Size"></a></td>
        </tr>
        <tr>
            <td>HLDS czero</td>
            <td><a href="https://hub.docker.com/r/hldsdocker/czero/tags"><code>public</code>,
                    <code>steam_legacy</code></a></td>
            <td><a href="https://hub.docker.com/r/hldsdocker/czero"><img
                        src="https://img.shields.io/docker/pulls/hldsdocker/czero?logoColor=blue"
                        alt="Docker Pulls"></a></td>
            <td><a href="https://hub.docker.com/r/hldsdocker/czero"><img
                        src="https://img.shields.io/docker/image-size/hldsdocker/czero?logoColor=blue"
                        alt="Docker Image Size"></a></td>
        </tr>
        <tr>
            <td>HLDS dod</td>
            <td><a href="https://hub.docker.com/r/hldsdocker/dod/tags"><code>public</code></a></td>
            <td><a href="https://hub.docker.com/r/hldsdocker/dod"><img
                        src="https://img.shields.io/docker/pulls/hldsdocker/dod?logoColor=blue"
                        alt="Docker Pulls"></a></td>
            <td><a href="https://hub.docker.com/r/hldsdocker/dod"><img
                        src="https://img.shields.io/docker/image-size/hldsdocker/dod?logoColor=blue"
                        alt="Docker Image Size"></a></td>
        </tr>
        <tr>
            <td>HLDS gearbox</td>
            <td><a href="https://hub.docker.com/r/hldsdocker/gearbox/tags"><code>public</code></a></td>
            <td><a href="https://hub.docker.com/r/hldsdocker/gearbox"><img
                        src="https://img.shields.io/docker/pulls/hldsdocker/gearbox?logoColor=blue"
                        alt="Docker Pulls"></a></td>
            <td><a href="https://hub.docker.com/r/hldsdocker/gearbox"><img
                        src="https://img.shields.io/docker/image-size/hldsdocker/gearbox?logoColor=blue"
                        alt="Docker Image Size"></a></td>
        </tr>
        <tr>
            <td>HLDS tfc</td>
            <td><a href="https://hub.docker.com/r/hldsdocker/tfc/tags"><code>public</code></a></td>
            <td><a href="https://hub.docker.com/r/hldsdocker/tfc"><img
                        src="https://img.shields.io/docker/pulls/hldsdocker/tfc?logoColor=blue"
                        alt="Docker Pulls"></a></td>
            <td><a href="https://hub.docker.com/r/hldsdocker/tfc"><img
                        src="https://img.shields.io/docker/image-size/hldsdocker/tfc?logoColor=blue"
                        alt="Docker Image Size"></a></td>
        </tr>
        <tr>
            <td>HLDS ricochet</td>
            <td><a href="https://hub.docker.com/r/hldsdocker/ricochet/tags"><code>public</code></a></td>
            <td><a href="https://hub.docker.com/r/hldsdocker/ricochet"><img
                        src="https://img.shields.io/docker/pulls/hldsdocker/ricochet?logoColor=blue"
                        alt="Docker Pulls"></a></td>
            <td><a href="https://hub.docker.com/r/hldsdocker/ricochet"><img
                        src="https://img.shields.io/docker/image-size/hldsdocker/ricochet?logoColor=blue"
                        alt="Docker Image Size"></a></td>
        </tr>
        <tr>
            <td>HLDS dmc</td>
            <td><a href="https://hub.docker.com/r/hldsdocker/dmc/tags"><code>public</code></a></td>
            <td><a href="https://hub.docker.com/r/hldsdocker/dmc"><img
                        src="https://img.shields.io/docker/pulls/hldsdocker/dmc?logoColor=blue"
                        alt="Docker Pulls"></a></td>
            <td><a href="https://hub.docker.com/r/hldsdocker/dmc"><img
                        src="https://img.shields.io/docker/image-size/hldsdocker/dmc?logoColor=blue"
                        alt="Docker Image Size"></a></td>
        </tr>
    </tbody>
</table>

### Tags
<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><code>public</code></td>
            <td>Latest depots update</td>
        </tr>
        <tr>
            <td><code>steam_legacy</code></td>
            <td>Pre-25th Anniversary Build</td>
        </tr>
    </tbody>
</table>

### How it works
At [00:00 on Sunday](https://github.com/hldsdocker/hlds/blob/67b4583a400a210b87198b923be6c6fa128bc0d4/.github/workflows/CI.yml#L12C3-L13C24) using [GitHub Actions](https://github.com/hldsdocker/hlds/actions), all images are automatically [rebuilt and published](https://github.com/hldsdocker/hlds/blob/67b4583a400a210b87198b923be6c6fa128bc0d4/.github/workflows/CI.yml#L54-L66) to Docker Hub (https://hub.docker.com/u/hldsdocker). 

The description for Docker Hub repositories (of each mod) is dynamically generated [using CI](.github\workflows\dockerhub-description.yml) from the [template](.github/.teamplate-README.md). 

## Technical Definitions
### Depots
A depot is a logical grouping of files which are all delivered to a customer as a single group.

<table>
    <thead>
        <tr>
            <th>Content files</th>
            <th>URL</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Base Goldsrc Shared Content</td>
            <td><a href="https://steamdb.info/depot/1/">https://steamdb.info/depot/1/</a></td>
        </tr>
        <tr>
            <td>Counter-Strike Base Content</td>
            <td><a href="https://steamdb.info/depot/11/">https://steamdb.info/depot/11/</a></td>
        </tr>
        <tr>
            <td>Condition Zero Base Content</td>
            <td><a href="https://steamdb.info/depot/81/">https://steamdb.info/depot/81/</a></td>
        </tr>
    </tbody>
</table>

[Read more about depots](https://partner.steamgames.com/doc/store/application/depots) in Steamworks documentation.

### Branches
An application can have multiple branches. Other than the "public" branch, there can be other branches. Other branches are often used for storing an older version of the game for people to downgrade to, or for testing new patches/content. These can often be found in the "Betas" tab in the app's properties in the Steam client. Some branches might require a password, and they won't be visible in the drop-down list until the correct password is entered.

A list of possible branches and depots can be found here:
<table>
    <thead>
        <tr>
            <th>Game</th>
            <th>Depots link</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>valve</td>
            <td><a href="https://steamdb.info/app/70/depots/">https://steamdb.info/app/70/depots/</a></td>
        </tr>
        <tr>
            <td>cstrike</td>
            <td><a href="https://steamdb.info/app/10/depots/">https://steamdb.info/app/10/depots/</a></td>
        </tr>
        <tr>
            <td>сzero</td>
            <td><a href="https://steamdb.info/app/80/depots/">https://steamdb.info/app/80/depots/</a></td>
        </tr>
    </tbody>
</table>


[Read more about branches](https://partner.steamgames.com/doc/store/application/branches) in Steamworks documentation.

## Secrets and Variables for GitHub Actions
<table>
    <thead>
        <tr>
            <th>Type</th>
            <th>Key</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Variable</td>
            <td><code>DOCKER_USERNAME</code></td>
            <td>DockerHub user account</td>
        </tr>
        <tr>
            <td>Secret</td>
            <td><code>DOCKER_PASSWORD</code></td>
            <td>DockerHub user password</td>
        </tr>
    </tbody>
</table>

Read more about [secrets](https://docs.github.com/en/actions/learn-github-actions/variables#using-the-vars-context-to-access-configuration-variable-values) and [variables](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions)
 in GitHub Docs.