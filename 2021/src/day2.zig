const std = @import("std");
const utils = @import("utils.zig");

pub fn day2(allocator: *std.mem.Allocator) !usize {
    var numbers = try utils.readNumsFromFile(allocator, "inputs/day2.in");

    var index: usize = 3;
    var count: usize = 0;

    while (index < numbers.items.len) : (index += 1) {
        if (numbers.items[index] > numbers.items[index - 3]) {
            count += 1;
        }
    }

    return count;
}
