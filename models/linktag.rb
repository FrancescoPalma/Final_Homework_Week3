require 'pg'

class Linktag 

  attr_reader :url, :name, :genre, :description, :id

  def initialize(options)
    @url = options["url"]
    @name = options["name"]
    @genre = options["genre"]
    @description = options["description"]
    @id = options["id"]
  end

  def save
    sql = "INSERT INTO linktags (
      url, 
      name,
      genre,
      description
      ) VALUES (
      '#{@url}',
      '#{@name}',
      '#{@genre}',
      '#{@description}'
      )"
      Linktag.run_sql(sql)
  end

  def self.all
    linktags = Linktag.run_sql("SELECT * FROM linktags")
    result = linktags.map {|linktag| Linktag.new(linktag)}
    return result
  end

  def self.select(id)
    linktag = Linktag.run_sql("SELECT * FROM linktags WHERE id = #{id}")
    result = Linktag.new(linktag.first)
    return result
  end

  def self.update(params)
    sql = "UPDATE linktags SET
      url='#{params['url']}', 
      name='#{params['name']}',
      genre='#{params['genre']}',
      description='#{params['description']}'
      WHERE id='#{params['id']}'"
    Linktag.run_sql(sql)
  end

  def self.destroy(id)
    Linktag.run_sql("DELETE FROM linktags WHERE id = #{id}")
  end

  private

  def self.run_sql(sql)
    begin 
      db = PG.connect({dbname: 'linktag_db', host: 'localhost'})
      result = db.exec(sql)
      return result
    ensure
      db.close
    end
  end

end