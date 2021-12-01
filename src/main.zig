const std = @import("std");

const day1 = @import("day1.zig").day1;
const day2 = @import("day2.zig").day2;

pub fn main() anyerror!void {
    var allocator = std.heap.page_allocator;

    std.log.info("day1: {d}", .{try day1(allocator)});
    std.log.info("day2: {d}", .{try day2(allocator)});
}