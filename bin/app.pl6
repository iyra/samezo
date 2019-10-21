use v6;
use Bailador;
use lib './bin';
use Blog;

my $version = '0.0.1';

my %site;
%site<root> = "./";

sub clean_path($path) {
    return $path.trans([/\.\.*/, /\?.*/] => [".", ""]);
}

sub make_bar($root, $path) {
    $path = clean_path($path);
    my @path_parts = split("/", $path);
}

say blog_init();

get /(.*)/ => sub ($p) {
    template 'index.html', { version => clean_path($p) }
}

baile();
