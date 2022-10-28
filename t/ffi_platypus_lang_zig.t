use Test2::V0 -no_srand => 1;
use FFI::Platypus::Lang::Zig;

subtest types => sub {

  my $types = FFI::Platypus::Lang::Zig->native_type_map;

  foreach my $key (sort keys %$types)
  {
    my $val = $types->{$key};
    note sprintf "%-12s = %s\n", $key, $val;
  }

  pass 'good';

};

done_testing;
