require_relative 'Animal'

class Gato < Animal

  def initialize(nombre,edad,localizacion,color)
    super(nombre,edad,localizacion)
    @color=color
  end

  def maulla
    puts "El gato #{@color}, #{@nombre}, dice: ¡Miau!" 
  end

  alissa=Gato.new("Alissa",2,"Barakaldo","negro")
  alissa.maulla
  alissa.mostrar_datos

end