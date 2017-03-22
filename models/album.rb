class Album

  attr_accessor :title, :genre
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre_id = options['genre_id'].to_i
    @artist_id = options['artist_id'].to_i
  end


  def save()
    sql = "
    INSERT INTO albums (title, genre_id, artist_id) VALUES ('#{@title}', #{@genre_id}, #{@artist_id}
    )
    RETURNING *"
    result = SqlRunner.run(sql)
    @id = result.first()["id"].to_i

  end

  def update()
    sql = "
    UPDATE albums SET (
      title, genre_id, artist_id
    ) = (
      #{@title},
      '#{@genre_id}',
      #{ @artist_id }  )
    WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM albums where id = #{@id}"
    SqlRunner.run(sql)
  end

  def artist
    sql = "SELECT * FROM artists WHERE id = #{@artist_id}"
    result = SqlRunner.run(sql)
    return Customer.new(result[0])
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM albums;"
    albums = SqlRunner.run(sql)
    return albums.map { |album| Album.new( album ) }
  end



end
