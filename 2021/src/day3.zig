const std = @import("std");
const utils = @import("utils.zig");

pub fn day3(allocator: *std.mem.Allocator) !usize {
    var instructions = try utils.readSubmarineInstructions(allocator, "inputs/day3.in");

    var horizontal: usize = 0;
    var depth: usize = 0;

    for(instructions.items) |inst| {
      switch (inst.direction) {
        .forward => {
          horizontal = horizontal + inst.amount;
        },
        .up => {
          depth = depth - inst.amount;
        },
        .down => {
          depth = depth + inst.amount;
        }
      }
    }

    return horizontal * depth;
}