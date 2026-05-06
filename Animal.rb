class Animal

  def initialize(nombre,edad,localizacion)
    @nombre=nombre
    @edad=edad
    @localizacion=localizacion
  end

  def mostrar_datos
    puts "El nombre del animal es #{@nombre}, con #{@edad} años, y está en #{@localizacion}" 
  end

end