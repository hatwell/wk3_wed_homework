require('pry-byebug')
require_relative('models/album')
require_relative('models/artist')
require_relative('models/genre')


artist2 = Artist.new({
  'name' => 'Danny Brown'
})
artist2.save()

artist3 = Artist.new ({
  'name' => 'The Replacements'
  })
artist3.save()

album1 = Album.new({
  'title' => 'Tim',
  'genre_id' => '1',
  'artist_id' => artist3.id
  })

album1.save()

genre1 = Genre.new( {
  'genre' => 'crunk'
})

genre1.save()

genre2 = Genre.new( {
  'genre' => 'hardcore'
  })
genre2.save()

album4 = Album.new({
'title' => 'Rise Against',
'genre_id' => genre2.id,
'artist_id' => '3'
})

album4.save()

# Genre.delete_all


binding.pry
nil
