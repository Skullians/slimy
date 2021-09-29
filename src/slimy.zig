pub const cpu = @import("cpu.zig");

pub fn search(
    params: SearchParams,
    context: anytype,
    comptime callback: fn (@TypeOf(context), Result) void,
) !void {
    switch (params.method) {
        .cpu => try cpu.search(params, context, callback, null),
        .gpu => @panic("TODO: gpu search"),
    }
}

pub const SearchParams = struct {
    world_seed: i64,
    threshold: u32,

    x0: i32,
    z0: i32,
    x1: i32,
    z1: i32,

    method: union(enum) {
        cpu: u8, // Thread count
        gpu: void,
    },
};

pub const Result = struct {
    x: i32,
    z: i32,
    count: u32,
};
