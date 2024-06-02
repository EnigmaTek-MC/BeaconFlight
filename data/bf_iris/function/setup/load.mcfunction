#> bf_iris:setup/load
#
# Defines scoreboard objectives and sets up storage if it has not already been done
#
# @handles #minecraft:load

# IDE storage definitions for Spyglass
#define storage bf_iris:data
#define storage bf_iris:args
#define storage bf_iris:settings
#define storage bf_iris:output

# Setup scoreboard and storage
function bf_iris:setup/scoreboard
execute unless data storage bf_iris:data is_setup run function bf_iris:setup/storage
