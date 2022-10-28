# FFI::Platypus::Lang::Zig ![static](https://github.com/PerlFFI/FFI-Platypus-Lang-Zig/workflows/static/badge.svg) ![linux](https://github.com/PerlFFI/FFI-Platypus-Lang-Zig/workflows/linux/badge.svg)

Documentation and tools for using Platypus with the Zig programming language

# SYNOPSIS

# DESCRIPTION

# EXAMPLES

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
