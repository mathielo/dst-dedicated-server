# Don't Starve Together - Dedicated Server Performance

Here you'll find tips on how to improve and get the best performance from your Don't Starve Together dedicated server. Check the requirements for optimal usage of the resources you have available.

## Server Resources

These are the resources that matters when running a dedicated server.

### CPU

> **Recommended:** 1 CPU core available **per shard**.

A _regular_ world consists of two shards: Forest + Caves. The shards themselves won’t multithread, so having many CPU cores won’t matter. It’s best to have better CPU power per core, and one CPU core available for **each** shard.

### RAM

> **Recommended:** `1Gb` RAM available **for each shard**; Have a plan to upgrade if needed.

Having `1Gb` of RAM available for **each** shard should be enough for _most_ setups. 

A shard may use more RAM depending on world age (how many days have passed) and amount of players, so it's advised to check on the server performance (`docker stats`) every now and then. 

### Network

> **Recommended:** Solid, stable network connection with good throughput/upload rate.

That’s super important. The lower the ping the better the player experience. To have a good and stable connection is **a must**.

If you have players from different locations, the host would optimally be in a “central” location related to the player's geographical placement.

### SSD 

> **Recommended:** SSD is preferable over HDD. 

The only performance gains on an SSD over a HDD would be when starting up the server and during the daily autosaves. Might be worth it if the users experience lag every new day when the game saves.

### Other notes

* The dedicated server does not depend on GPU (Video Cards), only the game client benefits from them.
* Watch for anything else on the host machine that might be using resources (OS, other programs / processes) and take their usage into account.

---

## Picking a Host

Now that you know what resource matters for the dedicated server, it's time to chose _where_ (in what machine) to host it.

### OS (Operating System)

This server will run on any OSs [supported by Docker](https://docs.docker.com/install/#supported-platforms). Bear in mind that different OSs have diferent **resouce** needs, so the less the OS uses, the more you have available for your server to run.

For this reason, **Linux** is the recommended platform, specially if you are comfortable with CLI and can run a server edition without any GUI. That's the most resource-efficient way of running your server.

Whichever OS you choose, make sure to check it's own resource requirements and add up with the following ones to guarantee a smooth server.

### Hosting locally, in your own computer

First and foremost thing you need to have in mind when hosting in your own computer is: along with the OS and the dedicated server, you'll also have the **game client** competing for resources. So when taking this approach, make sure you have enough RAM and CPU power to handle it all! 

> _Most_ quad-cores with at least `4Gb` RAM should be able to handle it without any problems. But sill, if you run into performance issues remember you have your OS vs. the dedicated server vs. the game client, all of them _fighting_ for your computer resources!
 
#### Benefits

* Zero investment needed
* Players joining over LAN will hardly have any connection issues

#### Downsides / Watch out for

* Resources available vs. Server (and game client) performance
* You need a solid internet connection if players are joining remotely

### Hosting in a VPS (Virtual Private Server)

The VPS is a great solution as you'll have a solid connection and resources dedicated entirely for your server. The major downside of this option is that you'll need to _rent_ a VPS, so there's costs involved. If you (and your friends) are willing to _invest_ a tiny amount you can find good VPS solutions for about $10/month. 

This becomes an even better solution if you choose a Linux server distro, as your OS would require minimal resources for itself, leaving most of it available for your dedicated server. 

> When choosing a VPS solution, make sure to get one that **does not** work based on _CPU credits_ concept. Once the server is running the shards _idle_ at about \~30% CPU usage; when players connect they keep at 90\~100% constantly. Therefore pick a service that allows you to use the resources in its full otherwise you'll run into trouble.

#### Benefits

* Make the best use of the machine's resources
* Easy to find a service in a good location (low ping)
* Can be very cheap if splitting the bill with friends

#### Downsides / Watch out for

* There's costs involved
* Can be challenging at first if you never rented a VPS before or don't feel comfortable with managing a server through shell commands
