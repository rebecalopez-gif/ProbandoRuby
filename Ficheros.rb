if File.exist?("prueba.txt")
  File.open("prueba.txt","r+") do |f|  #w para modo escritura
    contenido_anterior = f.read
    puts contenido_anterior
    f.write("\nNueva linea")
  end
end







=begin

if File.exist?("prueba.txt")
  File.open("prueba.txt","r") do |archivo|  #r para modo lectura
    archivo.each_line do |linea|
      puts linea
    end
  end
end
=end




