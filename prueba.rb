#printear saludo
puts "Hola, Mundo!"

#hacer frases con variable
nombre = "Ana"
edad = 28
altura =1.65
es_estudiante = true

puts "#{nombre} tiene #{edad} años."

#condicionales
nota=85
if nota>=90
    puts "Excelente"
elsif nota>=70
    puts "Aprobado"
else
    puts "Necesitas mejorar"
end 

#bucles y ciclos
3.times do
    puts "¡Hola!"
end 

#metodos y clases
class Persona
    def initialize(nombre)
        @nombre=nombre
    end 

    def saludar
        puts "Hola, soy #{@nombre}"
    end
end

juan = Persona.new("Juan")
juan.saludar  #devuelve: Hola, soy Juan

puts 2**3 #raiz 