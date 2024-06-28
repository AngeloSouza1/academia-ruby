class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError do
    redirect_to customers_path, alert: "Você não está autorizado a executar esta ação."
  end

  rescue_from ActiveRecord::RecordNotFound do
    redirect_to customers_path, alert: "Registro não encontrado."
  end
end
