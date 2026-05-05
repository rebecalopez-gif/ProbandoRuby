require 'mysql2'

class Implementacion
    SQLQUERY  = "SELECT * FROM usuario"
    SQLINSERT = "INSERT INTO usuario VALUES(?,?,?,?)"
    SQLDELETE = "DELETE FROM usuario WHERE user = ?"
    SQLUPDATE = "UPDATE usuario SET user = ? WHERE user = ?"

  $Implementacion = Mysql2::Client.new(
    host:     'localhost',
    username: 'root',
    password: 'pr0gramAr',
    database: 'polideportivo'
  )

  def select()
    results = $Implementacion.query(SQLQUERY)
    results.each do |row|
      puts "#{row['id']} - #{row['user']}"
    end
  end

  def insert()
    statement = $Implementacion.prepare(SQLINSERT)
    statement.execute("146", "Paco", "123", "CLIENTE")
    statement.affected_rows > 0
  end

  def delete()
    statement = $Implementacion.prepare(SQLDELETE)
    statement.execute("Paco")
    statement.affected_rows > 0
  end

  def update()
    statement = $Implementacion.prepare(SQLUPDATE)
    statement.execute("Juan","cliente1")
    statement.affected_rows > 0
  end
end


