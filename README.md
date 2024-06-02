# Beacon flight
Exactly what it says on the tin - this datapack allows players to fly when in range of an activated beacon.

The effect works exactly like a normal beacon effect, with the same range and duration for each different beacon level.

## Controls
- Shift + look up to activate the flight, or boost upward if the flight is already active.
- Shift + look down to boost downwards, or deactivate the flight if on the ground.
###
- `/trigger beacon_flight.help`
  - Tells the player if flight is enabled for them (see below), and details the controls if it is enabled.

## Player-specific configuration
- This can be changed by server admins or other datapacks
- It defaults to active - this can be changed in the `data/beacon_flight/player_init.mcfunction` file, by changing the first line.
- `scoreboard players set <player> beacon_flight.enabled [0/1]`

# Credits
- [Aeldrion's Iris](https://github.com/Aeldrion/Iris) raycasting library
  - Used for marking beacons when placed.
