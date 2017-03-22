require('pry-byebug')
require_relative('models/album')
require_relative('models/artist')
require_relative('models/genre')


artist2 = Artist.new({
  'name' => 'Danny Brown'
})

artist3 = Artist.new ({
  'name' => 'The Replacements'
  })

  artist2.save()
  artist3.save()

album1 = Album.new({
  'title' => 'Tim',
  'genre_id' => '1',
  'artist_id' => artist3.id
  })

genre1 = Genre.new( {
  'genre' => 'crunk'
})

genre1.save()

album1.save()

binding.pry
nil
