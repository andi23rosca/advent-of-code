const std = @import("std");
const utils = @import("utils.zig");

pub fn day1(allocator: *std.mem.Allocator) !usize {
    var numbers = try utils.readNumsFromFile(allocator, "inputs/day1.in");

    var index: usize = 1;
    var count: usize = 0;

    while (index < numbers.items.len) : (index += 1) {
        if (numbers.items[index] > numbers.items[index - 1]) {
            count += 1;
        }
    }

    return count;
}
