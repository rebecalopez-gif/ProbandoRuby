require 'mysql2'

client = Mysql2::Client.new(
  host:     'localhost',
  username: 'root',
  password: 'pr0gramAr',
  database: 'polideportivo'
)

results = client.query('SELECT * FROM usuario')

results.each do |row|
  puts "#{row['id']} - #{row['user']}"
end