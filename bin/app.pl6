use v6;
use Bailador;
use lib './bin';
use Blog;

my $version = '0.0.1';

my %site;
%site<root> = "./";

sub clean_path($path) {
    return $path.trans([/\.\.*/, # replace ..
			/\?.*/, # replace ?xyz
			/^(\/)/ # replace beginning /
		       ] => [".", "", ""]);
}

sub make_bar(Str $root, Str $path, Int $depth) {
    my $temp_out = "";
    my @this_dir = $root.IO.dir();
    if $depth >= 0 {
	@this_dir = ($root ~ join('/', split('/', $path)[0..$depth])).IO.dir();
    }
    for @this_dir -> $d {
	if elems(split('/', $path)) >= $depth+1 and $d eq $root ~ join('/', split('/', $path)[0..$depth+1]) {
	    $temp_out ~= "<b><li>" ~ $d.IO.basename ~ "</li></b>";
	    if $d.IO.d {
		$temp_out ~= "<ul>" ~ make_bar($root, $path, $depth+1) ~ "</ul>";
	    }
	} else {
	    $temp_out ~= "<li>" ~ $d.IO.basename ~ "</li>";

	}
    }
    return $temp_out;
    
}

say blog_init();

get /(.*)/ => sub ($p) {
    template 'index.html', { version => make_bar("/home/iyra/", clean_path($p), -1) }
}

baile();
