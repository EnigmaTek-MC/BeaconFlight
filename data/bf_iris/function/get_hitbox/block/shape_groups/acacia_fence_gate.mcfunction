execute if block ~ ~ ~ #bf_iris:shape_groups/acacia_fence_gate[facing=north, in_wall=true] run data modify storage bf_iris:data Shape set value [{min: [0.0, 0.0, 0.375], max: [1.0, 0.8125, 0.625]}]
execute if block ~ ~ ~ #bf_iris:shape_groups/acacia_fence_gate[facing=north, in_wall=false] run data modify storage bf_iris:data Shape set value [{min: [0.0, 0.0, 0.375], max: [1.0, 1.0, 0.625]}]
execute if block ~ ~ ~ #bf_iris:shape_groups/acacia_fence_gate[facing=south, in_wall=true] run data modify storage bf_iris:data Shape set value [{min: [0.0, 0.0, 0.375], max: [1.0, 0.8125, 0.625]}]
execute if block ~ ~ ~ #bf_iris:shape_groups/acacia_fence_gate[facing=south, in_wall=false] run data modify storage bf_iris:data Shape set value [{min: [0.0, 0.0, 0.375], max: [1.0, 1.0, 0.625]}]
execute if block ~ ~ ~ #bf_iris:shape_groups/acacia_fence_gate[facing=west, in_wall=true] run data modify storage bf_iris:data Shape set value [{min: [0.375, 0.0, 0.0], max: [0.625, 0.8125, 1.0]}]
execute if block ~ ~ ~ #bf_iris:shape_groups/acacia_fence_gate[facing=west, in_wall=false] run data modify storage bf_iris:data Shape set value [{min: [0.375, 0.0, 0.0], max: [0.625, 1.0, 1.0]}]
execute if block ~ ~ ~ #bf_iris:shape_groups/acacia_fence_gate[facing=east, in_wall=true] run data modify storage bf_iris:data Shape set value [{min: [0.375, 0.0, 0.0], max: [0.625, 0.8125, 1.0]}]
execute if block ~ ~ ~ #bf_iris:shape_groups/acacia_fence_gate[facing=east, in_wall=false] run data modify storage bf_iris:data Shape set value [{min: [0.375, 0.0, 0.0], max: [0.625, 1.0, 1.0]}]
