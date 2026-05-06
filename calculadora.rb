require 'glimmer-dsl-libui'
require_relative 'ddbb'

class Calculadora

include Glimmer

  def ventana()
    @ventana=window('Form') {
      margined true
      
      vertical_box {
        form {
          @num1 = entry {
            label 'Primer numero:' # label property is available when control is nested under form
          }
          
          @num2 = entry {
            label 'Segundo numero:' # label property is available when control is nested under form
          }
        }
        horizontal_box{
          stretchy false
          
          vertical_box{
            button('Sumar') {
              stretchy false
              on_clicked do
              if @num1.text != "" && @num2.text != ""
                resultado = @num1.text.to_i + @num2.text.to_i
                msg_box('Resultado suma', "El resultado de #{@num1.text}+#{@num2.text} es: #{resultado}")
              else
                msg_box('Error', "No puede haber campos vacios")
              end
            end
            }

            button('Multiplicar') {
              stretchy false
              on_clicked do
             if @num1.text != "" && @num2.text != ""
                resultado = @num1.text.to_i * @num2.text.to_i
                msg_box('Resultado suma', "El resultado de #{@num1.text}*#{@num2.text} es: #{resultado}")
              else
                msg_box('Error', "No puede haber campos vacios")
              end
            end
            }
              button('Resto') {
              stretchy false
              on_clicked do
              if @num1.text != "" && @num2.text != ""
                resultado = @num1.text.to_i % @num2.text.to_i
                msg_box('Resultado suma', "El resultado de #{@num1.text}%#{@num2.text} es: #{resultado}")
              else
                msg_box('Error', "No puede haber campos vacios")
              end
            end
            }
          }
          vertical_box{
            button('Restar') {
              stretchy false
              on_clicked do
              if @num1.text != "" && @num2.text != ""
                resultado = @num1.text.to_i - @num2.text.to_i
                msg_box('Resultado suma', "El resultado de #{@num1.text}-#{@num2.text} es: #{resultado}")
              else
                msg_box('Error', "No puede haber campos vacios")
              end
            end
            }

            button('Dividir') {
              stretchy false
              on_clicked do
              if @num1.text != "" && @num2.text != ""
                begin
                  resultado = @num1.text.to_f / @num2.text.to_f
                  msg_box('Resultado suma', "El resultado de #{@num1.text}/#{@num2.text} es: #{resultado}")
                rescue ZeroDivisionError => e
                  msg_box('Error', "El divisor no puede ser 0")
                end
              else
                msg_box('Error', "No puede haber campos vacios")
              end
            end
            }

            button('Potencia') {
              stretchy false
              on_clicked do
              if @num1.text != "" && @num2.text != ""
                resultado = @num1.text.to_i ** @num2.text.to_i
                msg_box('Resultado suma', "El resultado de #{@num1.text}#{poner_superindice(@num2.text.to_i)} es: #{resultado}")
              else
                msg_box('Error', "No puede haber campos vacios")
              end
            end
            }
          }     
        }   
      }
    }
    @ventana.show
  end

  def poner_superindice(numero)
      mapa = {
        '0' => "\u2070", '1' => "\u00B9", '2' => "\u00B2",
        '3' => "\u00B3", '4' => "\u2074", '5' => "\u2075",
        '6' => "\u2076", '7' => "\u2077", '8' => "\u2078",
        '9' => "\u2079"
      }
      numero.to_s.chars.map { |char| mapa[char] || char }.join
    end
end

Calculadora.new.ventana