# 饥荒-联机版 - 专用服务器

[![Automated Docker Builds](https://img.shields.io/docker/automated/mathielo/dst-dedicated-server.svg)](https://cloud.docker.com/repository/docker/mathielo/dst-dedicated-server)
[![Docker Build State](https://img.shields.io/docker/build/mathielo/dst-dedicated-server.svg)](https://cloud.docker.com/repository/docker/mathielo/dst-dedicated-server)
[![Docker Image Pulls](https://img.shields.io/docker/pulls/mathielo/dst-dedicated-server.svg)](https://cloud.docker.com/repository/docker/mathielo/dst-dedicated-server)
[![License: MIT]( https://img.shields.io/github/license/mathielo/dst-dedicated-server.svg)](https://github.com/mathielo/dst-dedicated-server/blob/master/LICENSE.md)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-round)](http://makeapullrequest.com)

饥荒-联机版 专用服务器搭建指南(Linux, Mac, Windows)Docker版

此项目的目的是使用 **最少** 的配置快速搭建出一个饥荒联机版的专用服务器.


## 安装

任何支持 [Docker](https://docs.docker.com/engine/installation/#supported-platforms) 的系统都可以运行这个专用服务器.

>:bulb: Linux 是最推荐使用Docker的高性能操作系统.

改项目主要使用 **Debian 9** 来进行部署测试.侧重Linux.但是其他操作系统应该也没问题.

### 安装指南

#### 必须条件
这些是满足服务器运行的最低条件

* 本地/服务器 软件
  * [安装 Git](#prepare-the-host)
  * [安装 Docker](#install-docker)
* 设置服务器
  * [服务器文件](#prepare-the-dedicated-server) (克隆这个项目)
  * [生成 `cluster_token.txt` 令牌文件](#generate-cluster_tokentxt)
* [管理服务器](docs/ManagingTheServer.md) (知道如何 启动,保存,停止)
* [基础服务器设定](#the-server) (服务器名,密码,其他配置.)

#### 选配设定

根据自己的喜好来配置自己的服务器

* 自定义自己的服务器
  * [调整服务器配置](#the-server) (游戏MOD,玩家人数,Steam组,简介,其他配置.)
  * [世界设定](#the-world) (世界大小,四季,难度,其他配置.)
  * [安装 Mods](DSTClusterConfig/mods)
  * [设置管理员,Ban人,白名单用户](docs/AdminBanWhitelist.md)
* 如何优化你的 [DST服务器性能Tips](docs/ServerPerformance.md)

---

# 准备主机

请阅读 [DST服务器性能Tips](./docs/ServerPerformance.md)来充分利用您的服务器资源.如果你不了解这些，可以看[如何选择服务器](./ServerPerformance.md#picking-a-host) 来帮你选择一台配置合适的主机
<!-- Read about [server performance](./docs/ServerPerformance.md) for useful tips to make the best use of your resources! That might also help you to [pick a host](./ServerPerformance.md#picking-a-host) machine if you're unsure about it. -->

## 安装 Git

    sudo apt-get install git

## 安装 Docker

### Linux
按照Docker官网的 [Get Docker CE for Debian](https://docs.docker.com/install/linux/docker-ce/debian)文档进行安装,第一次看可能觉得复杂，但是文档描述的很详细和透彻
>:cop: 确定您的用户拥有sudo权限，如果已root用户执行可能未在之后遇到权限问题.[_sudoer user_](https://www.digitalocean.com/community/tutorials/how-to-create-a-sudo-user-on-ubuntu-quickstart)

* [Docker Engine CE](https://docs.docker.com/engine/installation/linux/docker-ce/debian/#set-up-the-repository)
* [Docker Compose](https://docs.docker.com/compose/install/#install-compose)
* **重点:** 阅读 :point_right: [post-installation steps for Linux](https://docs.docker.com/engine/installation/linux/linux-postinstall/) :point_left: 来确保你使用的用户具有免sudo使用docker的权限。
  * 设置你的用户可以免`sudo`使用`docker`
  * 配置你的`Docker`为开机启动

### Mac OS / Windows

你只需要下载适合您系统的[Docker desktop standalone](https://docs.docker.com/engine/installation/#desktop)安装文件就可以了，几乎无需配置.

# 准备专用服务器

克隆(clone)这个仓库下来到你的用户目录:

    cd ~ && git clone https://github.com/mathielo/dst-dedicated-server.git

> :cop: **不要**使用`sudo git clone`来操作，不然可能会遇到权限问题.:angel:

从[Managing the Server](./docs/ManagingTheServer.md)查看更多相关信息.

## 生成 `cluster_token.txt` 令牌文件

:warning: 饥荒服务器的令牌文件存储在`DSTClusterConfig/cluster_token.txt`文件中,如果没有这个文件，**饥荒服务器无法启动**.

查看[如何生成Token令牌](./docs/ClusterToken.md)这个文档,并生成自己的Token令牌,替换这个`DSTClusterConfig/cluster_token.txt`文件.文件中不能存在空格或者其他字符

你可以使用如下命令快速替换你的token令牌

    echo 'token字符串' > ~/dst-dedicated-server/DSTClusterConfig/cluster_token.txt

:closed_lock_with_key: 生成令牌的账户会获得管理员权限,管理员可以在游戏里重置世界，使用命令等.

:rainbow: OK! 到这里你就可以启动你的服务器进行游玩啦!


# 管理服务器

你现在应该已有所需的一切！ 请参阅有关[管理服务器](./docs/ManagingTheServer.md)的完整文档，以了解如何**启动**，**保存**游戏和**停止**服务器。

继续阅读[自定义服务器](#customizing-the-server--world)和[安装MOD](#managing-mods)并根据自己的喜好配置.

---

# 自定义服务器和世界设定

如下目录结构和文件列表是配置您喜欢的服务器设定和世界设定的配置文件

> :rotating_light: 除非您知道您在做什么，请勿修改除了下列文件之外的文件.

```
DSTClusterConfig/
  Caves/
    leveldataoverride.lua
  Master/
    leveldataoverride.lua
  mods/
    dedicated_server_mods_setup.lua
    modoverrides.lua
  adminlist.txt
  blocklist.txt
  cluster.ini
  whitelist.txt
```

## 服务器配置

* [DSTClusterConfig/cluster.ini](./DSTClusterConfig/cluster.ini)

此文件包含服务器配置,比如`max_players`(最大玩家数),`pause_when_empty`(无玩家时暂停服务器),`cluster_intention`(游戏模式,合作，竞争，生存等),以及[更多配置 :link:](https://forums.kleientertainment.com/topic/64552-dedicated-server-settings-guide/).


> :bulb: 当你**第一次设置** 时，请至少修改[`cluster_name`](./DSTClusterConfig/cluster.ini#L27)和[`cluster_password`](./DSTClusterConfig/cluster.ini#L29)两个参数，来确保能第一时间从游戏列表中找到.


> :cop: 请小心修改. 有些部分的`[ CHANGE THIS ]`表示需要你修改此处的值,还有一些属性不应该修改,除非你知道你在做什么,不然可能会破坏`Master`(地上)和`Caves`(洞穴)之间的通讯

默认情况下,游戏会在每个游戏日自动保存一次(`autosaver_enabled = true`).

## 世界设定

需要为`Master`(地上)/`Caves`(洞穴)配置对应的世界配置文件:

* [DSTClusterConfig/Master/leveldataoverride.lua](./DSTClusterConfig/Master/leveldataoverride.lua)
* [DSTClusterConfig/Caves/leveldataoverride.lua](./DSTClusterConfig/Caves/leveldataoverride.lua)

你可以根据自己的喜好自定义配置,并请为洞穴指定如下两个配置:

```
    id="DST_CAVE"
    location="Cave"
```

## Mods

查看[详细说明](./DSTClusterConfig/mods)来配置MOD(安装,配置,启用等):alien:

## 管理员,BAN人,白名单

如果你知道你在找啥,`(admin|block|white)list.txt`这些文件可以在[`DSTClusterConfig/`](./DSTClusterConfig)中找到.

您可以在[设置管理员,禁止,白名单](./docs/AdminBanWhitelist.md)文档中找到详细信息和完整指南。

---

# 特约

我们随时欢迎您的贡献和反馈！随意打开一个[问题](/../../issues)或[pull request](/../../pulls)来提交改进

# 参考文献

* [How to setup dedicated server with cave on Linux](http://steamcommunity.com/sharedfiles/filedetails/?id=590565473)
* [Dedicated Server Settings Guide](https://forums.kleientertainment.com/topic/64552-dedicated-server-settings-guide/)
* [Dedicated Server Command Line Options Guide](https://forums.kleientertainment.com/topic/64743-dedicated-server-command-line-options-guide/)

### 其他链接

* [Thread in Klei forums](https://forums.kleientertainment.com/topic/84574-dedicated-server-setup-guide-on-any-platform-windowsmaclinux-with-docker/)
* [Steam Guide](http://steamcommunity.com/sharedfiles/filedetails/?id=1206742951)
