package FFI::Platypus::Lang::Zig;

use strict;
use warnings;
use File::ShareDir::Dist qw( dist_share );
use 5.008004;

# ABSTRACT: Documentation and tools for using Platypus with the Zig programming language
# VERSION

my $map;

sub native_type_map
{
  unless($map)
  {
    my %map = (
      u8        => 'uint8',
      u16       => 'uint16',
      u32       => 'uint32',
      u64       => 'uint64',
      # u128 unsupported by Platypus
      i8        => 'sint8',
      i16       => 'sint16',
      i32       => 'sint32',
      i64       => 'sint64',
      # i128 unsupported by Platypus
      # f16 unsupported by Platypus
      f32       => 'float',
      f64       => 'double',
      f128      => 'longdouble',
      anyopaque => 'opaque',
    );

    # computed at installtime:
    # isize, usize, c_short c_ushort c_int c_uint
    # c_longlong c_ulonglong c_longdouble bool

    my $dir = dist_share( 'FFI-Platypus-Lang-Zig' );
    my $map2 = require "$dir/types.pl";

    %map = (%map, %$map2);

    $map = \%map;
  }

  $map;
}

1;

=head1 SYNOPSIS

Zig:

# EXAMPLE: examples/add.zig

Perl:

# EXAMPLE: examples/add.pl

=head1 DESCRIPTION

This module provides native Zig types for FFI::Platypus in order to
reduce cognitive load and concentrate on Zig and forget about C types.
This document also covers using Platypus with Zig, and includes a
number of examples.

Note that in addition to using pre-compiled Zig libraries, you can
bundle Zig code with your Perl distribution using L<FFI::Build> and
L<FFI::Build::File::Zig>.

=head1 EXAMPLES

The examples in this discussion are bundled with this distribution and
can be found in the C<examples> directory.

=head2 Passing and Returning Integers

=head3 Zig Source

# EXAMPLE: examples/add.zig

=head3 Perl Source

# EXAMPLE: examples/add.pl

=head3 Execute

 $ zig build-lib -dynamic add.zig
 $ perl add.pl
 3

=head3 Notes

Basic types like integers and floating points are the easiest to pass
across the FFI boundary.  The Platypus Zig language plugin (this module)
provides the basic types used by Zig (for example: C<bool>, C<i32>, C<u64>,
C<f64>, C<isize> and others) will all work as a Zig programmer would expect.
This is nice because you don't have to think about what the equivalent types
would be in C when you are writing your Perl extension in Zig.

Zig functions do not use the same ABI as C by default, so if you want
to be able to call Zig functions from Perl they need to be declared
with the C calling convention C<callconv(.C)> as in this example.

=head1 METHODS

Generally you will not use this class directly, instead interacting
with the FFI::Platypus instance. However, the public methods used by
Platypus are documented here.

=head2 native_type_map

 my $hashref = FFI::Platypus::Lang::Zig->native_type_map;

This returns a hash reference containing the native aliases for the
Zig programming languages. That is the keys are native Zig types
and the values are libffi native types.

=head1 CAVEATS

Only one example so far!  Hopefully more to come soon.

=head1 SEE ALSO

=over 4

=item L<FFI::Platypus>

The Core Platypus documentation

=item L<Zig Language Reference|https://ziglang.org/documentation/master/>

=back
