const std = @import("std");

const day1 = @import("day1.zig").day1;
const day2 = @import("day2.zig").day2;
const day3 = @import("day3.zig").day3;
const day4 = @import("day4.zig").day4;

pub fn main() anyerror!void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();

    var allocator = &arena.allocator;

    std.log.info("day1: {d}", .{try day1(allocator)});
    std.log.info("day2: {d}", .{try day2(allocator)});
    std.log.info("day3: {d}", .{try day3(allocator)});
    std.log.info("day4: {d}", .{try day4(allocator)});
}