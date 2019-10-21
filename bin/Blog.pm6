use v6;
use Bailador;

unit module Blog;

sub get_num() {
    return 12;
}

sub blog_init() is export {
get '/blog' => sub {
    template 'index.html', { version => get_num() }
}

     #return $num;
 }