# Setting Admins, Bans and Whitelisted Players

You can grant admin and whitelist privileges - or ban players - by adding their **unique identifier** to the desired file. The relevant files can be found in the [`DSTClusterConfig/`](./DSTClusterConfig) folder.

```
DSTClusterConfig/
  adminlist.txt
  blocklist.txt
  whitelist.txt
```

See below what each of these actually means and [how to get the players identifiers](#how-to-retrieve-players-unique-identifiers).

## Admin (`adminlist.txt`)

![With great power comes great responsibility](https://media1.tenor.com/images/4c3b395bb7e3b40b780ac97f287b6ab3/tenor.gif)

Grant admin powers with :rotating_light: caution :rotating_light:. As per the [official Wiki](http://dontstarve.wikia.com/wiki/Guides/Don%E2%80%99t_Starve_Together_Dedicated_Servers#Administration):

> An administrator has the ability to kick and ban users in the game, as well as to execute arbitrary lua on the server.
> **WARNING:** Only grant administrator rights to those who the GSA would trust with full access to their server / machine.

## Whitelist (`whitelist.txt`)

Whitelisted players have **guaranteed** access to your server at all times, regardless.

Examples:

* A server supports 8 players and you whitelist 3 players. Regardless whether these 3 players are currently connected to the server **or not**, you server will only have 5 **public** slots. Only 5 random people will be able to join at a time, and those 3 players can join whenever.
* A server supports 6 players and you whitelisted 6 players. **No one** that is not on the whitelist will be able to join.

## Block / Ban (`blocklist.txt`)

Quite straightforward. Don't want someone messing around your world? Add them to this list.

:bulb: Remember you can kick/ban players from the game interface! That will add the player to the `blocklist.txt` file automatically for you.

# How to retrieve player's unique identifiers

The identifiers are **usually** (they might vary a bit) 11 characters long, always prefixed by `KU_` followed by 8 (or more) alphanumeric characters (`[a-zA-Z0-9]`). Examples: `KU_A1b2C3d4`, `KU_aAaA11bB`, `KU_zyXWFegd`.

Once you have the ids, add them - one per line - in the file you want. Example of `adminlist.txt`:

```
KU_A1b2C3d4
KU_aAaA11bB
KU_zyXWFegd
```

There are a few ways to get the player identifier. Here's 2 methods for you to choose the one that suits you best:

## Server logs

Easiest one if you have access to the server logs. Watch the logs (`tail -f` - or however you prefer) while the desired player is joining. You'll see some messages like these:

```
[01:52:27]: New incoming connection 123.123.123.123|44444     -- IP Address|Port from client connecting
[01:52:27]: Client connected from 123.123.123.123|44444
[01:52:27]: ValidateGameSessionToken pgs-usc^KU_aBCd1234^DontStarveTogether^1cx+crazyEncryptedTokenHash/yolol9=
[01:52:28]: Client authenticated: (KU_aBCd1234) WesIsTheBes
```

:point_up: You can see the identifier shows up twice. It's easier to visualize in the last line, where you can also see the player's nickname on Steam. From this example:

* Player unique identifier: `KU_aBCd1234`
* Player name on Steam: `WesIsTheBes` (:thinking_face:)

## Ban the player through the game interface

Sounds weird but it works quite well. This way the player id will show up in `blocklist.txt`. All you have to do is to **move** it from there to your desired `adminlist.txt` or `whitelist.txt`.

> :point_up: Don't forget to actually (re)move it from `blocklist.txt` or that player won't be able to join the server! :cold_sweat:
