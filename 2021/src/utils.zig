const std = @import("std");

pub fn readFile(allocator: *std.mem.Allocator, filePath: []const u8) ![]u8 {
  var buff = try allocator.alloc(u8, 100000);
  var contents = try std.fs.cwd().readFile(filePath, buff);
  return contents;
}

pub fn readNumsFromFile(allocator: *std.mem.Allocator, filePath: []const u8) !*std.ArrayList(usize) {
  var contents = try readFile(allocator, filePath);
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

const Direction = enum { forward, down, up };
const Instruction = struct {
  direction: Direction,
  amount: usize
};

pub fn readSubmarineInstructions(allocator: *std.mem.Allocator, filePath: []const u8) !*std.ArrayList(Instruction) {
  var contents = try readFile(allocator, filePath);
  var instructions = std.ArrayList(Instruction).init(allocator);
  var index: usize = 0;

  while(index < contents.len) {
    if(contents[index] == 'f') {
      try instructions.append(Instruction{
        .direction = .forward,
        .amount = contents[index + 8] - 48,
      });
      index += 10;
    } else if(contents[index] == 'u') {
      try instructions.append(Instruction{
        .direction = .up,
        .amount = contents[index + 3] - 48,
      });
      index += 5;
    } else {
      try instructions.append(Instruction{
        .direction = .down,
        .amount = contents[index + 5] - 48,
      });
      index += 7;
    }
  }

  return &instructions;
}