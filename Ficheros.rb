if File.exist?("prueba.txt")
  File.open("prueba.txt","r+") do |f|  #r+ para modo lectura y escritura
    contenido_anterior = f.read
    puts contenido_anterior
    f.write("\nNueva linea")
  end
end

File.open("prueba2.txt","w") do |archivo|  #w para modo escritura
  archivo.puts "Texto"
end

if File.exist?("prueba2.txt")
  File.open("prueba2.txt","r") do |archivo|  #r para modo lectura
    archivo.each_line do |linea|
      puts linea
    end
  end
end





