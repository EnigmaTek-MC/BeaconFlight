#> bf_iris:setup/storage
#
# Sets up storage for bf_iris
#
# @within bf_iris:setup/load

data merge storage bf_iris:data {is_setup: 1b}

# Set default settings
data merge storage bf_iris:settings {\
    TargetEntities: false,\
    MaxRecursionDepth: 16,\
    Blacklist: "#bf_iris:shape_groups/air"\
}
