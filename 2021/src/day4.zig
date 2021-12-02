const std = @import("std");
const utils = @import("utils.zig");

pub fn day4(allocator: *std.mem.Allocator) !usize {
    var instructions = try utils.readSubmarineInstructions(allocator, "inputs/day4.in");

    var horizontal: usize = 0;
    var depth: usize = 0;
    var aim: usize = 0;

    for(instructions.items) |inst| {
      switch (inst.direction) {
        .forward => {
          horizontal = horizontal + inst.amount;
          depth = depth + aim * inst.amount;
        },
        .up => {
          aim = aim - inst.amount;
        },
        .down => {
          aim = aim + inst.amount;
        }
      }
    }

    return horizontal * depth;
}