=begin
require 'glimmer-dsl-libui'

include Glimmer

def ventana()
  window('Form') {
    margined true
    
    vertical_box {
      form {
        @first_name_entry = entry {
          label 'First Name' # label property is available when control is nested under form
        }
        
        @last_name_entry = entry {
          label 'Last Name' # label property is available when control is nested under form
        }
        
        @phone_entry = entry {
          label 'Phone' # label property is available when control is nested under form
        }
        
        @email_entry = entry {
          label 'Email' # label property is available when control is nested under form
        }

        @check = checkbox {
          label 'Idiomas' # label property is available when control is nested under form
        }
      }

      button('Display Info') {
        stretchy false
        on_clicked do
        if @first_name_entry.text != "" && @last_name_entry.text != "" && @phone_entry.text != "" && @email_entry.text != ""
          @idiomas = @check.checked ? "sabe idiomas" : "no sabe idiomas"

          msg_box('Info', "#{@first_name_entry.text} #{@last_name_entry.text} has phone #{@phone_entry.text} and email #{@email_entry.text} and #{@idiomas}")
          @first_name_entry.text = "";
          @last_name_entry.text = "";
          @phone_entry.text = "";
          @email_entry.text = "";
          @check.checked = false;
        else
          msg_box('Error', "No puede haber campos vacios")
        end
      end
      }
    }
  }.show
end

ventana()

=end

require_relative 'ddbb'

class Formulario
  def otro
    db = Implementacion.new
    if db.update()
      puts("Entra")
    else
      msg_box('Error', "Error")
    end
  end
end

Formulario.new.otro