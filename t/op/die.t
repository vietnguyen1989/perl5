#!./perl

print "1..6\n";

$SIG{__DIE__} = sub { print ref($_[0]) ? ("ok ",$_[0]->[0]++,"\n") : @_ } ;

$err = "ok 1\n";
eval {
    die $err;
};

print "not " unless $@ eq $err;
print "ok 2\n";

$x = [3];
eval { die $x; };

print "not " unless $x->[0] == 4;
print "ok 4\n";

eval {
    eval {
	die [ 5 ];
    };
    die if $@;
};
