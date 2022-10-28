# FFI::Platypus::Lang::Zig ![static](https://github.com/PerlFFI/FFI-Platypus-Lang-Zig/workflows/static/badge.svg) ![linux](https://github.com/PerlFFI/FFI-Platypus-Lang-Zig/workflows/linux/badge.svg)

Documentation and tools for using Platypus with the Zig programming language

# SYNOPSIS

Zig:

```
const std = @import("std");

export fn add(a: i32, b: i32) callconv(.C) i32 {
    return a + b;
}
```

Perl:

```perl
use FFI::Platypus 2.00;
use FFI::CheckLib qw( find_lib_or_die );
use File::Basename qw( dirname );

my $ffi = FFI::Platypus->new( api => 2, lang => 'Zig' );
$ffi->lib(
  find_lib_or_die(
    lib        => 'add',
    libpath    => [dirname __FILE__],
    systempath => [],
  )
);

$ffi->attach( add => ['i32','i32'] => 'i32' );

print add(1,2), "\n";  # prints 3
```

# DESCRIPTION

This module provides native Zig types for FFI::Platypus in order to
reduce cognitive load and concentrate on Zig and forget about C types.
This document also covers using Platypus with Zig, and includes a
number of examples.

Note that in addition to using pre-compiled Zig libraries, you can
bundle Zig code with your Perl distribution using [FFI::Build](https://metacpan.org/pod/FFI::Build) and
[FFI::Build::File::Zig](https://metacpan.org/pod/FFI::Build::File::Zig).

# EXAMPLES

The examples in this discussion are bundled with this distribution and
can be found in the `examples` directory.

## Passing and Returning Integers

### Zig Source

```
const std = @import("std");

export fn add(a: i32, b: i32) callconv(.C) i32 {
    return a + b;
}
```

### Perl Source

```perl
use FFI::Platypus 2.00;
use FFI::CheckLib qw( find_lib_or_die );
use File::Basename qw( dirname );

my $ffi = FFI::Platypus->new( api => 2, lang => 'Zig' );
$ffi->lib(
  find_lib_or_die(
    lib        => 'add',
    libpath    => [dirname __FILE__],
    systempath => [],
  )
);

$ffi->attach( add => ['i32','i32'] => 'i32' );

print add(1,2), "\n";  # prints 3
```

### Execute

```
$ zig build-lib -dynamic add.zig
$ perl add.pl
3
```

### Notes

Basic types like integers and floating points are the easiest to pass
across the FFI boundary.  The Platypus Zig language plugin (this module)
provides the basic types used by Zig (for example: `bool`, `i32`, `u64`,
`f64`, `isize` and others) will all work as a Zig programmer would expect.
This is nice because you don't have to think about what the equivalent types
would be in C when you are writing your Perl extension in Zig.

Zig functions do not use the same ABI as C by default, so if you want
to be able to call Zig functions from Perl they need to be declared
with the C calling convention `callconv(.C)` as in this example.

# METHODS

Generally you will not use this class directly, instead interacting
with the FFI::Platypus instance. However, the public methods used by
Platypus are documented here.

## native\_type\_map

```perl
my $hashref = FFI::Platypus::Lang::Zig->native_type_map;
```

This returns a hash reference containing the native aliases for the
Zig programming languages. That is the keys are native Zig types
and the values are libffi native types.

# CAVEATS

Only one example so far!  Hopefully more to come soon.

# SEE ALSO

- [FFI::Platypus](https://metacpan.org/pod/FFI::Platypus)

    The Core Platypus documentation

- [Zig Language Reference](https://ziglang.org/documentation/master/)

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2022 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
