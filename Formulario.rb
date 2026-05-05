require 'glimmer-dsl-libui'

include Glimmer

def ventana()
  window('Form') {
    margined true
    
    vertical_box {
      form {
        @id = entry {
          label 'ID' # label property is available when control is nested under form
        }
        
        @user = entry {
          label 'User' # label property is available when control is nested under form
        }
        
        @password = entry {
          label 'Password' # label property is available when control is nested under form
        }
        

      }

      button('Insert') {
        stretchy false
        on_clicked do
        if @id.text != "" && @user.text != "" && @password.text != "" 

          @id.text = "";
          @user.text = "";
          @password.text = "";
        else
          msg_box('Error', "No puede haber campos vacios")
        end
      end
      }

      button('Delete') {
        stretchy false
        on_clicked do
        
        @user.text = "";
          
      end
      }

      button('Update') {
        stretchy false
        on_clicked do
        if @user.text != ""

          @user.text = "";
        else
          msg_box('Error', "Rellena el nombre")
        end
      end
      }
    }
  }.show
end

ventana()


require_relative 'ddbb'

class Formulario
  def otro
    db = Implementacion.new
    if db.insert()
      puts("Entra")
    else
      msg_box('Error', "Error")
    end
  end
end

Formulario.new.otro