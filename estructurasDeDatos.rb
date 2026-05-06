def arrays
  array = []

  array = [1, 3 , "xa", true]   # declaracion de array

  array.push("ultimo")  # añadir al final del array
  array.unshift("primero")    # añadir al principio del array
  salida = array.pop(2)   # eliminar desde el ultimo la cantidad indicada y permite almacenarla en una varible
  array.delete_at(3)    # eliminar la posicion indicada
  array.delete(3)    # eliminar el dato que contenga el indicado

  puts array
  puts ""
  puts salida




  arrayNum = []
  arrayNum = [1, 3 , 9, 15] 
  arrayNum.delete_if { |n| n < 8 }   # eliminar los datos dependiendo la condicion (el array debe ser completamente del mismo tipo de dato)
  puts arrayNum
end


def hashes
  hash = {nombre:"Juan", apellido:"Perez",edad:25}
  hash1 = {nombre:"Juan", apellido:"Ramirez",edad:30}

  hash1[:pais] = "España"
  puts hash1

  hash.delete(:apellido)
  puts hash

  nuevo_hash = hash.merge(hash1)
  puts nuevo_hash
end

arrays
hashes