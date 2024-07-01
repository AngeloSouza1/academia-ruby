# app/controllers/passwords_controller.rb
class PasswordsController < Devise::PasswordsController
  protected

  def after_resetting_password_path_for(resource)
    # Redirecionar para a página desejada após redefinir a senha com sucesso
    root_path
  end
end
