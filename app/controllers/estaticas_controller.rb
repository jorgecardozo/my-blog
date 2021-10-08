class EstaticasController < ApplicationController
  def contacto
    @id     = params[:id].to_i + 10
    @pagina = params[:pagina]
  end

  def nosotros
  end

  def otra
    @message = "Hello from controller"
    @users = ['Jorge', 'Juan', 'Ester']
  end
end
