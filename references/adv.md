# START

You see a cave.

Directions:
* Enter [goto ROOM1]
* Leave [goto END]

# ROOM1

You are at the entrance. It's a bit dark.

Enemies:
* Goblin, sleeping

Directions:
* Next room [if no SIT][goto ROOM2]
* Leave [goto END]

## [SIT] On enter

Goblin is asleep. What do you do?

Options:
* Sneak past [roll: win goto ROOM2, lose fight]
* Kill goblin [roll: win kill and options, lose fight]
* Wake gobling [fight] 

## [SIT] After loot

There's a new enemy.

Enemies:
* Small goblin, fight

# ROOM2

Airy room. Lots of space.

Items:
* Sword

Directions:
* East [goto ROOM3]
* West [goto ROOM4]
* South [goto ROOM6]
* North [goto ROOM1]

# ROOM3

Small study.

Items:
* Coin purse

Directions:
* West [goto ROOM2]
* South [goto ROOM6]

# ROOM4

Barracks, goblins training.

Enemies:
* 3 small goblins, fight

Directions:
* East [goto ROOM2]
* South [hidden][goto ROOM6]

# ROOM5

Hole in the wall.

Item:
* Treasure hoard

Directions:
* North [goto ROOM4]

# ROOM6

Throne room.

Enemy:
* Goblin king, fight (talk in the future?)

Directions:
* North 1 [goto ROOM2]
* North 2 [goto ROOM2]

# ROOM7

Treasure room.

Items:
* Large treasure hoard

Directions:
* North [goto ROOM6]
