require 'glimmer-dsl-libui'
require_relative 'ddbb'

class Formulario

include Glimmer

  def ventana()
    @ventana=window('Form') {
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
          @tipo = radio_buttons {
            items 'Cliente', 'Admin'
            selected 0
          }

        }

        button('Insert') {
          stretchy false
          on_clicked do
          if @id.text != "" && @user.text != "" && @password.text != "" 
            tipoUsuario = case @tipo.selected
                          when 0 then 'Cliente'
                          when 1 then 'Admin'
                          end
            msg_box('Info', "El usuario #{@user.text} con id #{@id.text} y contraseña #{@password.text} es #{tipoUsuario}")
            self.insertar(@id.text, @user.text, @password.text, tipoUsuario)
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
           if @id.text != ""  && @password.text != "" 
            msg_box('Info', "El usuario #{@user.text} con id #{@id.text} y contraseña #{@password.text} ha sido eliminado")
            self.eliminar(@id.text, @password.text)
            @id.text = "";
            @user.text = "";
            @password.text = "";
          else
            msg_box('Error', "No puede haber campos vacios")
          end
        end
        }

        button('Update') {
          stretchy false
          on_clicked do
          if @id.text != "" && @password.text != "" 
            msg_box('Info', "El usuario #{@user.text} con id #{@id.text} y contraseña #{@password.text} ha sido actualizado")
            self.actualizar(@id.text, @user.text, @password.text)
            @id.text = "";
            @user.text = "";
            @password.text = "";
          else
            msg_box('Error', "Rellena el nombre")
          end
        end
        }

        button('Cerrar') {
          stretchy false
          on_clicked do
          @ventana.destroy
          LibUI.quit
          
        end
        }

      }
    }
    @ventana.show
  end

  def insertar(id, user, password, tipoUsuario)
    db = Implementacion.new
    if db.insert(id, user, password, tipoUsuario)
      puts("Entra")
    else
      msg_box('Error', "Error")
    end
  end

  def eliminar(id, password)
    db = Implementacion.new
    if db.delete(id, password)
      puts("Entra")
    else
      msg_box('Error', "Error")
    end
  end

  def actualizar(id, user, password)
    db = Implementacion.new
    if db.update(id, user, password)
      puts("Entra")
    else
      msg_box('Error', "Error")
    end
  end
end

Formulario.new.ventana