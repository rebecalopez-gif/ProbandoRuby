require 'mysql2'

class Implementacion
    SQLQUERY  = "SELECT * FROM usuario"
    SQLINSERT = "INSERT INTO usuario VALUES(?,?,?,?)"
    SQLDELETE = "DELETE FROM usuario WHERE id = ? AND password = ?"
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

  def insert(id, user, password, tipoUsuario)
    statement = $Implementacion.prepare(SQLINSERT)
    statement.execute(id, user, password, tipoUsuario)
    statement.affected_rows > 0
  end

  def delete(id, password)
    statement = $Implementacion.prepare(SQLDELETE)
    statement.execute(id, password)
    statement.affected_rows > 0
  end

  def update()
    statement = $Implementacion.prepare(SQLUPDATE)
    statement.execute("Juan","cliente1")
    statement.affected_rows > 0
  end
end


