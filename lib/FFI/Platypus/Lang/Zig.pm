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

=head1 DESCRIPTION

=head1 EXAMPLES

=head1 METHODS

Generally you will not use this class directly, instead interacting
with the FFI::Platypus instance. However, the public methods used by
Platypus are documented here.

=head2 native_type_map

 my $hashref = FFI::Platypus::Lang::Zig->native_type_map;

This returns a hash reference containing the native aliases for the
Zig programming languages. That is the keys are native Zig types
and the values are libffi native types.

=head1 SEE ALSO

=over 4

=item L<FFI::Platypus>

The Core Platypus documentation

=item L<Zig Language Reference|https://ziglang.org/documentation/master/>

=back
