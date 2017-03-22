class Genre
  attr_reader :genre, :id

  def initialize(options)
    @id = options['id']
    @genre = options['genre']
  end

  def save()
    sql = "INSERT INTO genres(genre) VALUES ('#{@genre}') RETURNING *"
    result = SqlRunner.run(sql)
    @id = result.first()["id"].to_i
  end

  def update()
    sql = "UPDATE genres SET (genres) = ('#{@genre}')
    WHERE id = #{@id}"
    result = SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM genres where id = #{@id}"
    SqlRunner.run(sql)
  end

  def albums
    sql = "SELECT * FROM albums WHERE genre_id = #{@id}"
    result = SqlRunner.run(sql)
    albums = result.map{ |album| Album.new(album)}

  end


  def self.all()
    sql = "SELECT * FROM genres"
    result = SqlRunner.run(sql)
    genres = result.map {|genre| Genre.new(genre)}
  end


end
