const std = @import("std");

pub fn readNumsFromFile(allocator: *std.mem.Allocator, filePath: []const u8) !*std.ArrayList(usize) {
  var buff = try allocator.alloc(u8, 100000);
  defer allocator.free(buff);

  var contents = try std.fs.cwd().readFile(filePath, buff);

  var numbers = std.ArrayList(usize).init(allocator);
  var builder: usize = 0;

  for(contents) |char| {
    if(char == '\n') {
      try numbers.append(builder);
      builder = 0;
    } else {
      builder = builder * 10 + char - 48;
    }
  }
  if(builder != 0) try numbers.append(builder);

  return &numbers;
}